<?php
  /**
   * Databases configuration
   */
  class db {
    function __construct()
    {

    }

    public function connection($connection_select){
      // Properties
      $connection = new StdClass();
      $connection->dbhost = 'localhost';
      $connection->dbuser = 'root';
      $connection->dbpass = 'root';
      $connection->dbname = '';

      // Select connection attibute base on choose
      switch ($connection_select) {
        case 'system':
          // System connection
          $connection->dbhost = 'localhost';
          $connection->dbuser = 'root';
          $connection->dbpass = 'root';
          $connection->dbname = 'uniq365_system';
        break;

        case 'membership':
          // Membership connection
          $connection->dbhost = 'localhost';
          $connection->dbuser = 'root';
          $connection->dbpass = 'root';
          $connection->dbname = 'uniq365_membership';
        break;

        case 'helpdesk':
          // Helpdesk connection
          #$connection->dbhost = 'localhost';
          #$connection->dbuser = 'root';
          #$connection->dbpass = 'root';
          #$connection->dbname = '';
        break;

        case 'uniq':
          // Uniq connection
          #$connection->dbhost = 'localhost';
          #$connection->dbuser = 'root';
          #$connection->dbpass = 'root';
          #$connection->dbname = '';
        break;

      }

      return $connection;

    }

    public function clone_database($dbtarget){
      $connection = $this->connection('default');
      $dumb_database  = dumb_database;
      //Export the database and output the status to the page

      $response = shell_exec("mysqldump -h ".$connection->dbhost. " -u " .$connection->dbuser." -p" .$connection->dbpass." ".$dumb_database." | mysql -h ".$connection->dbhost. " -u " .$connection->dbuser." -p" .$connection->dbpass." ".$dbtarget);

      return $response;
    }

    // Connect
    public function connect($connection_select = ""){
      $connection = $this->connection($connection_select);
      $selectdata = ($connection->dbname != "" ? "dbname=$connection->dbname;" : "");

      $mysql_connect_str = "mysql:host=$connection->dbhost;".$selectdata;
      $dbconnection = new PDO($mysql_connect_str, $connection->dbuser, $connection->dbpass);
      $dbconnection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

      return $dbconnection;
    }

    public function connection_config($company_id){
      $config =
      '
        $active_group = "'.$company_id.'";
        $active_record = TRUE;
        $db["'.$company_id.'"] = array(
        	"hostname"=>"localhost",
        	"database"=>"'database_prefix.$company_id.'",
        	"username"=>"uniq",
        	"password"=>"B@ndung123",
        	"dbdriver"=>"mysql",
        	"dbprefix"=>"",
        	"license"=>"at-92436332-1017"
        ); ';

      return $config;
    }
  }

?>
