<?php
//Import PHPMailer classes into the global namespace
//These must be at the top of your script, not inside a function
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

//Load Composer's autoloader
require 'vendor/autoload.php';

//Create an instance; passing `true` enables exceptions

    header('Content-Type: text/html; charset=utf-8');
    ini_set('default_charset', 'utf-8');

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
            $mail->setFrom($email, 'DIMS Forgot Password');
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

    $Forusername = (isset($_POST['Forusername']))? $_POST['Forusername'] : header("location: admin.php") ;
    if ($Forusername != '') {
        $sql = " SELECT * FROM staff WHERE username = '".$Forusername."' ";
        $result = mysqli_query($Con, $sql);
        $row = mysqli_num_rows($result);
        if ($row > 0) {
            $newpass = uniqid();
            $newpassmd5 = md5($newpass);
            $sql2 = "UPDATE staff SET passkey='".$newpassmd5."' WHERE username='".$Forusername."'";
            $query2 = mysqli_query($Con, $sql2);
            if ($query2) {
                $sql = "SELECT * FROM staff WHERE username = '".$Forusername."'";
                $query = mysqli_query($Con, $sql);
                $rc = mysqli_num_rows($query);
                while ($row=mysqli_fetch_array($query)) {
                    $staff_name = $row['staff_name'];
                    $username = $row['username'];
                    $email = $row['email'];
                }
                $Subject = 'FORGOT PASSWORD';
                $strMessage = "";
                $strMessage .= "<br>ถึงคุณ ".$staff_name." <br>";
                $strMessage .= "=================================<br>";
                $strMessage .= "นี่คือข้อมูลผู้ใช้งานของคุณ<br>";
                $strMessage .= "รหัสของคุณคือ(Username) : ".$username."<br> รหัสผ่านของคุณคือ(Password) : ".$newpass."<br>อีเมลล์ของคุณคือ : ".$email."<br>";
                $strMessage .= "=================================<br>";
                $strMessage .= "สามารถเข้าใช้งานได้ที่ : iti.fitm.kmutnb.ac.th<br>";
                $strMessage .= "Contact Support : dims.iti.fitm@gmail.com<br>";
                $strMessage .= "By ITIDIMS<br>";
                $success = emailsend($email, $Subject, $strMessage);
                if ($success == true) {
                    echo '<script type="text/javascript">alert("Password ได้ถูกส่งไปยัง Email ของท่านแล้ว");';
                    echo "window.location = 'admin.php'; ";
                    echo "</script>";
                } else {
                    echo '<script type="text/javascript">alert("Error");</script>';
                }
            }
        }
        mysqli_close($Con);
    }
?>
