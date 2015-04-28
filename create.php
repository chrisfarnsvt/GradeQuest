<!DOCTYPE html>
<html>
	<head>
		<title>Create a Hero</title>
		<link rel="stylesheet" type="text/css" href="final.css">
	</head>
	<body>
		<h3>Holding out for a Hero</h3>
		<p>Assign attribute points to your new character below. The numbers you enter in the boxes must add up in total to 10. Value can't be negative - I mean, seriously. That barely even makes sense.</p>
		<form action='successpage.php' method='POST'>
		<table class='invisible_table'>
		      <tr><td class='table_cell_left'>Name:</td><td class='table_cell_right'><input type='text' name='name' size='10' value='That Guy'></td></tr>
		      <tr><td class='table_cell_left'>Strength:</td><td class='table_cell_right'><input type='number' name='strength' size='2' value=0></td></tr>
		      <tr><td class='table_cell_left'>Defense:</td><td class='table_cell_right'><input type='number' name='defense' size='2' value=0></td></tr>
		      <tr><td class='table_cell_left'>Dodge Chance:</td><td class='table_cell_right'><input type='number' name='dodge' size='2' value=0></td></tr></table><br/>
		      <input type='submit' value='CREATE IT UP' class='submit'><br/>
		</form><br/>
		<a href='home.php'><button class='submit'>Back</button></a>
	</body>
</html>
