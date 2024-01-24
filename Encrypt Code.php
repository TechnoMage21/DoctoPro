<?php

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Encryption Test Area</title>
</head>
<style>
    .hero-image {
  background-image: url("download.jpg"); /* The image used */
  height: 500px; /* You must set a specified height */
  background-position: center; /* Center the image */
  background-repeat: no-repeat; /* Do not repeat the image */
  background-size: cover; /* Resize the background image to cover the entire container */

 h2 {
     color:  green;
  }
}
</style>
<body class="hero-image ">
    <h2>Let Test encryption.</h2>
    <?php
    
     $m= "12345";
     //m
     $k= 20;
     $fm =$m * log10($k)* 10^ $k * $k;
     $Efm =$fm/(log10($k)* 10^ $k * $k);
     



     echo "<h2> Initial Level the text m is : $m </h2>";
     echo"<h2> After Encoding f(m) : $fm$@# </h2>";
     echo "<h2> After DEcoding m: $Efm. </h2>";
     
     //normal chyper approach...
     //Say text
     

?>
<!--img src="https://ds055uzetaobb.cloudfront.net/brioche/uploads/53gy1Ho70o-homo3-new-page1resized.png?width=1200" alt=""-->
</body>
</html>