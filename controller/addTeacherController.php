<?php
    include_once "../config/dbconnect.php";
    
    if(isset($_POST['upload']))
    {
       
        $teacher = $_POST['teacher'];
       
         $insert = mysqli_query($conn,"INSERT INTO teachers
         (teacher_name)   VALUES ('$teacher')");
 
         if(!$insert)
         {
             echo mysqli_error($conn);
             header("Location: ../index.php?teacher=error");
         }
         else
         {
             echo "Records added successfully.";
             header("Location: ../index.php?teacher=success");
         }
     
    }
        
?>