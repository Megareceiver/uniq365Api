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

// Get All Module list
$app->get($section.'/modules', function(Request $request, Response $response){
  try {
    // Get database object & connect
    $db = new db();
    $db = $db->connect('system');

    $sql =
    "SELECT s.id as `id`, m.name as `module`, g.name as `group`, s.name as `name`
    FROM modules_sub s
    JOIN modules m ON s.id_modules = m.id
    JOIN modules_group g ON s.id_modules_group = g.id
    ORDER BY m.sequence, g.sequence, s.id ASC
    ";

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

// Set New Account Book
$app->get($section.'/new/accountbook/{company_id}', function(Request $request, Response $response, array $args){
  try {
    // Catch arguments
    $company_id = $args['company_id'];
    $filename = config_path.$company_id.".php";
    if (!file_exists($filename)) {
      // Get database object & connect
      $control   = new db();
      $db        = $control->connect();
      $config    = $control->connection_config($company_id);
      $newdb     = database_prefix.$company_id;

      //Create new database
      $sql       = "CREATE DATABASE ".$newdb;
      $statement = $db->exec($sql);
      // $statement = true;

      if($statement){
        $response = $control->clone_database($newdb);
        $db = null;
        // Create account book config
        write_config($filename, $config);
        echo '{"result": {"text": "New Account Book has been created"}}';
      }else{
        echo '{"error": {"text": "There was an error during create new database!"}}';
      }
    }else{
      echo '{"error": {"text": "Account Book Already Exists!"}}';
    }

  } catch(PDOException $e) {
    echo '{"error": {"text": '.$e->getMessage().'}}';
  }
});


// function to create file config account book
function write_config($filename, $config) {
    $fh = fopen($filename, "w");
    if (!is_resource($fh)) {
        return false;
    }

    fwrite($fh, '<?php '.$config.' ?>');
    fclose($fh);

    return true;
}

#function read_config($filename) {
#    return parse_ini_file($filename, false, INI_SCANNER_NORMAL);
#}

?>
