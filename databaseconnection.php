<?php
function database_connect() {
        $host = "localhost";
	$user = "final";
	$pwd = "final";
	$database = "final_proj";

	$gendb = new mysqli($host, $user, $pwd, $database);

		if(!$gendb)
			die ('Connect Error: ' . mysqli_connect_errno	());
	return $gendb;	
}	
?>
