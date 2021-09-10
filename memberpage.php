<?php
    include('config/connection.php');
    
    // if (isset($_FILES["image"]["name"])) {
    //     $ext = pathinfo(basename($_FILES["image"]["name"]), PATHINFO_EXTENSION);
    //     $new_image_name = 'img_'.uniqid().".".$ext;
    //     $image_path = "imageMember/" ;
    //     $upload_Path = $image_path.$new_image_name;

    //     $success = move_uploaded_file($_FILES["image"]["tmp_name"], $upload_Path);

    //     $Member_No = (isset($_POST['member_id'])) ? $_POST['member_id'] : '';
    //     $Member_Name = (isset($_POST['fname'])) ? $_POST['fname'] : '';
    //     $Member_Lastname = (isset($_POST['lname'])) ? $_POST['lname'] : '';
    //     $Id_Number = (isset($_POST['id_card'])) ? $_POST['id_card'] : '';
    //     $Email = (isset($_POST['Memberemail'])) ? $_POST['Memberemail'] : '';
    //     $Tel = (isset($_POST['tel'])) ? $_POST['tel'] : '';
    //     $username = (isset($_POST['member_id'])) ? $_POST['member_id'] : '';
    //     $passwords = (isset($_POST['id_card'])) ? $_POST['id_card'] : '';

    //     if ($success == false) {
    //         //echo("upload failed");
    //     } else {
    //         //echo("upload complete");
    //         // echo($upload_Path);
    //         $sql = " INSERT INTO student (student_id,student_Fname,student_Lname,id_card_number,email,tel,username,passwords,student_pic) VALUE ";
    //         $sql .= " ('".$Member_No."','".$Member_Name."','".$Member_Lastname."','".$Id_Number."','".$Email."','".$Tel."','".$username."',MD5('".$passwords."'),'".$new_image_name."') ";
    //         $result = mysqli_query($Con, $sql);
    //         mysqli_close($Con);
    //         if ($result) {
                        
    //                     //echo json_encode('1');
    //             header('Location: main.php?page=member');
    //         } else {
                        
    //                     //echo json_encode('0');
    //         }
    //     }
    // }
     
?>
<?php
    if (isset($_FILES["imageAdmin"])) {
        $ext = pathinfo(basename($_FILES["imageAdmin"]["name"]), PATHINFO_EXTENSION);
        $new_image_name = 'img_'.uniqid().".".$ext;
        $image_path = "imageMember/" ;
        $upload_Path = $image_path.$new_image_name;
        $success = move_uploaded_file($_FILES["imageAdmin"]["tmp_name"], $upload_Path);

        $staff_name = (isset($_POST['staff_name'])) ? $_POST['staff_name'] : '';
        $username = (isset($_POST['username'])) ? $_POST['username'] : '';
        $passkey = (isset($_POST['passkey'])) ? $_POST['passkey'] : '';
        $passmd5 = md5($passkey);
        $email = (isset($_POST['email'])) ? $_POST['email'] : '';
        if ($staff_name == '') {
        } else {
            $sql = " INSERT INTO staff (staff_name,username,passkey,email,staff_pic,staff_status_id) VALUE ";
            $sql .= " ('".$staff_name."','".$username."','".$passmd5."','".$email."','".$new_image_name."','st001') ";
            $result = mysqli_query($Con, $sql);
            mysqli_close($Con);
            if ($result) {
                header('Location: main.php?page=member');
            } else {
            }
        }
    }
    
    

?>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <link rel="icon" type="image/png" href="lib/boots/img/favicon.ico">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

    <title>DIMS</title>

    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />


    <!-- Bootstrap core CSS     -->
    <link href="lib/boots/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Animation library for notifications   -->
    <link href="lib/boots/css/animate.min.css" rel="stylesheet" />

    <!--  Light Bootstrap Table core CSS    -->
    <link href="lib/boots/css/light-bootstrap-dashboard.css?v=1.4.0" rel="stylesheet" />

    <!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
    <link href="lib/boots/css/pe-icon-7-stroke.css" rel="stylesheet" />

    <!-- original -->
    <link rel="stylesheet" href="lib/bootstrap/css/bootstrap.min.css">
    <script src="lib/jquery/jquery.min.js"></script>
    <script src="lib/bootstrap/js/bootstrap.min.js"></script>
    <script src="lib/jquery-validation/dist/jquery.validate.min.js"></script>
    <!-- <script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
    <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script> -->
    <link href="vendors/pnotify/dist/pnotify.css" rel="stylesheet">
    <link href="vendors/pnotify/dist/pnotify.buttons.css" rel="stylesheet">
    <script src="vendors/pnotify/dist/pnotify.js"></script>
    <script src="vendors/pnotify/dist/pnotify.buttons.js"></script>
    <link rel="stylesheet" href="lib/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="lib/w3/w3.css">
    <link rel="stylesheet" href="lib/css/member.css">
    <script src="lib/js/config.js"></script>
    <script src="lib/js/member2.js"></script>

    <style>
        input[type=text], input[type=password],input[type=email] {
        width: 100%;
        padding: 15px;
        margin: 5px 0 22px 0;
        /* display: inline-block; */
        border: none;
        background: #f1f1f1;
        }
    </style>    
    
</head>

<body>
    <div class="wrapper">
        <div class="sidebar" data-color="purple" data-image="lib/boots/img/sidebar-5.jpg">

            <div class="sidebar-wrapper">
                <div class="logo">
                    <a href="http://www.creative-tim.com" class="simple-text">
                        DIMS
                    </a>
                </div>

                <ul class="nav">
                    <li class="active">
                        <a href="main.php?page=home">
                            <i class="pe-7s-graph"></i>
                            <p>หน้าแรก</p>
                        </a>
                    </li>
                    <li>
                        <a href="main.php?page=durable">
                            <i class="pe-7s-user"></i>
                            <p>รายการครุภัณฑ์</p>
                        </a>
                    </li>
                    <li>
                        <a href="main.php?page=toollist">
                            <i class="pe-7s-note2"></i>
                            <p>รายการเครื่องมือ</p>
                        </a>
                    </li>
                    <li>
                        <a href="main.php?page=member">
                            <i class="pe-7s-news-paper"></i>
                            <p>รายการผู้ใช้งาน</p>
                        </a>
                    </li>
                    <li>
                        <a href="main.php?page=borrowlist">
                            <i class="pe-7s-science"></i>
                            <p>รายการยืม</p>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <!-- หน้าที่ใช้เขียนข้อมูล panel -->
        <div class="main-panel">
            <div class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12">
                
                            <div class="card ">
                                <div class="header">
                                    <h4 class="title">รายการผู้ดูแลระบบ</h4>
                                </div>
                                <div style="margin-top: 2%; margin-left:2%;" id="NewAdmin">
                                    <button type="button" class="btn btn-success btn-fill" data-toggle="modal"
                                        data-target="#NewAdminModal" data-toggle="tooltip" title="เพิ่มผู้ใช้งาน">
                                        <i class="fa fa-plus" aria-hidden="true"><span> เพิ่มผู้ดูแล</span></i>
                                    </button>
                                </div>
                                <div style="padding-left: 2%; padding-right: 2%; padding-bottom: 5%;">
                                    
                                </div>
                                <div style="padding-left: 2%; padding-right: 2%; padding-bottom: 5%;">
                                    <div id="AdminList" class="tbl_ResultContainer Border">
                                            
                                    </div>
                                </div>
                            </div>
                            <div></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    
    <form action="" method="post" enctype="multipart/form-data">
       <div id="NewAdminModal" class="modal fade" role="dialog">
                <div class="modal-dialog modal-md">
                    <div class="modal-content">
                        <!-- <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title"><i class="fa fa-plus-circle" aria-hidden="true"></i> เพิ่มผู้ใช้งาน</h4>
                        </div> -->
                        <div class="modal-body">
                            <div class="panel panel-default">
                                <div class="panel-body">
                                <div class="container">
                                <h1>เพิ่มผู้ดูแล</h1>
                                <p>กรุณากรอกข้อมูลให้ครบทุกช่อง <font color="red">*</font></p>
                                <hr>

                                <label for="staff_name"><b>Fullname  <font color="red">*</font></b></label>
                                <input type="text" placeholder="Fullname" name="staff_name" id="staff_name" required>

                                <label for="username"><b>Username  <font color="red">*</font></b></label>
                                <input type="text" placeholder="username" name="username" id="username" required>

                                <label for="passkey"><b>Password  <font color="red">*</font></b></label>
                                <input type="password" placeholder="" name="passkey" id="passkey" required>

                                <label for="passkey2"><b>Re-Password  <font color="red">*</font></b></label>
                                <input type="password" placeholder="" name="passkey2" id="passkey2" required>


                                <label for="email"><b>E-mail  <font color="red">*</font></b></label>
                                <input type="email" placeholder="" name="email" id="email" required>

                                <label for="image"><b>รูปโปรไฟล์</b></label>
                                <input type="file" placeholder="" name="imageAdmin" id="imageAdmin" >

                                <hr>
                                <button type="submit" class="registerbtn" >ลงทะเบียน</button>
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

        <div id="ViewAdminModal" class="modal fade" role="dialog">
            <div class="modal-dialog modal-md">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">โปรไฟล์</h4>
                    </div>
                    <div class="modal-body">
                        <div class="modal-body">
                            <div class="row">
                                <div id="showProfileAdmin"></div>
                                <input type="hidden" id="admin_id">
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button id="close_edit" type="button" class="btn btn-default" data-dismiss="modal">ปิด</button>
                    </div>
                </div>
            </div>
        </div>
        
        <div id="EditAdminModal" class="modal fade" role="dialog">
            <div class="modal-dialog modal-md">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title"><i class="fa fa-pencil-square" aria-hidden="true"></i>
                            แก้ไขข้อมูลผู้ดูแลระบบ
                        </h4>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <label for="usr">ชื่อ</label>
                                    <input type="text" class="form-control" id="editAd_name">
                                </div>
                                <div class="form-group">
                                    <label for="usr">password</label><br>
                                    <button class="btn btn-success" data-toggle="modal"
                                        data-target="#ChangePassModal" data-toggle="tooltip" title="เพิ่มผู้ใช้งาน">เปลี่ยน password</button>
                                </div>
                
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <label for="usr">username</label>
                                    <input type="text" class="form-control" id="ediusername" disabled="disabled">
                                </div>
                                <div class="form-group">
                                    <label for="usr">e-mail</label>
                                    <input type="text" class="form-control" id="ediAdemail">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">ปิด</button>
                        <button id="admin_edit_btn" type="button" class="btn btn-success">แก้ไข</button>
                    </div>
                </div>
            </div>
        </div>
        
        <div id="DelAdminModal" class="modal fade" role="dialog">
            <div class="modal-dialog modal-md">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title"><i class="fa fa-trash" aria-hidden="true"></i>ลบข้อมูล</h4>
                    </div>
                    <div class="modal-body">
                        <div class="modal-body">
                            <div class="row">
                                <h3> กรุณาใส่ password ของ username นี้เพื่อลบข้อมูล </h3>
                                <input type="password" id="admin_del_pass" >
                                <input type="hidden" id="admin_del_user" >
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">ไม่</button>
                        <button id="admin_del_btn" type="button" class="btn btn-success">ใช่</button>
                    </div>
                </div>
            </div>
        </div>

        <div id="ChangePassModal" class="modal fade" role="dialog">
            <div class="modal-dialog modal-md">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title"><i class="fa fa-refresh" aria-hidden="true"></i>เปลี่ยน Password</h4>
                    </div>
                    <div class="modal-body">
                        <div class="modal-body">
                            <div class="row">
                                <h3> Old password</h3>
                                <input type="password" name="" id="oldpass" >
                            </div>
                            <div class="row">
                                <h3> New password</h3>
                                <input type="password" name="" id="newpass" >
                            </div>
                            <div class="row">
                                <h3> Confirm New password</h3>
                                <input type="password" name="" id="confirm_newpass" >
                            </div>
                            <input type="hidden" id="admin_user">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">ยกเลิก</button>
                        <button id="changepass_btn" type="button" class="btn btn-success">เปลี่ยน Password</button>
                    </div>
                </div>
            </div>
        </div>
   

</body>

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


</html>