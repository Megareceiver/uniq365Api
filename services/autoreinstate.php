<?php

	$username = "at";
	$password = "zaq!xsw2";
	$hostname = "localhost";

	date_default_timezone_set('Asia/Bangkok');
	$yesterday = strtotime('yesterday');
	$date = date("Y-m-d",$yesterday);

	//connection to the database
	$dbhandle = mysql_connect($hostname, $username, $password)
	or die("Unable to connect to MySQL");
		// echo "Connected to MySQL<br>";


	//select a database to work with
	$selected = mysql_select_db("uniq365_membership",$dbhandle)
  	or die("Could not select examples");

  	//execute the SQL query and return records
	$result = mysql_query("SELECT a.id as partner_id, a.name as partner_name, b.id as customer_id, b.name as customer_name, c.id as user_id, c.email as email
		FROM partners as a
		JOIN customer as b
			ON a.id = b.partner_id
		JOIN users_as as d
			ON d.partner_id = a.id or d.customer_id = b.id
		JOIN users as c
			ON c.id = d.id
		WHERE a.valid_to = '".$date."'");
		//fetch tha data from the database
		while ($row = mysql_fetch_array($result)) {
			// echo $row['nama_customer'].'</br>';
			mysql_query("UPDATE partners SET active = 0 WHERE id = '".$row['partner_id']."'");
			mysql_query("UPDATE customer SET active = 0 WHERE id = '".$row['customer_id']."'");
			mysql_query("UPDATE users SET active = 0 WHERE id = '".$row['user_id']."'");
		}

?>
