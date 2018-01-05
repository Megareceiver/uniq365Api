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
          $connection->dbname = 'uniq356_system';
        break;

        case 'membership':
          // Membership connection
          #$connection->dbhost = 'localhost';
          #$connection->dbuser = 'root';
          #$connection->dbpass = 'root';
          #$connection->dbname = '';
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

    // Connect
    public function connect($connection_select){
      $connection = $this->connection($connection_select);

      $mysql_connect_str = "mysql:host=$connection->dbhost;dbname=$connection->dbname;";
      $dbconnection = new PDO($mysql_connect_str, $connection->dbuser, $connection->dbpass);
      $dbconnection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

      return $dbconnection;
    }
  }

?>
