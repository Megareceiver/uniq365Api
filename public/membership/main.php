<?php
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

$app = new \Slim\App;

// Get All Module list
$app->get('/membership/modules', function(Request $request, Response $response){
  $sql =
  "SELECT
   s.id as `id`, m.name as `module`, g.name as `group`, s.name as `name`
   FROM
   modules_sub s
   JOIN modules m ON s.id_modules = m.id
   JOIN modules_group g ON s.id_modules_group = g.id
   ORDER BY m.sequence, g.sequence, s.id ASC
   ";

  try {
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
