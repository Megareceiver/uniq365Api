<?php
error_reporting(-1);
ini_set('display_errors', 1);
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

require '../vendor/autoload.php';
require 'config/config.php';
require 'config/database.php';
require 'library/passwordhash.php';

$app = new \Slim\App;

// Membership router
require 'membership/main.php';

// Uniq router
require 'uniq/main.php';

$app->run();

?>
