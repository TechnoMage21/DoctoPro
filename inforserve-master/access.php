<?php
session_start();
error_reporting(0);
include('includes/dbconnection.php');

if(isset($_POST['login']))
  {
	global $hosId;
	$email=$_POST['email'];
	$password=md5($_POST['password']);
	$query=mysqli_query($con,"SELECT  ID  FROM tbluser WHERE  Email='$email' && Password='$password' ");
	$ret=mysqli_fetch_array($query);
	$hosId=$ret['hospital_id'];

	if($ret>0){
		$_SESSION['sessionid']=$ret['ID'];	
	    header('location:dashboard.php');
	}
	else{
	$msg="Invalid Details.";
	}
  }
  ?>
  <style>
	body {
    background-image: url('doc.jpg'); 
    background-size: cover;
    background-repeat: no-repeat;
    background-attachment: fixed;
}
  </style>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>DoctoPro - A Secure authenticator key system</title>
		<link href="img/favicon.png" rel="icon">
		<link rel="stylesheet" href="css/style.css">
		<link href="css/font-awesome.min.css" rel="stylesheet">
		
		<link href="favicon.png" rel="icon">

	</head>
	<body>
		<div class="login">
		<br>
		<center><img src="logo.png" alt=""></center>			
	  <h1>Authentication Gateway </h1>
      <p style="font-size:16px; color:red" align="center"> <?php if($msg){
    echo $msg;
  }  ?> </p>
			<form action=" " method="post">
				<label for="username">
					<i class="fa fa-envelope"></i>
				</label>
				<input type="email" name="email" placeholder="Email" id="email" required>
				<label for="password">
					<i class="fa fa-lock"></i>
				</label>
				<input type="password" name="password" placeholder="Password" id="password" required>
				<a href="forgot-password.php">Forgot Password?</a>

				<input type="submit" value="login" name="login">
				
			</form>
		</div>
	</body>
</html>