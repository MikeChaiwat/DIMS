<?php
    include('../config/connection.php');
    $ext="";
    $ext = pathinfo(basename($_FILES["image"]["name"]),PATHINFO_EXTENSION);
    $new_image_name = 'img_'.uniqid().".".$ext;
    $image_path = "../imageMember/" ;
    $upload_Path = $image_path.$new_image_name;

    $Member_No = (isset($_POST['member_id'])) ? $_POST['member_id'] : '';
    $Member_Name = (isset($_POST['fname'])) ? $_POST['fname'] : '';
    $Member_Lastname = (isset($_POST['lname'])) ? $_POST['lname'] : '';
    $Id_Number = (isset($_POST['id_card'])) ? $_POST['id_card'] : '';
    $Email = (isset($_POST['email'])) ? $_POST['email'] : '';
    $Tel = (isset($_POST['tel'])) ? $_POST['tel'] : '';

    $success = move_uploaded_file($_FILES["image"]["tmp_name"],$upload_Path);
    if($success == FALSE){
        //echo("upload failed");
    }
    else{
        //echo("upload complete");
        // echo($upload_Path);
    }
    $sql = " INSERT INTO student (student_id,student_Fname,student_Lname,id_card_number,email,tel,student_pic) VALUE ";
                $sql .= " ('".$Member_No."','".$Member_Name."','".$Member_Lastname."','".$Id_Number."','".$Email."','".$Tel."','".$new_image_name."') ";
                $result = mysqli_query($Con,$sql);
                mysqli_close($Con);
                if($result){
                    
                    //echo json_encode('1');
                }else{
                    
                    //echo json_encode('0');
                }
?>
<!doctype html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>
    body {
    font-family: Arial, Helvetica, sans-serif;
    background-color: ;
    }

    * {
    box-sizing: border;
    }

    /* Add padding to containers */
    .container {
    padding: px;
    background-color: white;
    width:50%
    }

    /* Full-width input fields */
    input[type=text], input[type=password] {
    width: 100%;
    padding: 15px;
    margin: 5px 0 22px 0;
    display: inline-block;
    border: none;
    background: #f1f1f1;
    }

    input[type=text]:focus, input[type=password]:focus {
    background-color: #ddd;
    outline: none;
    }

    /* Overwrite default styles of hr */
    hr {
    border: 1px solid #f1f1f1;
    margin-bottom: 25px;
    }

    /* Set a style for the submit button */
    .registerbtn {
    background-color: #4CAF50;
    color: white;
    padding: 16px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 100%;
    opacity: 0.9;
    }

    .registerbtn:hover {
    opacity: 1;
    }

    /* Add a blue text color to links */
    a {
    color: dodgerblue;
    }

    /* Set a grey background color and center the text of the "sign in" section */
    .signin {
    background-color: #f1f1f1;
    text-align: center;
    }
</style>
</head>
<body>
<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#NewMemberModal">Open Modal</button>
    <form action="" method="post" enctype="multipart/form-data">
    <div id="NewMemberModal" class="modal fade" role="dialog">
                <div class="modal-dialog modal-md">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title"><i class="fa fa-plus-circle" aria-hidden="true"></i> เพิ่มผู้ใช้งาน</h4>
                        </div>
                        <div class="modal-body">
                            <div class="panel panel-default">
                                <div class="panel-body">
                                <div class="container">
                                <h1>ลงทะเบียน</h1>
                                <p>กรุณากรอกข้อมูลให้ครบทุกช่อง</p>
                                <hr>

                                <label for="member_id"><b>รหัสนักศึกษา</b></label>
                                <input type="text" placeholder="รหัสนักศึกษา 13 หลัก" name="member_id" id="member_id" required>

                                <label for="fname"><b>ชื่อ</b></label>
                                <input type="text" placeholder="ชื่อจริง" name="fname" id="fname" required>

                                <label for="lname"><b>นามสกุล</b></label>
                                <input type="text" placeholder="นามสกุลจริง" name="lname" id="lname" required>

                                <label for="id_card"><b>หมายเลขบัตรประชาชน</b></label>
                                <input type="text" placeholder="หมายเลขบัตรประชาชน 13 หลัก" name="id_card" id="id_card" required>

                                <label for="email"><b>อีเมล์</b></label>
                                <input type="text" placeholder="" name="email" id="email" required>

                                <label for="tel"><b>เบอร์โทรติดต่อ</b></label>
                                <input type="text" placeholder="" name="tel" id="tel" required>

                                <label for="image"><b>รูปโปรไฟล์</b></label>
                                <input type="file" placeholder="" name="image" id="image" required>
                                <hr>
                                <button type="submit" class="registerbtn">ลงทะเบียน</button>
                            </div>
                        </div>
                                </div>
                            </div>
                            
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-default" data-dismiss="modal">ปิด</button>
                        </div>
                    </div>
                </div>
            </div>
    </form>
</body>
</html>
<!--   Core JS Files   -->
<script src="lib/boots/js/jquery.3.2.1.min.js" type="text/javascript"></script>
<script src="lib/boots/js/bootstrap.min.js" type="text/javascript"></script>

<!--  Charts Plugin -->
<script src="lib/boots/js/chartist.min.js"></script>

<!--  Notifications Plugin    -->
<script src="lib/boots/js/bootstrap-notify.js"></script>

<!-- Light Bootstrap Table Core javascript and methods for Demo purpose -->
<script src="lib/boots/js/light-bootstrap-dashboard.js?v=1.4.0"></script>

<!-- Light Bootstrap Table DEMO methods, don't include it in your project! -->
<script src="lib/boots/js/demo.js"></script>
