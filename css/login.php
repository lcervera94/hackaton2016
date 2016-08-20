<!DOCTYPE html>
<html lang="en">
<head>
	<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Katze</title>
</head>
<body>
	<div class="container-fluid">
	<h1 class="text-center">Bem vindo ao Katze!</h1>
	<h2 class="text-center">Login</h2>
	<form>
  		<div class="form-group">
    	<label for="exampleInputEmail1">E-mail</label>
    	<input type="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Insira e-mail">
    	<label for="exampleInputEmail1">Senha</label>
    	<input type="password" class="form-control" id="senha" aria-describedby="passwordlHelp" placeholder="Insira senha">
    	<input type="submit" value="entrar" id="entrar" name="entrar"><br>
		</div>
	</form>
	<br><br>
	<p class="text-center text-muted"><small> Não é um usuário ainda?</small></p>
	<br>
	<a href="../form.php" class="btn btn-info center-block" role="button">Cadastre-se!</a>
	<?php
		$servername = "localhost";
		$username = "root";
		$password = "";
		$dbname = "katze";
		// Create connection
		$conn = new mysqli($servername, $username, $password, $dbname);
		// Check connection
		if ($conn->connect_error) {
     		die("Connection failed: " . $conn->connect_error);
		}
		$email = $_POST['email'];
		$senha = $_POST['senha'];
		$entrar = $_POST['entrar'];

		if (isset($entrar)) {
                     
            $verifica = mysql_query("SELECT * FROM users WHERE email = '$login' AND senha = '$senha'") or die("erro ao selecionar");
                if (mysql_num_rows($verifica)<=0){
                    echo"<script language='javascript' type='text/javascript'>alert('Login e/ou senha incorretos');window.location.href='login.html';</script>";
                    die();
                }else{
                    setcookie("login",$login);
                    header("Location:index.php");
                }
        }
	?>
</body>
</html>