<!DOCTYPE html>
<html>
	<head>
		<title>Equip Stuff</title>
		<link rel="stylesheet" type="text/css" href="final.css">
	</head>
	<body>
		<h3>Inventory</h3>
		<form action='equipsuccess.php' method='POST'>
		    <?php
			include 'databaseconnection.php';
			include 'item_generation.php';
			include 'character_functions.php';
			$db = database_connect();
			echo get_equipped_table($db) . "<br/>";		
			echo "<p>Each character and item ends with a number representing their level. You must pick items at or lower than your selected character's level.</p><table class='invisible_table'>";	
			echo "<tr><td class='table_cell_left'>Character:</td><td class='table_cell_right'>" . get_char_dropdown($db) . "</td></tr>";
			echo "<tr><td class='table_cell_left'>Weapon:</td><td class='table_cell_right'>" . get_inv_dropdown($db, 'Weapon') . "</td></tr>";
			echo "<tr><td class='table_cell_left'>Armor:</td><td class='table_cell_right'>" . get_inv_dropdown($db, 'Armor') . "</td></tr>";
			echo "<tr><td class='table_cell_left'>Trinket:</td><td class='table_cell_right'>" . get_inv_dropdown($db, 'Trinket') . "</td></tr>";
		      ?>
		</table><br/>
		      <input type='submit' value='Equip' class='submit'><br/>
		</form><br/>
		<a href='battleground.php'><button class='submit'>Back</button></a>
	</body>
</html>
