<?php
    include_once "../config/dbconnect.php";

    $v_id=$_POST['v_id'];
    $course= $_POST['course'];
    $teacher= $_POST['teacher'];
    $qty= $_POST['qty'];
   
    $updateItem = mysqli_query($conn,"UPDATE course_teacher_variation SET 
        course_id=$course, 
        teacher_id=$teacher,
        quantity_in_stock=$qty 
        WHERE variation_id=$v_id");


    if($updateItem)
    {
        echo "true";
    }
?>