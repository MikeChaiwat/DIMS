<?php


header('Content-Type: text/html; charset=utf-8');
ini_set('default_charset', 'utf-8');


?>

<?php
    include('config/connection.php');
   
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>DIMS</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- <link rel="stylesheet" href="lib/bootstrap/css/bootstrap.min.css"> -->
    <script src="lib/jquery/jquery.min.js"></script>
    <!-- <script src="lib/bootstrap/js/bootstrap.min.js"></script> -->

    <script src="lib/jquery-validation/dist/jquery.validate.min.js"></script>
    <link href="vendors/pnotify/dist/pnotify.css" rel="stylesheet">
    <link href="vendors/pnotify/dist/pnotify.buttons.css" rel="stylesheet">
    <script src="vendors/pnotify/dist/pnotify.js"></script>
    <script src="vendors/pnotify/dist/pnotify.buttons.js"></script>
    <link rel="stylesheet" href="lib/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="lib/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="lib/css/index.css">
    
    <script src="lib/js/CryptoJs.js"></script>
    <script src="lib/js/config.js"></script>
    
    <script src="lib/js/index.js"></script>

    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <!-- <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
</head>

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
<body style="background-image: linear-gradient(141deg, #9fb8ad 0%, #1fc8db 51%, #2cb5e8 75%);">
    <div class="wrapper fadeInDown">
        <div id="formContent">
            <div class="text-center" style="padding:13% ">
                <div class="fadeIn first">
                    <img src="lib/images/man.png" style="margin-bottom: 2%; margin-top: 5%; width: 20%;" id="icon"
                        alt="User Icon" /> <br>
                    <h2 style="font-weight: bold;">ADMIN LOGIN</h2>
                </div>
                <div class="login-form-1">
                    <form id="login-form">
                        <div class="login-form-main-message"></div>
                        <div class="main-login-form">
                            <div class="login-group">
                                    <label for="lg_username" class="sr-only">Username</label>
                                    <input type="text" class="fadeIn second" id="lg_username" name="lg_username"
                                        placeholder="ชื่อผู้ใช้งาน" >
                                    <label for="lg_password" class="sr-only">Password</label>
                                        <input type="password"  class="fadeIn third" id="lg_password" name="lg_password" placeholder="รหัสผ่าน" style="margin-top: 5%;">
                            </div>
                            <button type="submit" id="login" class="fadeIn fourth"  style="margin-top: 5%;">LOG IN</button>
                        </div>
    
                        <div id="Forgetpass"><a href="" data-toggle="modal" data-target="#ForgetPass" data-toggle="tooltip"> ลืมรหัสผ่าน</a></div>
                        <!-- <div id="NewMember"><a href="" data-toggle="modal" data-target="#RePasAdmin" data-toggle="tooltip">ลืมรหัสผ่าน </a></div> -->
                    </form>
                </div>
                <div id="swap authentication">
                    <a href="stafflogin.php"><button class="btn btn-success mx-3 my-3 " style="font-size: 16px"> เจ้าหน้าที่ </button></a>
                    <a href="userlogin.php"><button class="btn btn-success mx-3 my-3" style="font-size: 16px"> นักศึกษา </button></a>
                </div>
            </div>
        </div>
    </div>
    
    <!-- <form action="" method="post" enctype="multipart/form-data">
        <div id="RePasAdmin" class="modal fade" role="dialog">
            <div class="modal-dialog modal-md">
                <div class="modal-content">
                    <div class="modal-body">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <div class="container">
                                <h1>ลืมรหัสผ่าน</h1>
                                <p>กรุณากรอกอีเมลล์ของท่าน</p>
                                <hr>

                                <label for="email"><b>อีเมล์</b></label>
                                <input type="text" placeholder="" name="email" id="email" required>
                             
                                <button type="submit" class="registerbtn" id="repass">ยืมยัน</button>
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
    </form> -->
    
    
    <form action="adminforgotpass.php" method="post" enctype="multipart/form-data" id="Forgot_form">
        <div id="ForgetPass" class="modal fade" role="dialog">
                <div class="modal-dialog modal-md">
                    <div class="modal-content">
                        <div class="modal-header">
                            
                            <h4 class="modal-title">Forgot Password</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <label for="email" ><b>&nbsp;&nbsp;&nbsp;Username</label>
                                <input type="text" placeholder="" name="Forusername" id="Forusername" style=" margin-left:12px;  width: 94%;" required >
                            </div>
                            
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-success" id="sendForgot" >Send</button>
                            <button type="button" class="btn btn-danger" data-dismiss="modal" style="margin-bottom: 36px; height: 49px;">Close</button>
                        </div>
                    </div>
                </div>
        </div>
    </form>
    
</body>

</html>