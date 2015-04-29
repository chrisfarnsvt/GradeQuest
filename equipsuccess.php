<!DOCTYPE html>
<html>
	<head>
		<title>Equip Successful!</title>
		<link rel="stylesheet" type="text/css" href="final.css">
	</head>
	<body>
<?php
	include 'databaseconnection.php';
	include 'character_functions.php';
	if (!isset($_POST['character_select']))
			exit("data didn't come through, oh dear");
	$db = database_connect();
	$char_id = intval($_POST['character_select']);
	$new_weapon = intval($_POST['Weapon_select']);
	$new_armor = intval($_POST['Armor_select']);
	$new_trink = intval($_POST['Trinket_select']);

	$char_level = get_char_level($db, $char_id);
	$highest_item_level = max(get_item_level($db, $new_weapon), get_item_level($db, $new_armor), get_item_level($db, $new_trink));

	if ($char_level < $highest_item_level)
		exit("<p>You can't equip an item at a higher level than your characters, sorry bud.</p><a href='equip.php'><button class='submit'>Back</button></a>");

	//$query = "SELECT 

	//un-equip all items (just because it's easier than working
	//them out individually for now)
	$query = "SELECT equipped_item_id FROM players WHERE player_id = " . $char_id . ";";
	$result = $db->query($query);
	if(!$result)
		exit($query . " failed");
	for($i = 0; $i < $result->num_rows; $i++) {
		$result->data_seek($i);
		$row = $result->fetch_assoc();
		$query = "UPDATE equipment SET used_by_player = 0 WHERE equipment_id = " . $row['equipped_item_id'] . ";";
		if (!$db->query($query))
			exit($query . " failed");
	}

	//now, equip all items. note: N/A items should never be set
	//as being used by a player
	session_start();
	$_SESSION['curr_player'] = $char_id;
	$query = "UPDATE players p JOIN equipment e ON p.equipped_item_id = e.equipment_id JOIN item_types i ON e.type_id = i.type_id SET p.equipped_item_id = " . $new_weapon . " WHERE i.type_name = 'WEAPON' AND p.player_id = " . $char_id . ";";
		if (!$db->query($query))
			exit($query . " failed");
	$query = "UPDATE players p JOIN equipment e ON p.equipped_item_id = e.equipment_id JOIN item_types i ON e.type_id = i.type_id SET p.equipped_item_id = " . $new_armor . " WHERE i.type_name = 'ARMOR' AND p.player_id = " . $char_id . ";";
		if (!$db->query($query))
			exit($query . " failed");
	$query = "UPDATE players p JOIN equipment e ON p.equipped_item_id = e.equipment_id JOIN item_types i ON e.type_id = i.type_id SET p.equipped_item_id = " . $new_trink . " WHERE i.type_name = 'TRINKET' AND p.player_id = " . $char_id . ";";
		if (!$db->query($query))
			exit($query . " failed");
		$new_equip_arr = array($new_weapon, $new_armor, $new_trink);
		for ($i = 0; $i < count($new_equip_arr); $i++) {
			if (strcmp(get_item_name($db, $new_equip_arr[$i]), 'N/A ') != 0) {
				$query = "UPDATE equipment SET used_by_player = true WHERE equipment_id = " . $new_equip_arr[$i] . ";";			
				if(!$db->query($query))
					exit($query . " failed");
			}		
		}
?>
		<p>Well, that worked.</p><br/><a href='battleground.php'><button class='submit'>Back</button></a>
	</body>
</html>
