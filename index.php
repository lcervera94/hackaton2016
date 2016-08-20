
<?php
	include('login.php'); // Includes Login Script

	if(isset($_SESSION['login_user'])){
		header("location: profile.php");
	}
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<link rel="stylesheet" type="text/css" href="..\css\bootstrap.min.css">
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Katze</title>
</head>
<body>
	<div class="container-fluid">
	<h1 class="text-center">Bem vindo ao Katze!</h1>
	<h2 class="text-center">Login</h2>
	<form action="" method="post">
  		<div class="form-group">
    	<label>E-mail</label>
    	<input id="email" name="email" type="email" placeholder="Insira e-mail">
    	<label>Senha</label>
    	<input id="senha" name="senha" type="password" placeholder="Insira senha">
    	<input type="submit" value="entrar" id="entrar" name="entrar"><br>
		<span><?php echo $error; ?></span>
		</div>
	</form>
	<br><br>
	<p class="text-center text-muted"><small> Não é um usuário ainda?</small></p>
	<br>
	<a href="../cadastro.php" class="btn btn-info center-block" role="button">Cadastre-se!</a>
	
</body>
</html>