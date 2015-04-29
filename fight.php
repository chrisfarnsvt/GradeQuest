<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="final.css">
		<title>Skirmishing Time!</title>
	</head>
<?php
	session_start();
	//session_unset();
	include 'databaseconnection.php';
	include 'fight_functions.php';
	include 'monster_generation.php';
	$player_stats = array();
	$monster_stats = array();
	$db = database_connect();
	if(!isset($_SESSION['curr_player']))
		exit( "<p>Go equip the character you wish to play with. I mean, fighting's sorta hard in a jeans and T-Shirt. I promise this isn't handled this way purely because it was easiest to code if I just set the Session when you equip a character. Totally. Not that.</p><a href='battleground.php'><button class='submit'>Back</button></a>");
	if(!isset($_SESSION['player_health'])){
		$player_stats = get_player_stats_array($db, $_SESSION['curr_player']);
		//above is.. {name, hit_points, strength, defense, dodge, level, exp_remaining}
	
		//get and set player's status
		$player_mods = get_player_modifiers($db, $_SESSION['curr_player']);
		$player_stats[2] = $player_stats[2] + $player_mods[0];
		$player_stats[3] = $player_stats[3] + $player_mods[1];
		$player_stats[4] = $player_stats[4] + $player_mods[2];
		$_SESSION['player_name'] = $player_stats[0];
		$_SESSION['player_health'] = $player_stats[1];
		$_SESSION['player_strength'] = $player_stats[2];
		$_SESSION['player_defense'] = $player_stats[3];
		$_SESSION['player_dodge'] = $player_stats[4];
		$_SESSION['player_level'] = $player_stats[5];
		$_SESSION['player_exp_rem'] = $player_stats[6];
		$_SESSION['player_has_mod'] = false;
		$_SESSION['player_mod_1'] = 0;
		$_SESSION['player_mod_2'] = 0;
		$_SESSION['player_mod_3'] = 0;

		$new_monster_id = next_monster_id($db);
		$_SESSION['curr_monster'] = $new_monster_id;
		//give player something to fight
		generate_monster($db, $player_stats[5]);
		$monster_stats = get_monster_stats_array($db, $new_monster_id);
		//above is.. {name, hit_points, strength, defense, dodge}
		
		//set up monster stats
		$monster_mods = get_monster_modifiers($db, $new_monster_id);
		$monster_stats[2] = $monster_stats[2] + $monster_mods[0];
		$monster_stats[3] = $monster_stats[3] + $monster_mods[1];
		$player_stats[4] = $monster_stats[4] + $monster_mods[2];
		$_SESSION['monster_name'] = $monster_stats[0];
		$_SESSION['monster_health'] = $monster_stats[1];
		$_SESSION['monster_strength'] = $monster_stats[2];
		$_SESSION['monster_defense'] = $monster_stats[3];
		$_SESSION['monster_dodge'] = $monster_stats[4];
		$_SESSION['monster_has_mod'] = false;
		$_SESSION['monster_mod_1'] = 0;
		$_SESSION['monster_mod_2'] = 0;
		$_SESSION['monster_mod_3'] = 0;

		$_SESSION['text_log'] = "";
	}
	//if trinket used, apply bonus and destroy

	//if bonus from last turn (bonus val, but flag set to false), reset it
	if(isset($_POST['battle_action'])){
		$action = $_POST['battle_action'];
		$monster_act = mt_rand(0, 1);
		
		//is the player out of bonus stats? what about the monster?
		if($_SESSION['player_mod_1'] == 0 && $_SESSION['player_mod_2'] == 0 && $_SESSION['player_mod_3'] == 0)
			$_SESSION['player_has_mod'] = false;
		if($_SESSION['monster_mod_1'] == 0 && $_SESSION['monster_mod_2'] == 0 && $_SESSION['monster_mod_3'] == 0)
			$_SESSION['monster_has_mod'] = false;

		//player attacks
		if (strcasecmp($action, 'attack') == 0) {
			if($_SESSION['player_has_mod']) {
				$_SESSION['player_strength'] = $_SESSION['player_strength'] + $_SESSION['player_mod_1'];
			}
			if($_SESSION['monster_has_mod']) {
				$_SESSION['monster_defense'] = $_SESSION['monster_defense'] + $_SESSION['monster_mod_2'];
				$_SESSION['monster_dodge'] = $_SESSION['monster_dodge'] + $_SESSION['monster_mod_3'];
			}
			//attacks at least do 1 damage
			$damage = max(($_SESSION['player_strength'] - $_SESSION['monster_defense'] + rand(-1 * $_SESSION['player_level'], 3 * $_SESSION['player_level'])), 1);
			//monster might dodge			
			$dodge = mt_rand(1,100) - (2 * $_SESSION['monster_dodge']);
			if ($dodge < 0) {
				$damage = 0;
				$_SESSION['text_log'] = $_SESSION['text_log'] . "<p class='player_action'>You missed.</p><br/><br/>";
			}
			else
				$_SESSION['text_log'] = $_SESSION['text_log'] . "<p class='player_action'>You attacked for " . $damage . " damage.</p><br/><br/>";
			$_SESSION['monster_health'] = $_SESSION['monster_health'] - $damage;

			if($_SESSION['player_has_mod']) {
				$_SESSION['player_strength'] = $_SESSION['player_strength'] - $_SESSION['player_mod_1'];
				$_SESSION['player_mod_1'] = 0;
			}
			if($_SESSION['monster_has_mod']) {
				$_SESSION['monster_defense'] = $_SESSION['monster_defense'] - $_SESSION['monster_mod_2'];
				$_SESSION['monster_mod_2'] = 0;
				$_SESSION['monster_dodge'] = $_SESSION['monster_dodge'] - $_SESSION['monster_mod_3'];
				$_SESSION['monster_mod_3'] = 0;
			}
		}

		//player "looks tough" (stat bonuses applied next turn)	
		if (strcasecmp($action, 'defend') == 0) {
			$_SESSION['player_has_mod'] = true;
			$_SESSION['player_mod_1'] = $_SESSION['player_level'] * rand(0, 1);
			$_SESSION['player_mod_2'] = $_SESSION['player_level'] * rand(0, 1);
			$_SESSION['player_mod_3'] = $_SESSION['player_level'] * rand(0, 1);
			$_SESSION['text_log'] = $_SESSION['text_log'] . "<p class='player_action'>You glare threateningly at the monster. He frowns a little. Your stats next turn are boosted by " . $_SESSION['player_mod_1'] . " strength, " . $_SESSION['player_mod_2'] . " defense, and " . $_SESSION['player_mod_3'] . " dodge chance.</p><br/><br/>";
		}

		if (strcasecmp($action, 'use_item') == 0) {
			$trinket_arr = get_trinket_bonus($db, $_SESSION['curr_player']);
			$_SESSION['player_has_mod'] = true;
			$_SESSION['player_mod_1'] = $trinket_arr[0];
			$_SESSION['player_mod_2'] = $trinket_arr[1];
			$_SESSION['player_mod_3'] = $trinket_arr[2];
			$_SESSION['text_log'] = $_SESSION['text_log'] . "<p class='player_action'>You swallow your trinket whole. The monster looks confused. Your stats next turn are boosted by " . $_SESSION['player_mod_1'] . " strength, " . $_SESSION['player_mod_2'] . " defense, and " . $_SESSION['player_mod_3'] . " dodge chance. Your trinket is obviously lost to gastric juices. Yum.</p><br/><br/>";
		}
		//monster attacks
		if($monster_act == 0) {
			//attacks at least do 1 damage
			if($_SESSION['monster_has_mod']) {
				$_SESSION['monster_strength'] = $_SESSION['monster_strength'] + $_SESSION['monster_mod_1'];
			}
			if($_SESSION['player_has_mod']) {
				$_SESSION['player_defense'] = $_SESSION['player_defense'] + $_SESSION['player_mod_2'];
				$_SESSION['player_dodge'] = $_SESSION['player_dodge'] + $_SESSION['player_mod_3'];
			}
			$damage = max(($_SESSION['monster_strength'] - $_SESSION['player_defense'] + rand(-1 * $_SESSION['player_level'], 3 * $_SESSION['player_level'])), 1);
			//player might dodge			
			$dodge = mt_rand(1,100) - (2 * $_SESSION['player_dodge']);
			if ($dodge < 0) {
				$damage = 0;
				$_SESSION['text_log'] = $_SESSION['text_log'] . "<p class='enemy_action'>Monster missed.</p><br/><br/>";
			}
			else
				$_SESSION['text_log'] = $_SESSION['text_log'] . "<p class='enemy_action'>Monster attacked for " . $damage . " damage.</p><br/><br/>";
			$_SESSION['player_health'] = $_SESSION['player_health'] - $damage;
	
			if($_SESSION['monster_has_mod']) {
				$_SESSION['monster_strength'] = $_SESSION['monster_strength'] - $_SESSION['monster_mod_1'];
				$_SESSION['monster_mod_1'] = 0;
			}
			if($_SESSION['player_has_mod']) {
				$_SESSION['player_defense'] = $_SESSION['player_defense'] - $_SESSION['player_mod_2'];
				$_SESSION['player_mod_2'] = 0;
				$_SESSION['player_dodge'] = $_SESSION['player_dodge'] - $_SESSION['player_mod_3'];
				$_SESSION['player_mod_3'] = 0;
			}
		}
		
		if ($monster_act == 1) {
			$_SESSION['monster_has_mod'] = true;
			$_SESSION['monster_mod_1'] = $_SESSION['player_level'] * rand(0, 1);
			$_SESSION['monster_mod_2'] = $_SESSION['player_level'] * rand(0, 1);
			$_SESSION['monster_mod_3'] = $_SESSION['player_level'] * rand(0, 1);
			$_SESSION['text_log'] = $_SESSION['text_log'] . "<p class='enemy_action'>The monster puts on an ominous air. Your legs start to shake. The monster's stats next turn are boosted by " . $_SESSION['monster_mod_1'] . " strength, " . $_SESSION['monster_mod_2'] . " defense, and " . $_SESSION['monster_mod_3'] . " dodge chance.</p><br/><br/>";
		}
	}
	//use trinket
?>
	<body>
		<h3>Oh dear. A scuffle.</h3>
		<?php
			include 'item_generation.php';
			include 'character_functions.php';
			$db = database_connect();
			echo "<table border='1'><tr><th>" . $_SESSION['player_name'] . "'s Health</th><th>" . $_SESSION['monster_name'] . "'s Health</th></tr><tr><td>" . $_SESSION['player_health'] . "</td><td>" . $_SESSION['monster_health'] . "</td></tr></table><br/><br/>";
			echo "<p class='game_info'>Here's what's happened so far...</p><br/><br/>";
			echo "<div class='game_container'>" . $_SESSION['text_log'] . "</div><br/>";
			if($_SESSION['player_health'] <= 0) {
				echo "<p class='game_info'>" . $_SESSION['player_name'] . " lost.</p><br/><br/><a href='battleground.php'><button class='submit'>Back</button></a>";	
				$query = "UPDATE attribute_sets SET hit_points = 0 WHERE player_id = " . $_SESSION['curr_player'] . ";";
				if(!$db->query($query))
					exit($query . " failed");
				$query = "INSERT INTO battleground (battle_won, equipment_reward_1, equipment_reward_2, exp_reward, monster_id, player_id) VALUES (false, null, null, 0, " . $_SESSION['curr_monster'] . ", " . $_SESSION['curr_player'] . ");";
				if(!$db->query($query))
					exit($query . " failed");
				session_unset();
				exit();
			}
			if($_SESSION['monster_health'] <= 0) {
				$temp = rand(0, 2);
				if($temp == 0)
					$item_type = "WEAPON";
				if($temp == 1)
					$item_type = "ARMOR";
				if($temp == 2)
					$item_type = "TRINKET";
				
				$new_item_1_id = generate_item($_SESSION['player_level'], $item_type, $db);
				$new_item_1 = get_item_name($db, $new_item_1_id);

				$temp = rand(0, 2);
				if($temp == 0)
					$item_type = "WEAPON";
				if($temp == 1)
					$item_type = "ARMOR";
				if($temp == 2)
					$item_type = "TRINKET";
				
				$new_item_2_id = generate_item($_SESSION['player_level'], $item_type, $db);
				$new_item_2 = get_item_name($db, $new_item_2_id);

				$exp_reward = $_SESSION['player_level'] * 100;

				$query = "UPDATE attribute_sets SET hit_points = 0 WHERE monster_id = " . $_SESSION['curr_monster'] . ";";
				if(!$db->query($query))
					exit($query . " failed");
				$query = "INSERT INTO battleground (battle_won, equipment_reward_1, equipment_reward_2, exp_reward, monster_id, player_id) VALUES (true, " . $new_item_1_id . ", " . $new_item_2_id . ", " . $exp_reward .", " . $_SESSION['curr_monster'] . ", " . $_SESSION['curr_player'] . ");";
				if(!$db->query($query))
					exit($query . " failed");

				if($_SESSION['player_exp_rem'] <= $exp_reward) {
					$query = "UPDATE attribute_sets SET level = " . ($_SESSION['player_level'] + 1) . ", strength = " . ($_SESSION['player_strength'] + rand(0, 4)) . ", defense_points = " . ($_SESSION['player_defense'] + rand(0, 4)) . ", dodge_chance = " . ($_SESSION['player_dodge'] + rand(0, 4)) . " WHERE player_id = " . $_SESSION['curr_player'] . ";";
					if(!$db->query($query))
						exit($query . " failed");
				
					$query = "UPDATE players SET exp_until_lvlup = " . (($_SESSION['player_level'] + 1) * 100 * $_SESSION['player_level']) . " WHERE player_id = " . $_SESSION['curr_player'] . ";";
					if(!$db->query($query))
						exit($query . " failed");
				}
				
				else {
					$query = "UPDATE players SET exp_until_lvlup = " . ($_SESSION['player_exp_rem'] - $exp_reward) . " WHERE player_id = " . $_SESSION['curr_player'] . ";";
					if(!$db->query($query))
						exit($query . "failed");									
				}
				echo "<p class='game_info'>" . $_SESSION['player_name'] . " won. " . $new_item_1 . " and " . $new_item_2 . " are your fantastic rewards!</p><br/><br/><a href='battleground.php'><button class='submit'>Back</button></a>";
				session_unset();
				exit();
			}
		?>
		<p class='game_info'>So this turn, I should probably...</p><br/><br/>
		<form action='fight.php' method='POST'>
		      <input type='radio' name='battle_action' value='attack'>ATTACK<br/>
		      <input type='radio' name='battle_action' value='defend'>LOOK TOUGH<br/>
		      <input type='radio' name='battle_action' value='use_item'>USE MY TRINKET<br/>
		      <input type='submit' value='Yeah, Do That' class='submit'><br/>
		</form>
	</body>
</html>
