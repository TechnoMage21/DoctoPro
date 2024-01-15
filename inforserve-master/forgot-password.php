<?php
session_start();
error_reporting(0);

?>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Reset</title>
		<link rel="stylesheet" href="css/style.css">
		<link href="css/font-awesome.min.css" rel="stylesheet">
		<link href="favicon.png" rel="icon">

	</head>
	<body>
		<div class="login">
			<h1>RESET PASSWORD</h1>
      <p style="font-size:16px; color:red" align="center"> <?php if($msg){
    echo $msg;
  }  ?> </p>
				<form role="form" action="reset-password.php" method="post" id="" name="login">
					<label for="username">
						<i class="fa fa-envelope"></i>
					</label>
					<input type="email" name="email" placeholder="Email" id="email" required>
		
					<input type="submit" value="Reset" name="login">
				</form>
				</div>
	

<script src="js/jquery-1.11.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>
