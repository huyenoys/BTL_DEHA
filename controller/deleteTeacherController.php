<?php

    include_once "../config/dbconnect.php";
    
    $id=$_POST['record'];
    $query="DELETE FROM teachers where teacher_id='$id'";

    $data=mysqli_query($conn,$query);

    if($data){
        echo"Teacher Deleted";
    }
    else{
        echo"Not able to delete";
    }
    
?>