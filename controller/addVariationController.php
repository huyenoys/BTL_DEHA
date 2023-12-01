<?php
    include_once "../config/dbconnect.php";
    
    if(isset($_POST['upload']))
    {
       
        $course = $_POST['course'];
        $teacher= $_POST['teacher'];
        $qty = $_POST['qty'];

         $insert = mysqli_query($conn,"INSERT INTO course_teacher_variation
         (course_id,teacher_id,quantity_in_stock) VALUES ('$course','$teacher','$qty')");
 
         if(!$insert)
         {
             echo mysqli_error($conn);
             header("Location: ../index.php?variation=error");
         }
         else
         {
             echo "Records added successfully.";
             header("Location: ../index.php?variation=success");
         }
     
    }
        
?>