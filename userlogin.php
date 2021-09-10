<?php


    header('Content-Type: text/html; charset=utf-8');
    ini_set('default_charset', 'utf-8');

    
?>

<?php
    // include('config/connection.php');
    
    // $ext = pathinfo(basename($_FILES["image"]["name"]),PATHINFO_EXTENSION);
    // $new_image_name = 'img_'.uniqid().".".$ext;
    // $image_path = "imageMember/" ;
    // $upload_Path = $image_path.$new_image_name;

    // $Member_No = (isset($_POST['member_id'])) ? $_POST['member_id'] : '';
    // $Member_Name = (isset($_POST['fname'])) ? $_POST['fname'] : '';
    // $Member_Lastname = (isset($_POST['lname'])) ? $_POST['lname'] : '';
    // $Id_Number = (isset($_POST['id_card'])) ? $_POST['id_card'] : '';
    // $Email = (isset($_POST['email'])) ? $_POST['email'] : '';
    // $Tel = (isset($_POST['tel'])) ? $_POST['tel'] : '';
    // $username = (isset($_POST['member_id'])) ? $_POST['member_id'] : '';
    // $passwords = (isset($_POST['id_card'])) ? $_POST['id_card'] : '';

    // $success = move_uploaded_file($_FILES["image"]["tmp_name"],$upload_Path);
    // if($success == FALSE){
    //     //echo("upload failed");
    // }
    // else{
    //     //echo("upload complete");
    //     // echo($upload_Path);
    //     $sql = " INSERT INTO student (student_id,student_Fname,student_Lname,id_card_number,email,tel,username,passwords,student_pic) VALUE ";
    //             $sql .= " ('".$Member_No."','".$Member_Name."','".$Member_Lastname."','".$Id_Number."','".$Email."','".$Tel."','".$username."',MD5('".$passwords."'),'".$new_image_name."') ";
    //             $result = mysqli_query($Con,$sql);
                
    //             if($result){
    //                 $query = mysqli_query($Con," SELECT student_id,student_Fname,student_Lname,username,passwords,email FROM student WHERE student_id = '".$Member_No."' ");
    //                 $rc = mysqli_num_rows($query);
    //                 if($rc > 0){
    //                     while($row = mysqli_fetch_assoc($query)){
    //                         //$rows[] = $row;
    //                         $student_id = $row['student_id'];
    //                         $student_Fname = $row['student_Fname'];
    //                         $student_Lname = $row['student_Lname'];
    //                         $passwords = $row['passwords'];
    //                         $email = $row['email'];
    //                         $tel = $row['tel'];
    //                     }
    //                 }
    //                 mysqli_close($Con);
    //                 $Subject = 'Your Accout';
    //                 $email = $email;
    //                 $strMessage = "";
    //                 $strMessage .= "<br>ถึงคุณ ".$student_Fname."  ".$student_Lname." <br>";
    //                 $strMessage .= "=================================<br>";
    //                 $strMessage .= "คุณได้สมัครสมาชิกเป็นที่เรียบร้อยแล้ว<br>";
    //                 $strMessage .= "รหัสนักศึกษาของคุณคือ(Username) : ".$student_id."<br> รหัสผ่านของคุณคือ(Password) : ".$passwords."<br>อีเมลล์ของคุณคือ : ".$email."<br>";
    //                 $strMessage .= "=================================<br>";
    //                 $strMessage .= "สามารถเข้าใช้งานได้ที่ : itidims.cf/userlogin.php<br>";
    //                 $strMessage .= "Contact Support : admin@itidims.cf<br>";
    //                 $strMessage .= "By ITIDIMS<br>";
    //                 emailsend($email,$Subject,$strMessage);
    //                 // header('Content-Type: application/json');
    //                 // echo json_encode('1');
                    
    //             }else{
    //                 // header('Content-Type: application/json');
    //                 // echo json_encode('0');
    //             }
    // }
                    
?>

<?php
    include('config/connection.php');
    if (isset($_FILES["image"])) {
        $ext = pathinfo(basename($_FILES["image"]["name"]), PATHINFO_EXTENSION);
        $new_image_name = 'img_'.uniqid().".".$ext;
        $image_path = "imageMember/" ;
        $upload_Path = $image_path.$new_image_name;

        $Member_No = (isset($_POST['member_id'])) ? $_POST['member_id'] : '';
        $Member_Name = (isset($_POST['fname'])) ? $_POST['fname'] : '';
        $Member_Lastname = (isset($_POST['lname'])) ? $_POST['lname'] : '';
        $Id_Number = (isset($_POST['id_card'])) ? $_POST['id_card'] : '';
        $Email = (isset($_POST['email'])) ? $_POST['email'] : '';
        $Tel = (isset($_POST['tel'])) ? $_POST['tel'] : '';
        $username = (isset($_POST['member_id'])) ? $_POST['member_id'] : '';
        $passwords = (isset($_POST['id_card'])) ? $_POST['id_card'] : '';

        $success = move_uploaded_file($_FILES["image"]["tmp_name"], $upload_Path);
        if ($success == false) {
        } else {
            $sql = " INSERT INTO student (student_id,student_Fname,student_Lname,id_card_number,email,tel,username,passwords,student_pic) VALUE ";
            $sql .= " ('".$Member_No."','".$Member_Name."','".$Member_Lastname."','".$Id_Number."','".$Email."','".$Tel."','".$username."','".$passwords."','".$new_image_name."') ";
            $result = mysqli_query($Con, $sql);
            // mysqli_close($Con);
            if ($result) {
                $Email = (isset($_POST['email'])) ? $_POST['email'] : '';
                // $sql2 = " SELECT student_id,student_Fname,student_Lname,id_card_number,email,username,passwords FROM student WHERE email = '".$Email."' ";
                $query = mysqli_query($Con, "SELECT student_id,student_Fname,student_Lname,id_card_number,email,username,passwords FROM student WHERE student_id = '".$Member_No."' ");
                $rc = mysqli_num_rows($query);
                while ($row=mysqli_fetch_array($query)) {
                    $student_id = $row['student_id'];
                    $Member_Name = $row['student_Fname'];
                    $Member_Lastname = $row['student_Lname'];
                    $passwords = $row['passwords'];
                    $Id_Number = $row['Id_Number'];
                    $Email = $row['email'];
                    $Tel = $row['Tel'];
                    $username = $row['username'];
                }
                mysqli_close($Con);
                $Subject = 'Your Accout';
                $email = $Email;
                $strMessage = "";
                $strMessage .= "<br>ถึงคุณ ".$Member_Name." ".$Member_Lastname."<br>";
                $strMessage .= "=================================<br>";
                $strMessage .= "Username ของคุณคือ : '".$username."'<br>";
                $strMessage .= "Password ของคุณคือ : ".$passwords."<br>";
                $strMessage .= "Email ของคุณคือ : ".$Email."<br>";
                $strMessage .= "รหัสบัตรประชาชนของคุณคือ : ".$Id_Number."<br>";
                $strMessage .= "เบอร์โทรศัพท์ของคุณคือ : ".$Tel."<br>";
                $strMessage .= "=================================<br>";
                $strMessage .= "Contact Support : admin@itidims.co<br>";
                $strMessage .= "By ITIDIMS<br>";
                emailsend($email, $Subject, $strMessage);

                header('Location: userlogin.php');
            } else {
            }
        }
    }
    
    
    

?>
<?php
function checkPID($id_card)
{
    if (strlen($id_card) != 13) {
        return false;
    }
    for ($i=0, $sum=0; $i<12;$i++) {
        $sum += (int)($id_card{$i})*(13-$i);
    }
    if ((11-($sum%11))%10 == (int)($id_card{12})) {
        return true;
    }
    return false;
}

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
    <!-- <script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
    <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script> -->
    <link href="vendors/pnotify/dist/pnotify.css" rel="stylesheet">
    <link href="vendors/pnotify/dist/pnotify.buttons.css" rel="stylesheet">
    <script src="vendors/pnotify/dist/pnotify.js"></script>
    <script src="vendors/pnotify/dist/pnotify.buttons.js"></script>
    <link rel="stylesheet" href="lib/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="lib/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="lib/css/userlog.css">
    <script src="lib/js/CryptoJs.js"></script>
    <script src="lib/js/config.js"></script>
    <script src="lib/js/userlog.js"></script>

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
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <!-- <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->


</head>

<body style="background-image: linear-gradient(141deg, #9fb8ad 0%, #1fc8db 51%, #2cb5e8 75%);">
    <div class="wrapper fadeInDown">
        <div id="formContent">
            <div class="text-center" style="padding:13% 0">
                <div class="fadeIn first">
                    <img src="lib/images/man.png" style="margin-bottom: 2%; margin-top: 5%; width: 20%;" id="icon"
                        alt="User Icon" /> <br>
                    <h3 style="font-weight: bold;">เข้าสู่ระบบ</h3>
                </div>
                <div class="login-form-1">
                    <form id="login-form">
                        <div class="login-form-main-message"></div>
                        <div class="main-login-form">
                            <div class="login-group">
                                    <label for="lg_username" class="sr-only">username</label>
                                    <input type="text" class="fadeIn second" id="lg_username" name="lg_username"
                                        placeholder="รหัสนักศึกษา" style="margin-left:5px; margin-right:5px; width: 80%;">
                                    <label for="lg_password" class="sr-only">Password</label>
                                        <input type="password" class="fadeIn third" id="lg_password" name="lg_password" placeholder="รหัสประจำตัวประชาชน" style="margin-top: 5%; margin-left:5px; margin-right:5px; width: 80%;">
                            </div>
                            <button type="submit" id="login" class="fadeIn fourth"  style="margin-top: 5%;">เข้าสู่ระบบ</button>
                        </div>
                        <div id="NewMember"><a href="" data-toggle="modal" data-target="#NewMemberAdd" data-toggle="tooltip"> สมัครสมาชิก</a></div>
                        <!-- <div id="Forgetpass"><a href="" data-toggle="modal" data-target="#ForgetPass" data-toggle="tooltip"> ลืมรหัสผ่าน</a></div> -->
                    </form>
                </div>
                <div id="swap authentication">
                    <a href="index.html"><button class="btn btn-success mx-3 my-3 " style="font-size: 16px"> ผู้ดูแลระบบ </button></a>
                    <a href="stafflogin.php"><button class="btn btn-success mx-3 my-3" style="font-size: 16px"> เจ้าหน้าที่ </button></a>
                </div>
            </div>
        </div>
    </div>
    <form action="" method="post" enctype="multipart/form-data" id="Member_form">
        <div id="NewMemberAdd" class="modal fade" role="dialog">
            <div class="modal-dialog modal-md">
                <div class="modal-content">
                    <div class="modal-body">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <div class="container">
                                <h1>ลงทะเบียน</h1>
                                <p>กรุณากรอกข้อมูลให้ครบทุกช่อง <font color="red">*</font></p>
                                <hr>

                                <label for="member_id"><b>รหัสนักศึกษา  <font color="red">*</font></b></label>
                                <input type="text" placeholder="รหัสนักศึกษา 13 หลัก" name="member_id" id="member_id" required>
                                <!-- <script>
                                  // just for the demos, avoids form submit
                                    jQuery.validator.setDefaults({
                                    debug: true,
                                    success: "valid"
                                    });
                                    $( "#Member_form" ).validate({
                                    rules: {
                                        member_id: {
                                        required: true,
                                        minlength: 13
                                        }
                                    }
                                    });
                                </script><br> -->

                                <label for="fname"><b>ชื่อ  <font color="red">*</font></b></label>
                                <input type="text" placeholder="ชื่อจริง" name="fname" id="fname" required>

                                <label for="lname"><b>นามสกุล  <font color="red">*</font></b></label>
                                <input type="text" placeholder="นามสกุลจริง" name="lname" id="lname" required>

                                <label for="id_card"><b>หมายเลขบัตรประชาชน  <font color="red">*</font></b></label>
                                <input type="text" placeholder="หมายเลขบัตรประชาชน 13 หลัก" name="id_card" id="id_card" required>

                                <label for="email"><b>อีเมล์  <font color="red">*</font></b></label>
                                <input type="email" placeholder="" name="email" id="email" required>

                                <label for="tel"><b>เบอร์โทรติดต่อ  <font color="red">*</font></b></label>
                                <input type="text" placeholder="" name="tel" id="tel" required>

                                <label for="image"><b>รูปโปรไฟล์ <font color="red">*</font>  </b></label>
                                <input type="file" placeholder="" name="image" id="image" required>
                                <hr>
                                <button type="submit"  id="registerbtn" class="btn btn-success">ลงทะเบียน</button>
                            </div>
                        </div>
                    </div>
                </div>   
                <div class="modal-footer">
                    <button type="submit" class="btn btn-danger" data-dismiss="modal">ปิด</button>
                </div>
            </div>
            </div>
        </div>
    </form>
    <form action="sendforgotpass.php" method="post" enctype="multipart/form-data" id="Forgot_form">
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
                                <label for="email"><b>&nbsp;&nbsp;&nbsp;E-mail</label>
                                <input type="email" placeholder="" name="Formail" id="Formail" style=" margin-left:12px;  width: 94%;" required>
                            </div>
                            <?php //include('sendforgotpass.php');?>
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