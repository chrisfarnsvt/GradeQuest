This is a rushed project that I admit wasn't coded brilliantly. It was done in about three weeks for a final project in VTC's Database Systems course. The backend was irrelevant to the grade, and I very much learned PHP and CSS as I went.

This would benefit immensely from revisiting. Still, it works, and is a playable game in its current state up to level 4.

How to get this thing up and running.

1) You'll need LAMP. I used xampp, but it should work fine on any LAMP stack. Ensure the mysql and apache services are running.

2) Run the database creation script as a user with privileges to create databases and tables.

3) Create a new user named 'final', password of 'final', with full access to fin_proj (the database created by the script.)

4) If using XAMPP, put the css file and all php files in a directory where localhost is targeted. Otherwise, do the same with your apache install.

5) Type "localhost/<your-directory>/home.php" into a browser and marvel at what a student can do in 3 weeks with little sleep.

Or don't marvel. Like, seriously, don't. I'm only putting this code here to have in another location.
