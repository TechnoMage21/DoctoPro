<?php  
    session_start();
    error_reporting(0);
    include('includes/dbconnection.php');
    if (strlen($_SESSION['sessionid']==0))
    {
        header('location:logout.php');
    }
    else
    {
        function fetch_hospital()
        {
            global $con,$userid,$hospitalID;
            $userid=$_SESSION['sessionid'];
            $per_page = 10;
            $offset = ($pageno-1) * $per_page;   
            $query = "SELECT COUNT(*) FROM tblcodes";
            $result = mysqli_query($con,$query);
            $rows = mysqli_fetch_array($result)[0];
            $sql = "SELECT * FROM tblcodes ORDER BY patient_id ";
            $res_data = mysqli_query($con,$sql);
            $count = 0;
            if(!$res_data){
                die ("Error fetching data" .mysqli_error(($con)));
            }
            while( $row = mysqli_fetch_assoc($res_data))
            {            
                    
                $patient_id = $row['patient_id'];
                $code=$row['code'];
                
                $count = $count+1;
                ?>
                
                <tr>
                    <td data-label="Serial"><?php echo $patient_id ?></td>
                    <td data-label="Serial"><?php echo $code.'*********' ?></td>

                   
          
                <?php
            }
        }

        ?>

    <?php include 'includes/header.php';?>
        <div class="main-content">
            <div class="title">
                Security Key Record' Records
            </div>
            <div class="main">
            <a href="mangecode.php">Reresh page to get a upadated security key.</a>
           
            <hr>
                <table class="table">
                    <thead>
                        <th>Patient Id</th>
                        <th>Security Keys</th>
                        
                      
                    </thead>
                    <tbody>
                        <?php              
                        fetch_hospital();
                        ?>                                   
                    </tbody>            
                </table> 
            </div>     
        </div>  
        <?php include_once('includes/footer.php');?>                 

        <?php
    }
    ?>