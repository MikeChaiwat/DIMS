
<?php
    include('../config/connection.php');
    $request_method = $_SERVER["REQUEST_METHOD"];
    switch ($request_method) {
        case "GET":
            
        break;
        case "POST":
            $ACTION = $_POST['ACTION'];
            if ($ACTION == 'AUTHENTICATION') {
                $USERNAME = $_POST['USERNAME'];
                $PASSWD = $_POST['PASSWD'];
                $sql = " SELECT * FROM student WHERE username = '".$USERNAME."' AND passwords = '".$PASSWD."'";
                
                $query = mysqli_query($Con, $sql);
                $rc = mysqli_num_rows($query);
                if ($rc > 0) {
                    while ($row = mysqli_fetch_assoc($query)) {
                        $rows[] = $row;
                    }
                    mysqli_close($Con);
                    header('Content-Type: application/json');
                    echo json_encode($rows);
                } else {
                    header('Content-Type: application/json');
                    echo json_encode('0');
                }
            }
            if ($ACTION == 'NewMember') {
                $Member_No = $_POST['Member_No'];
                $Member_Name = $_POST['Member_Name'];
                $Member_Lastname = $_POST['Member_Lastname'];
                $Member_Id_Card = $_POST['Member_Id_Card'];
                $Member_Mail = $_POST['Member_Mail'];
                $Member_Tel = $_POST['Member_Tel'];

                $sql = " INSERT INTO student (student_id,student_Fname,student_Lname,id_card_number,email,tel) VALUE ";
                $sql .= " ('".$Member_No."','".$Member_Name."','".$Member_Lastname."','".$Member_Id_Card."','".$Member_Mail."','".$Member_Tel."') ";
                $result = mysqli_query($Con, $sql);
                mysqli_close($Con);
                if ($result) {
                    header('Content-Type: application/json');
                    echo json_encode('1');
                } else {
                    header('Content-Type: application/json');
                    echo json_encode('0');
                }
            }
            if ($ACTION == 'findMember') {
                $USERNAME = $_POST['USERNAME'];
                $sql = " SELECT * FROM student WHERE student_id = '".$USERNAME."' ";
                $result = mysqli_query($Con, $sql);
                mysqli_close($Con);
                if ($result) {
                    header('Content-Type: application/json');
                    echo json_encode('1');
                } else {
                    header('Content-Type: application/json');
                    echo json_encode('0');
                }
            }
            if ($ACTION == 'ForgotPass') {
                $Forusername = $_POST['Forusername'];
                $Formail = $_POST['Formail'];

                $sql = " SELECT * FROM student WHERE username = '".$Forusername."' ";
                $query = mysqli_query($Con, $sql);
                $rc = mysqli_num_rows($query);
                if ($rc > 0) {
                    while ($row = mysqli_fetch_assoc($query)) {
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
                    emailsend($email, $Subject, $strMessage);
                    header('Content-Type: application/json');
                    echo json_encode('1');
                } else {
                    header('Content-Type: application/json');
                    echo json_encode('0');
                }
            }
        break;
    }
?>