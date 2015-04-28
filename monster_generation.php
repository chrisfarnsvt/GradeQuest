<?php
//construct and insert a new (somewhat-randomized) monster
function generate_monster($db, $level) {
	$next_monster = next_monster_id($db);
	$query = "SELECT p.part_id, p.name_modifier, p.name_position, p.rarity, p.type_id FROM parts p JOIN item_types i ON i.type_id = p.type_id WHERE p.level_required <= " . $level . " AND i.type_name = 'MONSTER' ORDER BY p.name_position, p.rarity DESC;";
	$result = $db->query($query);
	if(!$result)
		exit($query . " failed");
	$monster_parts = get_monster_parts($db, $level);
	
	//insert basic monster info
	$query = "INSERT INTO monsters (monster_id, monster_modifier, name) VALUES ";
	if ($monster_parts[0] != get_monster_na_id($db))
		$query = $query . "(" . $next_monster . ", " . $monster_parts[0] . ", '" . get_monster_name($db, $monster_parts) . "'), ";

	$query = $query . "(" . $next_monster . ", " . $monster_parts[1] . ", '" . get_monster_name($db, $monster_parts) . "')";
	
	if($monster_parts[2] != get_monster_na_id($db))
		$query = $query . ", (" . $next_monster . ", " . $monster_parts[2] . ", '" . get_monster_name($db, $monster_parts) . "');";
	if (!$db->query($query))
		exit($query . " failed");

	//set the new monster's attributes
	$query = "INSERT INTO attribute_sets (defense_points, dodge_chance, hit_points, level, monster_id, strength) VALUES (" . ($level * 3) . ", " . $level . ", " . (20 * $level) . ", " . $level . ", " . $next_monster . ", " . ($level * 5) . ");";
	if (!$db->query($query))
		exit($query . " failed");
}

//gets next monster_id (since monster id doesn't auto-inc)
function next_monster_id($db) {
	$query = "SELECT COALESCE(MAX(monster_id), 0) AS monster_id FROM monsters;";
	$result = $db->query($query);
	if (!$result)
		exit($query . " failed");
	$result->data_seek(0);
	$row = $result->fetch_assoc();
	$monster_id = $row['monster_id'] + 1;
	return $monster_id;
}

//get the ID of the "null" part (effectively, that's what N/A is)
function get_monster_na_id($db) {
	$query = "SELECT p.part_id FROM parts p JOIN item_types i ON p.type_id = i.type_id WHERE i.type_name = 'MONSTER' AND p.name_modifier = 'N/A';";
	$result = $db->query($query);
	if (!$result)
		exit($query . " failed");
	$result->data_seek(0);
	$row = $result->fetch_assoc();
	return $row['part_id'];
}

//gets an array of three parts a monster could be made of
function get_monster_parts($db, $level) {
	$query = "SELECT p.part_id, p.name_position, p.rarity,  p.name_modifier FROM parts p JOIN item_types i ON p.type_id = i.type_id WHERE i.type_name = 'MONSTER' AND p.level_required <= " . $level . " AND p.name_modifier != 'N/A' ORDER BY p.name_position, p.rarity;";
	$result = $db->query($query);
	if(!$result)
		exit($query . " failed");
	$mod1 = 0;
	$mod2 = 0; 
        $mod3 = 0;
	$has_mod_1 = rand(0, 1);
	$has_mod_2 = true; //there's always modifier #2
	$has_mod_3 = rand(0, 1);
	$result_array = array();
	for ($i = 0; $i < $result->num_rows; $i++) {
		$result->data_seek($i);
		$row = $result->fetch_assoc();	
		$check = rand(1, 100);
		if ($has_mod_1 && $row['name_position'] == 1) {
			$test = (100 / $row['rarity']);
 			if ($check <= $test) { //success
				$mod1 = $row['part_id'];
				$has_mod_1 = false;
			}		
		}
		else if ($has_mod_2 && $row['name_position'] == 2) {
			$test = (100 / $row['rarity']);
 			if ($check <= $test) { //success
				$mod2 = $row['part_id'];
				$has_mod_2 = false;
			}				
		}

		else if ($has_mod_3 && $row['name_position'] == 3) {
			$test = (100 / $row['rarity']);
 			if ($check <= $test) { //success
				$mod3 = $row['part_id'];
				$has_mod_3 = false;
			}				
		}
	}
	$na_id = get_monster_na_id($db);
	
	if ($mod1 != 0)
		array_push($result_array, $mod1);
	else
		array_push($result_array, $na_id);

	array_push($result_array, $mod2); //mod2 always exists

	if ($mod3 != 0)
		array_push($result_array, $mod3);
	else
		array_push($result_array, $na_id);
	return $result_array;
}

//please note: parts_arr must be in order of their name modifier. 
//suggested to use array from get_monster_parts
function get_monster_name($db, $parts_arr) {
	$na_id = get_monster_na_id($db);
	$name = "";
	for ($i = 0; $i < 3; $i++) {
		if ($parts_arr["$i"] != $na_id) {
			$query = "SELECT p.name_modifier FROM parts p JOIN item_types i ON p.type_id = i.type_id WHERE p.part_id = " . $parts_arr["$i"] . ";";
			$result = $db->query($query);
			if (!$result)
				exit($query . " failed");
			$result->data_seek(0);
			$row = $result->fetch_assoc();
			if ($i == 2)
				$name = $name . "of ";
			$name = $name . $row['name_modifier'] . " ";
		}
	}
	return $name;
}
?>
