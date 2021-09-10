<?php


header('Content-Type: text/html; charset=utf-8');
ini_set('default_charset', 'utf-8');
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

//Load Composer's autoloader
require 'vendor/autoload.php';
function emailsend($email, $subject, $body)
{
    $mail = new PHPMailer();
    try {
        //Server settings
            //$mail->SMTPDebug = SMTP::DEBUG_SERVER;                      //Enable verbose debug output
            $mail->isSMTP();                                            //Send using SMTP
            $mail->Host       = 'smtp.gmail.com';                     //Set the SMTP server to send through
            $mail->SMTPAuth   = true;                                   //Enable SMTP authentication
            $mail->Username   = 'dims.iti.fitm@gmail.com';                     //SMTP username
            $mail->Password   = 'itifitm11';                               //SMTP password
            $mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;            //Enable implicit TLS encryption
            $mail->Port       = 465;                                    //TCP port to connect to; use 587 if you have set `SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS`
        
            //Recipients
        $mail->setFrom($email, 'Your Account');
        $mail->addAddress($email);     //Add a recipient
        
        //Content
            $mail->isHTML(true);                                  //Set email format to HTML
            $mail->Subject = $subject;
        $mail->Body    = $body;
        
        $mail->send();
        return true;
    } catch (Exception $e) {
        return false;
    }
}

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
    <link rel="stylesheet" href="lib/css/userlog.css">
    
    <script src="lib/js/CryptoJs.js"></script>
    <script src="lib/js/config.js"></script>
    
    <script src="lib/js/staff_login.js"></script>

    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <!-- <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
</head>
<?php
    if (isset($_FILES["image"])) {
        $ext = pathinfo(basename($_FILES["image"]["name"]), PATHINFO_EXTENSION);
        $new_image_name = 'img_staff_'.uniqid().".".$ext;
        $image_path = "imageMember/" ;
        $upload_Path = $image_path.$new_image_name;
    
        $staff_name = (isset($_POST['staff_name'])) ? $_POST['staff_name'] : '';
        $username = (isset($_POST['username'])) ? $_POST['username'] : '';
        $passkey = (isset($_POST['passkey'])) ? $_POST['passkey'] : '';
        $passmd5 = md5($passkey);
        $email = (isset($_POST['email'])) ? $_POST['email'] : '';
        move_uploaded_file($_FILES["image"]["tmp_name"], $upload_Path);

        if ($staff_name == '') {
        } else {
            $sql = " INSERT INTO staff (staff_name,username,passkey,email,staff_pic,staff_status_id) VALUE ";
            $sql .= " ('".$staff_name."','".$username."','".$passmd5."','".$email."','".$new_image_name."','st002') ";
            $result = mysqli_query($Con, $sql);
            if ($result) {
                $Email = (isset($_POST['email'])) ? $_POST['email'] : '';
                $sql = " SELECT * FROM staff WHERE email = '".$Email."' ";
                $query = mysqli_query($Con, $sql);
                $rc = mysqli_num_rows($query);
                while ($row=mysqli_fetch_array($query)) {
                    $staff_name = $row['staff_name'];
                    $username = $row['username'];
                    $email = $row['email'];
                }
                $Subject = 'Your Accout';
                $email = $Email;
                $strMessage = "";
                $strMessage .= "<br>ถึงคุณ ".$staff_name."<br>";
                $strMessage .= "=================================<br>";
                $strMessage .= "Username ของคุณคือ : '".$username."'<br>";
                $strMessage .= "Password ของคุณคือ : ".$passkey."<br>";
                $strMessage .= "Email ของคุณคือ : ".$email."<br>";
                $strMessage .= "=================================<br>";
                $strMessage .= "Contact Support : dims.iti.fitm@gmail.com<<br>";
                $strMessage .= "By ITIDIMS<br>";
                $success = emailsend($email, $Subject, $strMessage);

                if ($success == true) {
                    echo '<script type="text/javascript">alert("ข้อมูลได้ถูกส่งไปยัง Email ของท่านแล้ว");';
                    echo "window.location = 'stafflogin.php'; ";
                    echo "</script>";
                } else {
                    echo '<script type="text/javascript">alert("Error");</script>';
                }
                mysqli_close($Con);
            } else {
                echo '<script type="text/javascript">alert("Error");</script>';
            }
        }
    }
?>
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
                    <h2 style="font-weight: bold;">STAFF LOGIN</h2>
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
                        <div id="NewAdmin"><a href="" data-toggle="modal" data-target="#NewAdminModal" data-toggle="tooltip"> สมัครสมาชิก</a></div>
                        <div id="Forgetpass"><a href="" data-toggle="modal" data-target="#ForgetPass" data-toggle="tooltip"> ลืมรหัสผ่าน</a></div>
                        <!-- <div id="NewMember"><a href="" data-toggle="modal" data-target="#RePasAdmin" data-toggle="tooltip">ลืมรหัสผ่าน </a></div> -->
                    </form>
                </div>
                <div id="swap authentication">
                    <a href="admin.php"><button class="btn btn-success mx-3 my-3 " style="font-size: 16px"> ผู้ดูแลระบบ </button></a>
                    <a href="userlogin.php"><button class="btn btn-success mx-3 my-3" style="font-size: 16px"> นักศึกษา </button></a>
                </div>
            </div>
        </div>
    </div>
    

    
    <form action="" method="post" enctype="multipart/form-data" id="Member_form">
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
                                <h1>สมัครสมาชิก(บุคลากร)</h1>
                                <p>กรุณากรอกข้อมูลให้ครบทุกช่อง <font color="red">*</font></p>
                                <hr>

                                <label for="staff_name"><b>ชื่อเต็ม  <font color="red">*</font></b></label>
                                <input type="text" placeholder="ชื่อ - นามสกุล" name="staff_name" id="staff_name" required>

                                <label for="username"><b>Username  <font color="red">*</font></b></label>
                                <input type="text" placeholder="ชื่อผู้ใช้งาน" name="username" id="username" required>

                                <label for="passkey"><b>Password  <font color="red">*</font></b></label>
                                <input type="password" placeholder="รหัสผ่าน" name="passkey" id="passkey" required>

                                <label for="passkey2"><b>Re-Password  <font color="red">*</font></b> <b style="margin-left: 150px;" id='message'></b> </label>
                                <input type="password" placeholder="รหัสผ่านอีกครั้ง" name="passkey2" id="passkey2" value="" required>
                                


                                <label for="email"><b>E-mail  <font color="red">*</font></b></label>
                                <input type="email" placeholder="xxxxx@xxx.xxx" name="email" id="email" required>

                                <label for="file"><b>รูปโปรไฟล์ <font color="red">*</font></b></label>
                                <input type="file" placeholder="" name="image" id="image" required>
                                
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
    <form action="staffforgetpass.php" method="post" enctype="multipart/form-data" id="Forgot_form">
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