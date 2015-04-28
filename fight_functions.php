<?php

//returns {player_name, health, strength, defense, dodge_chance, level, exp_remaining}
function get_player_stats_array($db, $player_id) {
	//whatever this returns, we only really need the first row
	$query = "SELECT p.name, a.hit_points, a.strength, a.defense_points, a.dodge_chance, a.level, p.exp_until_lvlup FROM players p JOIN attribute_sets a ON p.player_id = a.player_id WHERE p.player_id = " . $player_id . ";";
	$result = $db->query($query);
	if(!$result)
		exit($query . " failed");
	$result->data_seek(0);
	$row = $result->fetch_assoc();
	$result_arr = array($row['name'], $row['hit_points'], $row['strength'], $row['defense_points'], $row['dodge_chance'], $row['level'], $row['exp_until_lvlup']);
	return $result_arr;
}

//returns {strength, defense, dodge_chance}
function get_player_modifiers($db, $player_id) {
	$res_arr = array(0, 0, 0);
	$query = "SELECT pa.stat_modified, pa.stat_modifier FROM parts pa JOIN equipment e ON pa.part_id = e.part_id JOIN players pl ON e.equipment_id = pl.equipped_item_id JOIN item_types i ON pa.type_id = i.type_id WHERE pl.player_id = " . $player_id . " AND i.type_name != 'TRINKET';";
	$result = $db->query($query);
	if(!$result)
		exit($query . " failed");
	for($i = 0; $i < $result->num_rows; $i++) {
		$result->data_seek($i);
		$row = $result->fetch_assoc();
		$stat = $row['stat_modified'];
		if (strcasecmp($stat, "Strength") == 0) {
			$res_arr[0] = $res_arr[0] + $row['stat_modifier'];
		}
		else if(strcasecmp($stat, "Defense") == 0) {
			$res_arr[1] = $res_arr[1] + $row['stat_modifier'];
		}
		else if(strcasecmp($stat, "Dodge_chance") == 0) {
			$res_arr[2] = $res_arr[2] + $row['stat_modifier'];		
		}
	}
	return $res_arr;
}

//returns {strength, defense, dodge_chance}
function get_trinket_bonus($db, $player_id) {
	$res_arr = array(0, 0, 0);
	$query = "SELECT pa.stat_modified, pa.stat_modifier, e.equipment_id FROM parts pa JOIN equipment e ON pa.part_id = e.part_id JOIN players pl ON e.equipment_id = pl.equipped_item_id JOIN item_types i ON pa.type_id = i.type_id WHERE pl.player_id = " . $player_id . " AND i.type_name = 'TRINKET';";
	$result = $db->query($query);
	$equipment_id = 0;
	if(!$result)
		exit($query . " failed");
	for($i = 0; $i < $result->num_rows; $i++) {
		$result->data_seek($i);
		$row = $result->fetch_assoc();
		$stat = $row['stat_modified'];
		if (strcasecmp($stat, "Strength") == 0) {
			$res_arr[0] = $res_arr[0] + $row['stat_modifier'];
		}
		else if(strcasecmp($stat, "Defense") == 0) {
			$res_arr[1] = $res_arr[1] + $row['stat_modifier'];
		}
		else if(strcasecmp($stat, "Dodge_chance") == 0) {
			$res_arr[2] = $res_arr[2] + $row['stat_modifier'];		
		}
		$equipment_id = $row['equipment_id'];
	}
	
	$query = "UPDATE players SET equipped_item_id = " . get_na_trinket($db) . " WHERE player_id = " . $player_id . " AND equipped_item_id = " . $equipment_id  . ";";
	if(!$db->query($query))
		exit($query . " failed");
	return $res_arr;
}

//gets id of N/A trinket
function get_na_trinket($db) {
	$na_trinket = 0;
	$query = "SELECT e.equipment_id FROM equipment e JOIN parts p ON e.part_id = p.part_id JOIN item_types i ON p.type_id = i.type_id WHERE i.type_name = 'TRINKET' AND p.name_modifier = 'N/A';";
	$result = $db->query($query);
	if(!$result)
		exit($query . " failed");
	$result->data_seek(0);
	$row = $result->fetch_assoc();
	return $row['equipment_id'];
}

//returns {monster_name, health, strength, defense, dodge_chance}
function get_monster_stats_array($db, $monster_id) {
	//whatever this returns, we only really need the first row
	$query = "SELECT m.name, a.hit_points, a.strength, a.defense_points, a.dodge_chance FROM monsters m JOIN attribute_sets a ON m.monster_id = a.monster_id WHERE m.monster_id = " . $monster_id . ";";
	$result = $db->query($query);
	if(!$result)
		exit($query . " failed");
	$result->data_seek(0);
	$row = $result->fetch_assoc();
	$result_arr = array($row['name'], $row['hit_points'], $row['strength'], $row['defense_points'], $row['dodge_chance']);
	return $result_arr;
}

//returns {strength, defense, dodge_chance}
function get_monster_modifiers($db, $monster_id) {
	$res_arr = array(0, 0, 0);
	$query = "SELECT pa.stat_modified, pa.stat_modifier FROM parts pa JOIN monsters m ON pa.part_id = m.monster_modifier WHERE m.monster_id = " . $monster_id . ";";
	$result = $db->query($query);
	if(!$result)
		exit($query . " failed");
	for($i = 0; $i < $result->num_rows; $i++) {
		$result->data_seek($i);
		$row = $result->fetch_assoc();
		$stat = $row['stat_modified'];
		if (strcasecmp($stat, "Strength") == 0) {
			$res_arr[0] = $res_arr[0] + $row['stat_modifier'];
		}
		else if(strcasecmp($stat, "Defense") == 0) {
			$res_arr[1] = $res_arr[1] + $row['stat_modifier'];
		}
		else if(strcasecmp($stat, "Dodge_chance") == 0) {
			$res_arr[2] = $res_arr[2] + $row['stat_modifier'];		
		}
	}
	return $res_arr;
}

?>
