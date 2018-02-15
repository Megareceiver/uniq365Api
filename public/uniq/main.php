<?php
/**
 * UNIQ365 API :: UNIQ section
 * Put every function to provide UNIQ365 needs here.
 * I recommend creating another file to place other API codes that do not belong to the main group, depending on need.
 * 2018, January
 * By Megantara Narapadya
 * megareceiver@gmail.com
 **/

use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

$section = "/uniq";

// Get All Modules list depends on the company's chosen plan
$app->get($section.'/modules/{company_id}', function(Request $request, Response $response, array $args){
  try {
    // Catch arguments
    $company_id    = $args['company_id'];
    // Get database object
    $db            = new db();

    // connect
    $system_db     = $db->connection('system');
    $membership_db = $db->connection('membership');
    $db            = $db->connect('membership');

    // STEP 1 ------------------------------------------------------------------
    // Get all sub modules id on chosen plan
    $sql =
    "SELECT s.id as `id`, m.name as `module`, g.name as `group`, s.name as `name`, pm.active as active
     FROM ".$membership_db->dbname.".customer c
     JOIN ".$membership_db->dbname.".users_as a ON c.id = a.customer_id
     JOIN ".$membership_db->dbname.".users u ON a.id = u.id
     JOIN ".$membership_db->dbname.".payment_plan_modules pm ON u.premium_planid = pm.plan_id
     JOIN ".$system_db->dbname.".modules_sub s ON pm.module_id = s.id
     JOIN ".$system_db->dbname.".modules m ON s.id_modules = m.id
     JOIN ".$system_db->dbname.".modules_group g ON s.id_modules_group = g.id
     WHERE c.company_id = '$company_id' ORDER BY s.id";

    //statement
    $statement = $db->query($sql);
    $result = $statement->fetchAll(PDO::FETCH_OBJ);
    $db = null;

    $refactor = array();
    for($loop=0;$loop<count($result);$loop++){
      if(!isset($refactor[$result[$loop]->module]['status']))
        $refactor[$result[$loop]->module]['status'] = 0;

      if(!isset($refactor[$result[$loop]->module][$result[$loop]->group]['status']))
        $refactor[$result[$loop]->module][$result[$loop]->group]['status'] = 0;

      $refactor[$result[$loop]->module]['status'] += (int)$refactor[$result[$loop]->module][$result[$loop]->group]['status'];
      $refactor[$result[$loop]->module][$result[$loop]->group]['status'] += (int)$result[$loop]->active;
      $refactor[$result[$loop]->module][$result[$loop]->group][$loop]['id'] = $result[$loop]->id;
      $refactor[$result[$loop]->module][$result[$loop]->group][$loop]['name'] = $result[$loop]->name;
      $refactor[$result[$loop]->module][$result[$loop]->group][$loop]['active'] = $result[$loop]->active;

      if($refactor[$result[$loop]->module]['status'] > 1)
      $refactor[$result[$loop]->module]['status'] = 1;

      if($refactor[$result[$loop]->module][$result[$loop]->group]['status'] > 1)
        $refactor[$result[$loop]->module][$result[$loop]->group]['status'] = 1;
    }

    echo json_encode($refactor);
    // echo json_encode(array_count_values($refactor['SALES']['OPERATIONS']));


  } catch(PDOException $e) {
    echo '{"error": {"text": '.$e->getMessage().'}}';
  }
});

$app->get($section.'/activeusers/{company_id}', function(Request $request, Response $response, array $args){
  try {
    // Catch arguments
    $company_id    = $args['company_id'];
    // Get database object
    $db            = new db();
    $db            = $db->connect('membership');

    // STEP 1 ------------------------------------------------------------------
    // Get all sub modules id on chosen plan
    $sql =
    "SELECT userquota
     FROM customer c JOIN
     users_as a ON c.id = a.customer_id JOIN
     users u ON a.id = u.id
     JOIN payment_plans pm ON u.premium_planid = pm.id
     WHERE company_id = '$company_id'
     ";

    //statement
    $statement = $db->query($sql);
    $result = $statement->fetch(PDO::FETCH_OBJ);
    $db = null;

    echo (int)$result->userquota;

  } catch(PDOException $e) {
    echo '{"error": {"text": '.$e->getMessage().'}}';
  }
});

$app->post($section.'/accountbook/list', function(Request $request, Response $response){
  try {
    // Catch arguments
    $data        = $request->getParsedBody();
    $username    = $data['username'];
    $password    = $data['password'];
    $password    = base64_decode($password);


    // Get database object
    $db            = new db();
    $db            = $db->connect('membership');

    // STEP 1 ------------------------------------------------------------------
    // Get user identity
    $sql =
    " SELECT u.username, u.password FROM users u
      WHERE
      u.username = '".$username."'
     ";

    //statement
    $statement = $db->query($sql);
    $result = $statement->fetch(PDO::FETCH_OBJ);

    if($result->username && $result->password){
      $phpass = new passwordhash(12, false);
      if (!$phpass->CheckPassword($password, $result->password)) {
          echo '{"error": {"text": "Invalid login!"}}';
          return false;
      }

      // STEP 2 ------------------------------------------------------------------
      // Get accountbook
      $sql =
      " SELECT c.name, c.company_id as id FROM
        partners p
        JOIN users_as a ON p.id = a.partner_id
        JOIN customer c ON c.partner_id = p.id
        JOIN users u ON a.id = u.id
        WHERE
        u.username = '".$username."' AND c.company_id != ''
       ";

      //statement
      $statement = $db->query($sql);
      $result = $statement->fetchAll(PDO::FETCH_OBJ);
      $db = null;

      echo json_encode($result);
    }else{
      echo '{"error": {"text": "Invalid login!"}}';
    }
  } catch(PDOException $e) {
    echo '{"error": {"text": '.$e->getMessage().'}}';
  }
});

//function to update uniq user auth from membership
// Set system pref
$app->get($section.'/register/new/{code}', function(Request $request, Response $response, array $args){
  try {

    $data = $args['code'];
    $explodedata = explode(",",$data);

    $company_id = $explodedata[0];
    $username	= $explodedata[1];
    $password	= $explodedata[2];

    $db = new db();
    $db = $db->connect('membership');

    $sql = "SELECT * FROM users_global WHERE company_id ='".$company_id."' AND username = '".$username."'";

    $statement = $db->query($sql);
    $result = $statement->fetchAll(PDO::FETCH_OBJ);

    if(count($result) == 0){
      $sql        = "INSERT users_global (username,password,company_id, apps) VALUES ('".$username."' ,'".$password."' ,'".$company_id."', 'UNIQ365');";
      $statement = $db->exec($sql);

      echo '{"result": {"text": "Account has been successfully registered"}}';
    }else{
      echo '{"error": {"text": "Account is already exist!"}}';
    }
  } catch(PDOException $e) {
    echo '{"error": {"text": '.$e->getMessage().'}}';
  }
});

$app->get($section.'/register/update/{code}', function(Request $request, Response $response, array $args){
  try {

    $data = $args['code'];
    $explodedata = explode(",",$data);

    $company_id = $explodedata[0];
    $username	= $explodedata[1];
    $password	= $explodedata[2];

    $db = new db();
    $db = $db->connect('membership');

    $sql = "SELECT * FROM users_global WHERE company_id ='".$company_id."' AND username = '".$username."'";

    $statement = $db->query($sql);
    $result = $statement->fetchAll(PDO::FETCH_OBJ);

    if(count($result) > 0){
      $sql        = "UPDATE users_global SET password = '".$password."' WHERE username = '".$username."' AND company_id = '".$company_id."'";
      $statement = $db->exec($sql);

      echo '{"result": {"text": "Account has been successfully updated"}}';
    }else{
      echo '{"error": {"text": "Account is not exist!"}}';
    }

  } catch(PDOException $e) {
    echo '{"error": {"text": '.$e->getMessage().'}}';
  }
});

// get company ID from user global

$app->post($section.'/getcompany/', function(Request $request, Response $response, array $args){
  try {

    // $data = $args['code'];
    // $explodedata = explode(",",$data);
    //$company_id = $explodedata[0];
    // $username = $explodedata[0];
    // $password = $explodedata[1];

    // Catch arguments
    $data        = $request->getParsedBody();
    $username    = $data['username'];
    $password    = md5($data['password']);

    $db = new db();
    $db = $db->connect('membership');

    $sql = "SELECT company_id FROM users_global WHERE password ='".$password."' AND username = '".$username."'";

    $statement = $db->query($sql);
    $result = $statement->fetchAll(PDO::FETCH_OBJ);

    if(count($result) > 0){
      // $sql        = "UPDATE users_global SET password = '".$password."' WHERE username = '".$username."' AND company_id = '".$company_id."'";
      // $statement = $db->exec($sql);
      echo json_encode($result);
    }else{
       echo '{"error": {"text": "Invalid login!"}}';
    }

  } catch(PDOException $e) {
    echo '{"error": {"text": '.$e->getMessage().'}}';
  }
});