<?php

session_start();
include('includes/dbconnection.php');

error_reporting(0);



    if(isset($_POST['change_pass']))
    {
       
        $userid=$_POST['user'];
        $cpassword=md5($_POST['currentpassword']);
        $newpassword=md5($_POST['newpassword']);
        $query=mysqli_query($con,"SELECT ID FROM tbluser WHERE Email ='$userid' AND   Password='$cpassword'");
        $row=mysqli_fetch_array($query);
        if($row>0)
        {
            $ret=mysqli_query($con,"UPDATE tbluser SET Password='$newpassword' WHERE Email='$userid'");
            header('location:access.php');
        }
        else
        {
        $msg="Your current password is wrong or already password update request is proceeds.";
        //echo $userid;
        }
    }

    
    ?>
    	<link rel="stylesheet" href="css/font-awesome.min.css">
		<link rel="stylesheet" href="css/main.css">
		<link rel="stylesheet" href="css/forms.css">
		<link rel="stylesheet" href="css/font-awesome.min.css">
		<script src="jquery-3.5.1.min.js"></script>
		<link href="favicon.png" rel="icon">
		<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>
    <script type="text/javascript">
        function checkpass()
        {
        if(document.changepassword.newpassword.value!=document.changepassword.confirmpassword.value)
        {
        alert('New Password and Confirm Password field does not match');
        document.changepassword.confirmpassword.focus();
        return false;
        }
        return true;
        } 
    </script>
    

		<div class="main-content">
			<div class="title">
                Change Password
			</div>
			<div class="main"> 
                <div class="form-container">
                    <p style="font-size:16px; color:red" align="center"> <?php if($msg){echo $msg;}  ?> </p> 
                    <form  role="form" method="post" action="" name="changepassword" onsubmit="return checkpass();">
                        <p class="form-title">Change Your Password</p>
                        <div class="item">
                        <label for="current">Email:</label>
                            <input type="email" name="user"  class="input" required>
                        </div>
                        <div class="item">
                        <label for="current">Current Password:</label>
                            <input type="password" name="currentpassword"  class="input" required>
                        </div>
                        <div class="item">
                        <label for="new">New Password:</label>
                            <input type="password" name="newpassword" class="input" required>
                        </div>
                        <div class="item">
                        <label for="confirm">Confirm Password:</label>
                            <input type="password"class="input" required>
                        </div>
                        <div class="btn-block">
                        <button type="submit" value="Submit" class="input button" name="change_pass">Change</button>                   `
                        </div>
                    </form>
                </div>
            </div>
        </div>

    <?php 
   