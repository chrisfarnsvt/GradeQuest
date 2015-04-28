<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="final.css">
<?php
$host = "localhost";
$user = "final";
$pwd = "final";
$database = "final_proj";


$db = new mysqli($host, $user, $pwd, $database);
	if(!$db) {
		die ('Connect Error: ' . mysqli_connect_errno());	
	}
	
		if (!isset($_POST['defense'])) {
			exit("data didn't come through, oh dear");
		}
		else {
		     echo '<title>Creation Failed ;_;</title>';
		}
 		$str = $_POST['strength'];
		$def = $_POST['defense'];
		$dod = $_POST['dodge'];
		$name = $_POST['name'];
		$total = $str + $def + $dod;
		if ($str < 0 || $def < 0 || $dod < 0 || str_word_count($name) == 0) {	
		   echo '<title>Creation Failed ;_;</title>
		   </head>
		   <body>
		   <p>You either typed in a negative attribute, or no name. How embarrassing.</p>';
		}
		else if ($total == 10) {
		   
		   //get the player_id
		   $query = "SELECT COALESCE(MAX(player_id), 0) AS player_id FROM players";
		   $results = $db->query($query);
		   if (!$results)
			exit($query . " failed");
	           $results->data_seek(0);
		   $row = $results->fetch_assoc();
		   $player_id = $row['player_id'] + 1;

	           //insert basic player info
		   $query = "INSERT INTO players (battles_left, equipped_item_id, exp_until_lvlup, name, player_id) VALUES (10, 1, 100, '" . $name . "', " . $player_id . "), (10, 4, 100, '" . $name . "', " . $player_id . "), (10, 5, 100, '" . $name . "', " . $player_id . ");";
		   if (!$db->query($query))
			exit($query . " failed");

		   //set the new player's attributes
		   $query = "INSERT INTO attribute_sets (defense_points, dodge_chance, hit_points, level, player_id, strength) VALUES (" . $def . ", " . $dod . ", 100, 1, " . $player_id . ", " . $str . ");";
		   if (!$db->query($query))
			exit($query . " failed");

		   $db->close();

		   echo '<title>Success!</title>
		   </head>
		   <body>
		   <p>Character created</p>';
		}
		else {
		   echo '<title>Creation Failed ;_;</title>
		   </head>
		   <body>
		   <p>Character needs to have a total of 10 points, please try again.</p>';
		}
	?>
		<a href='home.php'><button class='submit'>Back</button></a>
	</body>
</html>
