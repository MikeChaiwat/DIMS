<?php
    require 'PHPMailer/src/Exception.php';
    require 'PHPMailer/src/PHPMailer.php';
    require 'PHPMailer/src/SMTP.php';
    use PHPMailer\PHPMailer\PHPMailer;
    use PHPMailer\PHPMailer\Exception;
    header('Content-Type: text/html; charset=utf-8');
    ini_set('default_charset', 'utf-8');

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
?>
<?php
    include('config/connection.php');

    $Forusername = (isset($_POST['Forusername']))? $_POST['Forusername'] : '' ;
    $Formail = (isset($_POST['Formail']))? $_POST['Formail'] : '' ;
    if($Forusername != ''){

    $sql = " SELECT * FROM student WHERE username = '".$Forusername."' ";
    $result = mysqli_query($Con,$sql);
    if($result){
        $Email = (isset($_POST['email'])) ? $_POST['email'] : '';   
        // $sql2 = " SELECT student_id,student_Fname,student_Lname,id_card_number,email,username,passwords FROM student WHERE email = '".$Email."' ";
        $query = mysqli_query($Con,"SELECT student_id,student_Fname,student_Lname,id_card_number,email,username,passwords FROM student WHERE student_id = '".$Member_No."' ");
        $rc = mysqli_num_rows($query);
        while ($row=mysqli_fetch_array($query)){
            $student_id = $row['student_id'];
            $Member_Name = $row['student_Fname'];
            $Member_Lastname = $row['student_Lname'];
            $passwords = $row['passwords'];
            $Id_Number = $row['Id_Number'];
            $Email = $row['email'];
            $Tel = $row['Tel'];
            $username = $row['username'];
        }
    }
    mysqli_close($Con);
        $Subject = 'FORGOT PASSWORD';
        $email = $Formail;
        $strMessage = "";
        $strMessage .= "<br>ถึงคุณ ".$Member_Name."  ".$Member_Lastname." <br>";
        $strMessage .= "=================================<br>";
        $strMessage .= "นี่คือข้อมูลผู้ใช้งานของคุณ<br>";
        $strMessage .= "รหัสนักศึกษาของคุณคือ(Username) : ".$student_id."<br> รหัสผ่านของคุณคือ(Password) : ".$passwords."<br>อีเมลล์ของคุณคือ : ".$email."<br>";
        $strMessage .= "=================================<br>";
        $strMessage .= "สามารถเข้าใช้งานได้ที่ : itidims.cf/userlogin.php<br>";
        $strMessage .= "Contact Support : admin@itidims.cf<br>";
        $strMessage .= "By ITIDIMS<br>";
        $success = emailsend($email,$Subject,$strMessage);
        header("Location:/userlogin.php");
        if($success == TRUE){
            // header('Content-Type: application/json');
            // echo json_encode('1');
            //echo '<script type="text/javascript">alert("Email Sended");</script>';
            //header("Location:/userlogin.php");
        }    
        else{
            // header('Content-Type: application/json');
            // echo json_encode('0');
            echo 'erorr';
        }
    }
?>
