<?php
//returns a select HTML element containing all (alive) characters in the database
function get_char_dropdown($db) {
	$query = "SELECT p.player_id, p.name, a.level FROM players p JOIN attribute_sets a ON p.player_id = a.player_id WHERE a.hit_points > 0 GROUP BY p.player_id, p.name, a.level;"; 
	$result = $db->query($query);
	if(!$result)
		exit($query . " failed");
	$select = "<select name='character_select'>";
	for($i = 0; $i < $result->num_rows; $i++) {
		$result->data_seek($i);
		$row = $result->fetch_assoc();
		$select = $select . "<option value='" . $row['player_id'] . "'>" . $row['name'] . " " . $row['level'] . "</option>";
	}
	$select = $select . "</select>";
	return $select;
}

//Returns a table of all characters and their equipped items
function get_equipped_table($db) {
	$query = "SELECT p.player_id, p.name, p.equipped_item_id FROM players p JOIN attribute_sets a ON p.player_id = a.player_id WHERE a.hit_points > 0;";
	$result = $db->query($query);
	if(!$result)
		exit($query . " failed");
	$result->data_seek(0);
	$row = $result->fetch_assoc();
	$current_player = $row['player_id'];
	$table = '';
	$table = $table . "<table border = '1'><tr><th>Name</th><th>Item 1</th><th>Item 2</th><th>Item 3</th></tr><tr><td>". $row['name'] . "</td>";
	for ($i = 0; $i < $result->num_rows; $i++) {
		$result->data_seek($i);
		$row = $result->fetch_assoc();
		if ($current_player == $row['player_id'])
			$table = $table . "<td>" . get_item_name($db, $row['equipped_item_id']) . "</td>";
		else {
			$table = $table . "</tr><tr><td>" . $row['name'] . "</td><td>" . get_item_name($db, $row['equipped_item_id']) . "</td>";
			$current_player = $row['player_id'];		
		}		
	}
	$table = $table . "</tr></table>";
	return $table;
}

//gets the name of an item based on its id
function get_item_name($db, $item_id) {
	$query = "SELECT p.part_id, p.name_modifier, p.name_position FROM parts p JOIN equipment e ON p.part_id = e.part_id WHERE e.equipment_id = " . $item_id . " ORDER BY p.name_position;";
	$result = $db->query($query);
	if(!$result)
		exit($query . " failed");
	$item_name = '';
	for ($i = 0; $i < $result->num_rows; $i++) {
		$result->data_seek($i);
		$row = $result->fetch_assoc();
		if ($row['name_position'] == 3)
			$item_name = $item_name . " of " . $row['name_modifier'];
		else
			$item_name = $item_name . $row['name_modifier'] . " ";	
	}
	return $item_name;
}

//returns the highest level of all the parts making up an item
function get_item_level($db, $item_id) {
	$query = "SELECT MAX(p.level_required) AS level_required FROM parts p JOIN equipment e ON e.part_id = p.part_id WHERE e.equipment_id = " . $item_id . ";";
	$result = $db->query($query);
	if(!$result)
		exit($query . " failed");
	$row = $result->fetch_assoc();
	return $row['level_required'];
}

//returns a character's level
function get_char_level($db, $char_id) {
	$query = "SELECT MAX(a.level) AS level FROM attribute_sets a JOIN players p ON p.player_id = a.player_id WHERE a.player_id = " . $char_id . ";";
	$result = $db->query($query);
	if(!$result)
		exit($query . " failed");
	$row = $result->fetch_assoc();
	return $row['level'];
}
?>
