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
$app = new \Slim\App;

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
     FROM ".$membership_db->dbname.".users u
     JOIN ".$membership_db->dbname.".payment_plan_modules pm ON u.premium_planid = pm.plan_id
     JOIN ".$system_db->dbname.".modules_sub s ON pm.module_id = s.id
     JOIN ".$system_db->dbname.".modules m ON s.id_modules = m.id
     JOIN ".$system_db->dbname.".modules_group g ON s.id_modules_group = g.id
     WHERE u.username = '$company_id'
     ";

    //statement
    $statement = $db->query($sql);
    $result = $statement->fetchAll(PDO::FETCH_OBJ);
    $db = null;

    $refactor = array();
    for($loop=0;$loop<count($result);$loop++){
      $refactor[$result[$loop]->module][$result[$loop]->group][$loop]['id'] = $result[$loop]->id;
      $refactor[$result[$loop]->module][$result[$loop]->group][$loop]['name'] = $result[$loop]->name;
      $refactor[$result[$loop]->module][$result[$loop]->group][$loop]['active'] = $result[$loop]->active;
    }

    echo json_encode($refactor);

  } catch(PDOException $e) {
    echo '{"error": {"text": '.$e->getMessage().'}}';
  }
});
