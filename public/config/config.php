<?php
  /**
   * API Configurations
   */

   # Set path for global routes
   define('config_path', '../accountbook/');
   define('database_path', '../accountbook/');

   # Set dumb file for clone database while create new account book
   define('dumb_database', 'uniq365_empty');

   # Set database attributes
   define('database_prefix', 'uniq365_');

   // # Set access allow header
   // define('access_list', [
   //   'http://qa.uniq365.com',
   //   'https://qa.uniq365.com',
   //   'uniq365.local/'
   // ]);

   // if (in_array($_SERVER['HTTP_ORIGIN'], access_list)) {
   if (isset($_SERVER['HTTP_ORIGIN'])) {
       header('Access-Control-Allow-Origin: '.$_SERVER['HTTP_ORIGIN']);
       header('Access-Control-Allow-Methods: GET, PUT, POST, DELETE, OPTIONS');
       header('Access-Control-Max-Age: 1000');
       header('Access-Control-Allow-Headers: Content-Type, Authorization, X-Requested-With');
  }
?>
