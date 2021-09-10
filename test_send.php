<?php
//Import PHPMailer classes into the global namespace
//These must be at the top of your script, not inside a function
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

//Load Composer's autoloader
require 'vendor/autoload.php';

//Create an instance; passing `true` enables exceptions

function TestSend()
{
    $mail = new PHPMailer();
    try {
        //Server settings
        $mail->SMTPDebug = SMTP::DEBUG_SERVER;                      //Enable verbose debug output
        $mail->isSMTP();                                            //Send using SMTP
        $mail->Host       = 'smtp.gmail.com';                     //Set the SMTP server to send through
        $mail->SMTPAuth   = true;                                   //Enable SMTP authentication
        $mail->Username   = 'dims.iti.fitm@gmail.com';                     //SMTP username
        $mail->Password   = 'itifitm11';                               //SMTP password
        $mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;            //Enable implicit TLS encryption
        $mail->Port       = 465;                                    //TCP port to connect to; use 587 if you have set `SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS`
    
        //Recipients
        $mail->setFrom('michamike.1111@gmail.com', 'KUY');
        $mail->addAddress('michamike.1111@gmail.com');     //Add a recipient
    
     
        //Content
        $mail->isHTML(true);                                  //Set email format to HTML
        $mail->Subject = 'Here is the subject';
        $mail->Body    = 'This is the HTML message body <b>in bold!</b>';
        $mail->AltBody = 'This is the body in plain text for non-HTML mail clients';
    
        $mail->send();
        return true;
    } catch (Exception $e) {
        return false;
    }
}

$send = TestSend();
echo "send: ".$send;


 // SMTP Settings
//  $mail->isSMTP();
//  $mail->Host = "smtp.gmail.com";
//  $mail->SMTPAuth = true;
//  $mail->Username = "mrchaiwat2542@gmail.com"; // enter your email address
//  $mail->Password = "11rosanneP"; // enter your password
//  $mail->Port = 465;
//  $mail->SMTPSecure = "ssl";

//  //Email Settings
//  $mail->isHTML(true);
//  $mail->setFrom("michamike.1111@gmail.com", "CHAIWAT");
//  $mail->addAddress("michamike.1111@gmail.com"); // Send to mail
//  $mail->Subject = "HEADER";
//  $mail->Body = "Hello World";

//  if ($mail->send()) {
//      $status = "success";
//      $response = "Email is sent";
//  } else {
//      $status = "failed";
//      $response = "Something is wrong" . $mail->ErrorInfo;
//  }

//  exit(json_encode(array("status" => $status, "response" => $response)));
