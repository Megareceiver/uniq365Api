<?php
/**
 * UNIQ365 API :: Membership section
 * Put every function to provide membership needs here.
 * I recommend creating another file to place other API codes that do not belong to the main group, depending on need.
 * 2018, January
 * By Megantara Narapadya
 * megareceiver@gmail.com
 **/

use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

$section = "/membership";
$app = new \Slim\App;

// Get All Module list
$app->get($section.'/modules', function(Request $request, Response $response){
  try {
    $sql =
    "SELECT s.id as `id`, m.name as `module`, g.name as `group`, s.name as `name`
    FROM modules_sub s
    JOIN modules m ON s.id_modules = m.id
    JOIN modules_group g ON s.id_modules_group = g.id
    ORDER BY m.sequence, g.sequence, s.id ASC
    ";

    // Get database object
    $db = new db();
    // connect
    $db = $db->connect('system');

    //statement
    $statement = $db->query($sql);
    $result = $statement->fetchAll(PDO::FETCH_OBJ);
    $db = null;

    $refactor = array();
    for($loop=0;$loop<count($result);$loop++){
      $refactor[$result[$loop]->module][$result[$loop]->group][$loop]['id'] = $result[$loop]->id;
      $refactor[$result[$loop]->module][$result[$loop]->group][$loop]['name'] = $result[$loop]->name;
    }

    echo json_encode($refactor);

  } catch(PDOException $e) {
    echo '{"error": {"text": '.$e->getMessage().'}}';
  }
});
