

function showCourseItems(){  
    $.ajax({
        url:"./adminView/viewAllCourses.php",
        method:"post",
        data:{record:1},
        success:function(data){
            $('.allContent-section').html(data);
        }
    });
}
function showSubject(){  
    $.ajax({
        url:"./adminView/viewSubjects.php",
        method:"post",
        data:{record:1},
        success:function(data){
            $('.allContent-section').html(data);
        }
    });
}
function showTeachers(){  
    $.ajax({
        url:"./adminView/viewTeachers.php",
        method:"post",
        data:{record:1},
        success:function(data){
            $('.allContent-section').html(data);
        }
    });
}
// function showProductSizes(){  
//     $.ajax({
//         url:"./adminView/viewProductSizes.php",
//         method:"post",
//         data:{record:1},
//         success:function(data){
//             $('.allContent-section').html(data);
//         }
//     });
// }

function showCustomers(){
    $.ajax({
        url:"./adminView/viewCustomers.php",
        method:"post",
        data:{record:1},
        success:function(data){
            $('.allContent-section').html(data);
        }
    });
}

// function showOrders(){
//     $.ajax({
//         url:"./adminView/viewAllOrders.php",
//         method:"post",
//         data:{record:1},
//         success:function(data){
//             $('.allContent-section').html(data);
//         }
//     });
// }

// function ChangeOrderStatus(id){
//     $.ajax({
//        url:"./controller/updateOrderStatus.php",
//        method:"post",
//        data:{record:id},
//        success:function(data){
//            alert('Order Status updated successfully');
//            $('form').trigger('reset');
//            showOrders();
//        }
//    });
// }

// function ChangePay(id){
//     $.ajax({
//        url:"./controller/updatePayStatus.php",
//        method:"post",
//        data:{record:id},
//        success:function(data){
//            alert('Payment Status updated successfully');
//            $('form').trigger('reset');
//            showOrders();
//        }
//    });
// }


//add product data
function addItems(){
    var p_name=$('#p_name').val();
    var p_desc=$('#p_desc').val();
    var p_price=$('#p_price').val();
    var subject=$('#subject').val();
    var upload=$('#upload').val();
    var file=$('#file')[0].files[0];

    var fd = new FormData();
    fd.append('p_name', p_name);
    fd.append('p_desc', p_desc);
    fd.append('p_price', p_price);
    fd.append('subject', subject);
    fd.append('file', file);
    fd.append('upload', upload);
    $.ajax({
        url:"./controller/addItemController.php",
        method:"post",
        data:fd,
        processData: false,
        contentType: false,
        success: function(data){
            alert('Course Added successfully.');
            $('form').trigger('reset');
            showCourseItems();
        }
    });
}

//edit product data
function itemEditForm(id){
    $.ajax({
        url:"./adminView/editItemForm.php",
        method:"post",
        data:{record:id},
        success:function(data){
            $('.allContent-section').html(data);
        }
    });
}

//update product after submit
function updateItems(){
    var course_id = $('#course_id').val();
    var p_name = $('#p_name').val();
    var p_desc = $('#p_desc').val();
    var p_price = $('#p_price').val();
    var subject = $('#subject').val();
    var existingImage = $('#existingImage').val();
    var newImage = $('#newImage')[0].files[0];
    var fd = new FormData();
    fd.append('course_id', course_id);
    fd.append('p_name', p_name);
    fd.append('p_desc', p_desc);
    fd.append('p_price', p_price);
    fd.append('subject', subject);
    fd.append('existingImage', existingImage);
    fd.append('newImage', newImage);
   
    $.ajax({
      url:'./controller/updateItemController.php',
      method:'post',
      data:fd,
      processData: false,
      contentType: false,
      success: function(data){
        alert('Data Update Success.');
        $('form').trigger('reset');
        showCourseItems();
      }
    });
}

//delete product data
function itemDelete(id){
    $.ajax({
        url:"./controller/deleteItemController.php",
        method:"post",
        data:{record:id},
        success:function(data){
            alert('Items Successfully deleted');
            $('form').trigger('reset');
            showCourseItems();
        }
    });
}


//delete cart data
function cartDelete(id){
    $.ajax({
        url:"./controller/deleteCartController.php",
        method:"post",
        data:{record:id},
        success:function(data){
            alert('Cart Item Successfully deleted');
            $('form').trigger('reset');
            showMyCart();
        }
    });
}

function eachDetailsForm(id){
    $.ajax({
        url:"./view/viewEachDetails.php",
        method:"post",
        data:{record:id},
        success:function(data){
            $('.allContent-section').html(data);
        }
    });
}



//delete category data
function subjectDelete(id){
    $.ajax({
        url:"./controller/catDeleteController.php",
        method:"post",
        data:{record:id},
        success:function(data){
            alert('Subject Successfully deleted');
            $('form').trigger('reset');
            showSubject();
        }
    });
}

//delete size data
function teacherDelete(id){
    $.ajax({
        url:"./controller/deleteTeacherController.php",
        method:"post",
        data:{record:id},
        success:function(data){
            alert('Teacher Successfully deleted');
            $('form').trigger('reset');
            showTeachers();
        }
    });
}


//delete variation data
function variationDelete(id){
    $.ajax({
        url:"./controller/deleteVariationController.php",
        method:"post",
        data:{record:id},
        success:function(data){
            alert('Successfully deleted');
            $('form').trigger('reset');
            showCourseTeachers();
        }
    });
}

//edit variation data
function variationEditForm(id){
    $.ajax({
        url:"./adminView/editVariationForm.php",
        method:"post",
        data:{record:id},
        success:function(data){
            $('.allContent-section').html(data);
        }
    });
}


//update variation after submit
function updateVariations(){
    var v_id = $('#v_id').val();
    var course = $('#course').val();
    var teacher = $('#teacher').val();
    var qty = $('#qty').val();
    var fd = new FormData();
    fd.append('v_id', v_id);
    fd.append('course', course);
    fd.append('teacher', teacher);
    fd.append('qty', qty);
   
    $.ajax({
      url:'./controller/updateVariationController.php',
      method:'post',
      data:fd,
      processData: false,
      contentType: false,
      success: function(data){
        alert('Update Success.');
        $('form').trigger('reset');
        showCourseTeachers();
      }
    });
}
// function search(id){
//     $.ajax({
//         url:"./controller/searchController.php",
//         method:"post",
//         data:{record:id},
//         success:function(data){
//             $('.eachSubjectCourses').html(data);
//         }
//     });
// }


// function quantityPlus(id){ 
//     $.ajax({
//         url:"./controller/addQuantityController.php",
//         method:"post",
//         data:{record:id},
//         success:function(data){
//             $('form').trigger('reset');
//             showMyCart();
//         }
//     });
// }

// function quantityMinus(id){
//     $.ajax({
//         url:"./controller/subQuantityController.php",
//         method:"post",
//         data:{record:id},
//         success:function(data){
//             $('form').trigger('reset');
//             showMyCart();
//         }
//     });
// }

// function checkout(){
//     $.ajax({
//         url:"./view/viewCheckout.php",
//         method:"post",
//         data:{record:1},
//         success:function(data){
//             $('.allContent-section').html(data);
//         }
//     });
// }


// function removeFromWish(id){
//     $.ajax({
//         url:"./controller/removeFromWishlist.php",
//         method:"post",
//         data:{record:id},
//         success:function(data){
//             alert('Removed from wishlist');
//         }
//     });
// }


// function addToWish(id){
//     $.ajax({
//         url:"./controller/addToWishlist.php",
//         method:"post",
//         data:{record:id},
//         success:function(data){
//             alert('Added to wishlist');        
//         }
//     });
// }