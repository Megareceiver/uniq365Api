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
    $company_id = $args['company_id'];

    // STEP 1 ------------------------------------------------------------------
    // Get all sub modules id on chosen plan
    $sql =
    "SELECT pm.module_id as id_modules_sub, pm.active as active, s.name
     FROM uniq365_membership.users u
     JOIN uniq365_membership.payment_plan_modules pm ON u.premium_planid = pm.plan_id
     JOIN uniq365_system.modules_sub s ON pm.module_id = s.id
     WHERE u.username = '$company_id'
     ";

    // Get database object
    $db = new db();
    // connect
    $db = $db->connect('membership');

    //statement
    $statement = $db->query($sql);
    $result = $statement->fetchAll(PDO::FETCH_OBJ);
    $db = null;

    // // STEP 2 ------------------------------------------------------------------
    // // Get all sub modules
    // $sql =
    // "SELECT pm.module_id as id_modules_sub, pm.active as active
    //  FROM users u
    //  JOIN payment_plan_modules pm ON u.premium_planid = pm.plan_id
    //  WHERE u.username = '$company_id'
    //  ";
    //
    // // Get database object
    // $db = new db();
    // // connect
    // $db = $db->connect('system');
    //
    // //statement
    // $statement = $db->query($sql);
    // $result = $statement->fetchAll(PDO::FETCH_OBJ);
    // $db = null;

    echo json_encode($result);
    // echo ($result[0]->id_modules_sub);

  } catch(PDOException $e) {
    echo '{"error": {"text": '.$e->getMessage().'}}';
  }
});
