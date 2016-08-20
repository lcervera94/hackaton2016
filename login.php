<?php
	session_start(); // Starting Session
	$error=''; // Variable To Store Error Message
	if (isset($_POST['submit'])) {
		if (empty($_POST['email']) || empty($_POST['senha'])) {
			$error = "Email ou senha incorretos! Certifique-se de ter efetuado o cadastro e de que está inserindo as informações corretas!";
		}
		else
		{
		// Define $username and $password
		$username=$_POST['email'];
		$password=$_POST['senha'];
		// Establishing Connection with Server by passing server_name, user_id and password as a parameter
		$connection = mysql_connect("localhost", "root", "");
		// To protect MySQL injection for Security purpose
		$username = stripslashes($username);
		$password = stripslashes($password);
		$username = mysql_real_escape_string($username);
		$password = mysql_real_escape_string($password);
		// Selecting Database
		$db = mysql_select_db("users", $connection);
		// SQL query to fetch information of registerd users and finds user match.
		$query = mysql_query("select * from users where password='$password' AND username='$username'", $connection);
		$rows = mysql_num_rows($query);
		if ($rows == 1) {
			$_SESSION['login_user']=$username; // Initializing Session
			header("location: home.php"); // Redirecting To Other Page
		} else {
			$error = "Email ou senha incorretos! Certifique-se de ter efetuado o cadastro e de que está inserindo as informações corretas!";
		}
		mysql_close($connection); // Closing Connection
	}
}
?>