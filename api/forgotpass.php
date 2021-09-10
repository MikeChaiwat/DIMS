<?php
    require '../PHPMailer/src/Exception.php';
    require '../PHPMailer/src/PHPMailer.php';
    require '../PHPMailer/src/SMTP.php';
    use PHPMailer\PHPMailer\PHPMailer;
    use PHPMailer\PHPMailer\Exception;
    header('Content-Type: text/html; charset=utf-8');
    ini_set('default_charset', 'utf-8');
    include('../config/connection.php');
    $request_method = $_SERVER["REQUEST_METHOD"];
    function emailsend($email,$subject,$strMessage)
        {
        date_default_timezone_set('Asia/Bangkok');
    
        $mail = new PHPMailer;
        $mail->isSMTP();
        $mail->SMTPDebug = 0;
        $mail->Host =  'mail.itidims.cf:587';
        //$mail->Port = ;
        $mail->SMTPAuth = true;
        //$mail->SMTPSecure = 'tls';
        $mail->Username = "support@itidims.cf";
        //Password to use for SMTP authentication
        $mail->Password = "123456789";
        //Set who the message is to be sent from
        $mail->setFrom('support@itidims.cf','');
        //Set who the message is to be sent to
        $mail->addAddress($email);
        //Set the subject line
        $mail->Subject = $subject;
            $mail->msgHTML($strMessage);
            $mail->Send();	
    }
    switch ($request_method) {
        case "POST":
            $ACTION = $_POST['ACTION'];
            if($ACTION == 'ForgotPass'){
                $Forusername = $_POST['Forusername'];
                $Formail = $_POST['Formail'];

                $sql = " SELECT * FROM student WHERE username = '".$Forusername."' ";
                $query = mysqli_query($Con,$sql);
                $rc = mysqli_num_rows($query);
                if($rc > 0){
                    while($row = mysqli_fetch_assoc($query)){
                        $student_id = $row['student_id'];
                        $student_Fname = $row['student_Fname'];
                        $student_Lname = $row['student_Lname'];
                        $passwords = $row['passwords'];
                        $email = $row['email'];
                        $tel = $row['tel'];
                    }
                    mysqli_close($Con);
                    $Subject = 'FORGOT PASSWORD';
                    $email = $Formail;
                    $strMessage = "";
                    $strMessage .= "<br>ถึงคุณ ".$student_Fname."  ".$student_Lname." <br>";
                    $strMessage .= "=================================<br>";
                    $strMessage .= "นี่คือข้อมูลผู้ใช้งานของคุณ<br>";
                    $strMessage .= "รหัสนักศึกษาของคุณคือ(Username) : ".$student_id."<br> รหัสผ่านของคุณคือ(Password) : ".$passwords."<br>อีเมลล์ของคุณคือ : ".$email."<br>";
                    $strMessage .= "=================================<br>";
                    $strMessage .= "สามารถเข้าใช้งานได้ที่ : itidims.cf/userlogin.php<br>";
                    $strMessage .= "Contact Support : admin@itidims.cf<br>";
                    $strMessage .= "By ITIDIMS<br>";
                    $success = emailsend($email,$Subject,$strMessage);
                    if($success){
                        header('Content-Type: application/json');
                        echo json_encode('1');
                    }
                    
                }else{
                    header('Content-Type: application/json');
                    echo json_encode('0');
                }
            }
        break;
    }
?>