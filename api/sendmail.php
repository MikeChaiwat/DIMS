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
 include('../config/connection.php');
 $request_method = $_SERVER["REQUEST_METHOD"];
 switch ($request_method) {
    case "POST":
        $ACTION = $_POST['ACTION'];
        if($ACTION=='findDurable'){
            $user_id =$_POST['user_id'];
            $sql = "SELECT b.b_id,b.student_id,s.student_Fname,s.student_Lname,b.durable_id,p.product_name,b.loc_bor,
            b.borrow_date,b.return_date,s.email FROM durable_borrowlist b
            INNER JOIN student s on s.student_id = b.student_id  
            INNER JOIN product p on p.product_id = b.durable_id WHERE b.student_id = '".$user_id."' " ;
            $query = mysqli_query($Con,$sql);
            $rc = mysqli_num_rows($query);
            if($rc > 0){
                while($row = mysqli_fetch_assoc($query)){
                    $rows[] = $row;
                }
                mysqli_close($Con);
                header('Content-Type: application/json');
                echo json_encode($rows);

            }else{
                header('Content-Type: application/json');
                echo json_encode('0');
            }
        }
        if($ACTION =='sendDurable'){
            $Mail = $_POST['Mail'];
            $studen_F = $_POST['studen_F'];
            $studen_L = $_POST['studen_L'];
            $B_Date = $_POST['B_Date'];
            $R_Date = $_POST['R_Date'];
            $durable_N = $_POST['durable_N'];
            $user_id = $_POST['user_id'];

            $Subject = 'Notice borrow durable';
            $email = $Mail;
            $strMessage = "";
            $strMessage .= "<br>ถึงคุณ ".$studen_F."  ".$studen_L." <br>";
            $strMessage .= "=================================<br>";
            $strMessage .= "คุณได้รับการยืนยันให้ยืมครุภัณฑ์ จากผู้ดูแลเป็นที่เรียบร้อยแล้ว<br>";
            $strMessage .= "สิ่งคุณได้ยืม : ".$durable_N."<br> เริ่มยืมตั้งแต่ : ".$B_Date."<br>กรุณาคืนก่อนวันที่ : ".$R_Date."<br>";
            $strMessage .= "=================================<br>";
            $strMessage .= "Contact Support : admin@itidims.co<br>";
            $strMessage .= "By ITIDIMS<br>";
            emailsend($email,$Subject,$strMessage);
            header('Content-Type: application/json');
            echo json_encode('1');
        }
        if($ACTION=='findtool'){

            $sql = "SELECT t.b_id,s.student_id,s.student_Fname,s.student_Lname,t.box_id,bx.box_detail,
                t.loc_bor,t.borrow_date,t.return_date,s.email FROM tools_borrowlist t 
                INNER JOIN student s on s.student_id = t.student_id 
                INNER JOIN boxes bx on bx.box_id = t.box_id ";
            $query = mysqli_query($Con,$sql);
            $rc = mysqli_num_rows($query);
            if($rc > 0){
                while($row = mysqli_fetch_assoc($query)){
                    $rows[] = $row;
                }
                mysqli_close($Con);
                header('Content-Type: application/json');
                echo json_encode($rows);

            }else{
                header('Content-Type: application/json');
                echo json_encode('0');
            }
        }
        if($ACTION =='sendTools'){
            $Mail = $_POST['Mail'];
            $studen_F = $_POST['studen_F'];
            $studen_L = $_POST['studen_L'];
            $B_Date = $_POST['B_Date'];
            $R_Date = $_POST['R_Date'];
            $box_name = $_POST['box_name'];

            $Subject = 'Notice borrow durable';
            $email = $Mail;
            $strMessage = "";
            $strMessage .= "<br>ถึงคุณ ".$studen_F."  ".$studen_L." <br>";
            $strMessage .= "=================================<br>";
            $strMessage .= "คุณได้รับการยืนยันให้ยืมกล่องเครื่องมือ จากผู้ดูแลเป็นที่เรียบร้อยแล้ว<br>";
            $strMessage .= "สิ่งคุณได้ยืม : ".$box_name."<br> เริ่มยืมตั้งแต่ : ".$B_Date."<br>กรุณาคืนก่อนวันที่ : ".$R_Date."<br>";
            $strMessage .= "=================================<br>";
            $strMessage .= "Contact Support : admin@itidims.co<br>";
            $strMessage .= "By ITIDIMS<br>";
            emailsend($email,$Subject,$strMessage);
            header('Content-Type: application/json');
            echo json_encode('1');
        }
        if($ACTION =='sendRegister'){
            $student_id = $_POST['Member_No'];
            $student_Fname = $_POST['Member_Name'];
            $student_Lname = $_POST['Member_Lastname'];
            $id_card_number = $_POST['Id_Number'];
            $email = $_POST['email'];
            $tel = $_POST['tel'];


            $Subject = 'Your Accout';
            $email = $email;
            $strMessage = "";
            $strMessage .= "<br>ถึงคุณ ".$Member_Name."  ".$Member_Lastname." <br>";
            $strMessage .= "=================================<br>";
            $strMessage .= "คุณได้สมัครสมาชิกเป็นที่เรียบร้อยแล้ว<br>";
            $strMessage .= "รหัสนักศึกษาของคุณคือ(Username) : ".$Member_No."<br> หมายเลขบัตรประชาชนของคุณคือ(Password) : ".$Id_Number."<br>อีเมลล์ของคุณคือ : ".$email."<br>";
            $strMessage .= "=================================<br>";
            $strMessage .= "Contact Support : admin@itidims.co<br>";
            $strMessage .= "By ITIDIMS<br>";
            emailsend($email,$Subject,$strMessage);
            header('Content-Type: application/json');
            echo json_encode('1');
        }
        if($ACTION == 'sendRepass'){
            $staff_name = $_POST['staff_name'];
            $username = $_POST['username'];
            $passkey = $_POST['passkey'];
            $email = $_POST['email'];

            $Subject = 'Forgot Password';
            $email = $email;
            $strMessage = "";
            $strMessage .= "<br>ถึงคุณ ".$staff_name."<br>";
            $strMessage .= "=================================<br>";
            $strMessage .= "Username ของคุณคือ : ".$username."<br>";
            $strMessage .= "Password ของคุณคือ : ".$passkey."<br>";
            $strMessage .= "=================================<br>";
            $strMessage .= "Contact Support : admin@itidims.co<br>";
            $strMessage .= "By ITIDIMS<br>";
            emailsend($email,$Subject,$strMessage);
            header('Content-Type: application/json');
            echo json_encode('1');

        }
    break;
    
}      
?>

