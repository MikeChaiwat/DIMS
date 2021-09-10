<?php
    include('../config/connection.php');
    $request_method = $_SERVER["REQUEST_METHOD"];
    switch ($request_method) {
        case "GET":
            $sql = " SELECT student_id,student_Fname,student_pic FROM student ";
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
                echo json_encode($sql);
            }

            break;
        case "POST":
            $ACTION = $_POST['ACTION'];
            if ($ACTION == 'NewMember') {
                $Member_No = $_POST['Member_No'];
                $Member_Name = $_POST['Member_Name'];
                $Member_Lastname = $_POST['Member_Lastname'];
                $Id_Number = $_POST['Id_Number'];
                $Email = $_POST['Email'];
                $Tel = $_POST['Tel'];
                $Pic = $_POST['Pic'];
                $username = $Member_No;
                $passwords = $Id_Number;

                $sql = " INSERT INTO student (student_id,student_Fname,student_Lname,id_card_number,email,tel,username,passwords,student_pic) VALUE ";
                $sql .= " ('".$Member_No."','".$Member_Name."','".$Member_Lastname."','".$Id_Number."','".$Email."','".$Tel."','".$username."',MD5('".$passwords."'),'".$FileData."') ";
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
            if ($ACTION == 'EditMember') {
                $EditMember_No = $_POST['EditMember_No'];
                $EditMember_Name = $_POST['EditMember_Name'];
                $EditMember_Lastname = $_POST['EditMember_Lastname'];
                $EditMember_Number = $_POST['EditMember_Number'];
                $EditMember_Mail = $_POST['EditMember_Mail'];
                $EditMember_Tel = $_POST['EditMember_Tel'];

                $sql = " UPDATE student SET student_id = '".$EditMember_No."',
                student_Fname = '".$EditMember_Name."',
                student_Lname = '".$EditMember_Lastname."',
                id_card_number = '".$EditMember_Number."',
                email = '".$EditMember_Mail."',
                tel = '".$EditMember_Tel."' 
                WHERE student_id = '".$EditMember_No."' ";

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
            if ($ACTION == 'DelMember') {
                $Member_No = $_POST['delmember_no'];

                $sql = " DELETE FROM student WHERE student_id = $Member_No ";
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
            if ($ACTION == 'MemberInfo') {
                $Member_id = $_POST['Member_id'];
                $sql = " SELECT student_id,student_Fname,student_Lname,email,tel,id_card_number,student_pic,username,MD5('passwords')
                FROM student WHERE student_id = '".$Member_id."' ";
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
                    echo json_encode($rows);
                }
            }
            if ($ACTION == 'NewAdmin') {
                $staff_name = $_POST['staff_name'];
                $Staff_username = $_POST['Staff_username'];
                $Passkey1 = $_POST['Passkey1'];
                $Staff_mail = $_POST['Staff_mail'];

                $sql = " INSERT INTO staff (staff_name,username,passkey,email,staff_pic,staff_status_id) VALUE ";
                $sql .= " ('".$staff_name."','".$Staff_username."','".$Passkey1."','".$Staff_mail."','img_avatar.png','st001') ";
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
            if ($ACTION == 'ShowAdmin') {
                $sql = " SELECT staff_id,staff_name,username,staff_pic FROM staff WHERE staff_status_id='st001'";
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
            if ($ACTION == 'AdminInfo') {
                $admin_id = $_POST['admin_id'];
                $sql = " SELECT s.staff_id,s.staff_name,s.username,s.passkey,s.email,s.staff_pic,s.staff_status_id,st.staff_status_detail
                FROM staff s 
                INNER JOIN staff_status st on st.staff_status_id = s.staff_status_id 
                WHERE s.staff_id = '".$admin_id."' ";
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
                    echo json_encode($rows);
                }
            }
            if ($ACTION == 'ShowEditStat') {
                $sql = " SELECT staff_status_id,staff_status_detail FROM staff_status";
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
                    echo json_encode($rows);
                }
            }
            if ($ACTION == 'EditAdmin') {
                $editAd_name = $_POST['editAd_name'];
                $ediusername = $_POST['ediusername'];
                $ediAdemail = $_POST['ediAdemail'];

                $sql = " UPDATE staff SET
                staff_name = '".$editAd_name."',
                email = '".$ediAdemail."'
                WHERE username = '".$ediusername."' ";

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
            if ($ACTION == 'DelAdmin') {
                $username = $_POST['username'];
                $pass = $_POST['pass'];
                $passmd5 = md5($pass);

                
                
                $sql2 = "SELECT * FROM staff WHERE username = '".$username."' AND passkey='".$passmd5."' ";
                $query2 = mysqli_query($Con, $sql2);
                $rc = mysqli_num_rows($query2);
                if ($rc > 0) {
                    $sql = " DELETE FROM staff WHERE username = '".$username."' AND passkey='".$passmd5."' ";
                    $result = mysqli_query($Con, $sql);
                    
                    header('Content-Type: application/json');
                    echo json_encode('1');
                } else {
                    header('Content-Type: application/json');
                    echo json_encode('0');
                }
                mysqli_close($Con);
            }
            if ($ACTION == 'FindPass') {
                $User_no = $_POST['User_no'];
                $old_Pass = $_POST['old_Pass'];

                $sql = "SELECT * FROM student WHERE passwords = '".$old_Pass."' ";
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
            if ($ACTION == 'CheckOldpass') {
                $username = $_POST['username'];
                $oldpass = $_POST['oldpass'];
                $oldpassmd5 = md5($oldpass);
                $newpass = $_POST['newpass'];
                $newpassmd5 = md5($newpass);
                $sql = "SELECT * FROM staff WHERE username='".$username."' AND passkey='".$oldpassmd5."'";
                $query = mysqli_query($Con, $sql);
                $rc = mysqli_num_rows($query);
                if ($rc>0) {
                    $sql2 = "UPDATE staff SET passkey='".$newpassmd5."' WHERE username='".$username."' AND passkey='".$oldpassmd5."'";
                    $query2 = mysqli_query($Con, $sql2);
                    if ($query2) {
                        header('Content-Type: application/json');
                        echo json_encode('1');
                    } else {
                        header('Content-Type: application/json');
                        echo json_encode('0');
                    }
                } else {
                    header('Content-Type: application/json');
                    echo json_encode('0');
                }
            }
        break;
    }
