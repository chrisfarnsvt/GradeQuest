<?php
//Generates an item from random parts
function generate_item($level, $type, $gendb) {
	$query = "SELECT MAX(equipment_id) AS equipment_id FROM equipment;";
	$result = $gendb->query($query);
	if (!$result)
		exit($query . " failed");
	$row = $result->fetch_assoc();
	$equipment_id = $row['equipment_id'] + 1;

	$query = "SELECT p.part_id, p.name_modifier, p.name_position, p.rarity, p.type_id FROM parts p JOIN item_types i ON i.type_id = p.type_id WHERE p.level_required = " . $level . " AND i.type_name = '" . strtoupper($type) . "' AND p.name_modifier != 'N/A' ORDER BY p.name_position, p.rarity DESC;";
	$result = $gendb->query($query);
	if (!$result)
	     exit($query . " failed");
	$continue = true;
	$result->data_seek(0);
	$row = $result->fetch_assoc();
	$type_id = $row['type_id'];
	$part1 = 0;
	$part2 = 0; 
        $part3 = 0;
	$has_part_1 = mt_rand(0, 1);
	$has_part_2 = true; //there's always part number 2
	$has_part_3 = mt_rand(0, 1);
	$name = '';
	for ($i = 0; $i < $result->num_rows; $i++) {
		$result->data_seek($i);
		$row = $result->fetch_assoc();	
		$check = mt_rand(1, 100);
		if ($has_part_1 && $row['name_position'] == 1) {
			$test = (100 / $row['rarity']);
 			if ($check <= $test) { //success
				$part1 = $row['part_id'];
				$name = $name . $row['name_modifier'] . " ";
				$has_part_1 = false;
			}		
		}
		else if ($has_part_2 && $row['name_position'] == 2) {
			$test = (100 / $row['rarity']);
 			if ($check <= $test) { //success
				$part2 = $row['part_id'];
				$name = $name . $row['name_modifier'] . " ";
				$has_part_2 = false;
			}				
		}

		else if ($has_part_3 && $row['name_position'] == 3) {
			$test = (100 / $row['rarity']);
 			if ($check <= $test) { //success
				$part3 = $row['part_id'];
				$name = $name . $row['name_modifier'] . " ";
				$has_part_3 = false;
			}				
		}
	}
	$query = "INSERT INTO equipment (equipment_id, part_id, type_id, used_by_player) VALUES ";
	if ($part1 != 0)
       		$query = $query . "(" . $equipment_id . ", " . $part1 . ", " . $type_id . ", false), ";
	$query = $query . "(" . $equipment_id . ", " . $part2 . ", " . $type_id . ", false)";
	if ($part3 != 0)
		$query = $query . ", (" . $equipment_id . ", " . $part3 . ", " . $type_id . ", false)";
	$query = $query . ";";
	if(!$gendb->query($query))
		exit($query . " failed");
	return $equipment_id;
}	

//returns the html <select> element for the specified category of inventory items
function get_inv_dropdown($db, $type) {
	$query = "SELECT e.equipment_id, e.part_id, e.type_id, p.name_modifier, p.name_position, p.level_required, e.used_by_player FROM equipment e JOIN parts p ON e.part_id = p.part_id JOIN item_types i ON p.type_id = i.type_id WHERE type_name = '" . strtoupper($type) . "' AND e.used_by_player = false ORDER BY e.equipment_id, p.name_position;";
	$result = $db->query($query);
	if(!$result)
		exit($query . " failed");
	$result->data_seek(0);
	$row = $result->fetch_assoc();
	$current_id = $row['equipment_id'];
	$item_name = '';
	$level = $row['level_required'];
	$select = "<select name='" . $type . "_select'>";
	for($i = 0; $i < $result->num_rows; $i++) {
		$result->data_seek($i);
		$row = $result->fetch_assoc();
		if($row['equipment_id']	== $current_id) {
			if ($row['name_position'] == 3) {
				$item_name = $item_name . 'of ' . $row['name_modifier'];
				if ($row['level_required'] > $level)
					$level = $row['level_required'];
			}
			else {
				$item_name = $item_name . $row['name_modifier'] . ' ';	
				if ($row['level_required'] > $level)
					$level = $row['level_required'];	
			}		
		}
		else {
			$select = $select . "<option value='" . $current_id . "'>" . $item_name . " " . $level . "</option>";
			$current_id = $row['equipment_id'];
			$item_name = $row['name_modifier'] . ' ';
			$level = $row['level_required'];
		}
	}
	$select = $select . "<option value='" . $current_id . "'>" . $item_name . " " . $level . "</option></select>";
	return $select;
}	
?>
