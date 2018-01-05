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

$section = "/helpdesk";
$app = new \Slim\App;

// Get All Modules list depends on the company's chosen plan
$app->post($section.'/userinfo', function(Request $request, Response $response){
  try {
    // Catch arguments
    $company_id = $request->getParam('company_id');
    $username   = $request->getParam('username');
    $password   = $request->getParam('password');

    // Get database object & connect
    $db  = new db();
    $db  = $db->connect('membership');

    // STEP 1 ------------------------------------------------------------------
    // Get all sub modules id on chosen plan
    $sql =
    "SELECT username
     FROM users u
     WHERE u.username = '$company_id'
     ";

    //statement
    $statement = $db->query($sql);
    $result = $statement->fetchAll(PDO::FETCH_OBJ);
    $db = null;

    echo json_encode($result);

  } catch(PDOException $e) {
    echo '{"error": {"text": '.$e->getMessage().'}}';
  }
});
