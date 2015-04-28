<!DOCTYPE html>
<html>
	<head>
		<title>Previous Fights</title>
		<link rel="stylesheet" type="text/css" href="final.css">
	</head>
	<body>
		<h3>Let us reflect on the skirmishes of yore...</h3>
		<div class='scroll_table'><table class='scroll_table_width'>
			<tr><th>Player</th><th>Foe</th><th>Win?</th></tr>
		<?php
			include "databaseconnection.php";
			$db = database_connect();
			$query = "SELECT player_id, monster_id, battle_won FROM battleground;";
			$result = $db->query($query);
			if(!$result)
				exit($query . " failed");
			for($i = 0; $i < $result->num_rows; $i++) {
				$player_name = "";
				$monster_name = "";
				$won = "";
				$result->data_seek($i);
				$row = $result->fetch_assoc();
				$query = "SELECT name FROM players WHERE player_id = " . $row['player_id'] . ";";
				$player_res = $db->query($query);
				if(!$player_res)
					exit($query . " failed");
				$player_res->data_seek(0);
				$player_row = $player_res->fetch_assoc();
				$player_name = $player_row['name'];
				$query = "SELECT name FROM monsters WHERE monster_id = " . $row['monster_id'] . ";";
				$monster_res = $db->query($query);
				if(!$monster_res)
					exit($query . " failed");
				$monster_res->data_seek(0);
				$monster_row = $monster_res->fetch_assoc();
				$monster_name = $monster_row['name'];
				if ($row['battle_won'] == 0)
					$won = "No";
				else
					$won = "Yes";
				echo "<tr><td>" . $player_name . "</td><td>" . $monster_name . "</td><td>" . $won . "</td></tr>";
			}
		?>		
		</table></div><br/>
		<a href='battleground.php'><button class='submit'>Back</button></a>
	</body>
</html>
