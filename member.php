<?php
    include('../config/connection.php');
    $request_method = $_SERVER["REQUEST_METHOD"];
    switch ($request_method) {
        case "GET":
            $sql = " SELECT student_id,student_Fname,student_pic FROM student ";
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
                echo json_encode($sql);
            }

            break;
        case "POST":
            $ACTION = $_POST['ACTION'];
            if($ACTION == 'NewMember'){
                $Member_No = $_POST['Member_No'];
                $Member_Name = $_POST['Member_Name'];
                $Member_Lastname = $_POST['Member_Lastname'];
                $Id_Number = $_POST['Id_Number'];
                $Email = $_POST['Email'];
                $Tel = $_POST['Tel'];
                $Pic = $_POST['Pic'];

                $sql = " INSERT INTO student (student_id,student_Fname,student_Lname,id_card_number,email,tel,student_pic) VALUE ";
                $sql .= " ('".$Member_No."','".$Member_Name."','".$Member_Lastname."','".$Id_Number."','".$Email."','".$Tel."','".$FileData."') ";
                $result = mysqli_query($Con,$sql);
                mysqli_close($Con);
                if($result){
                    header('Content-Type: application/json');
                    echo json_encode('1');
                }else{
                    header('Content-Type: application/json');
                    echo json_encode('0');
                }
            }
            if($ACTION == 'EditMember'){
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

                $result = mysqli_query($Con,$sql);
                mysqli_close($Con);
                if($result){
                    header('Content-Type: application/json');
                    echo json_encode('1');
                }else{
                    header('Content-Type: application/json');
                    echo json_encode('0');
                }
            }
            if($ACTION == 'DelMember'){
                $Member_No = $_POST['delmember_no'];

                $sql = " DELETE FROM student WHERE student_id = $Member_No ";
                $result = mysqli_query($Con,$sql);
                mysqli_close($Con);
                if($result){
                    header('Content-Type: application/json');
                    echo json_encode('1');
                }else{
                    header('Content-Type: application/json');
                    echo json_encode('0');
                }
            }
            if($ACTION == 'MemberInfo'){
                $Member_id = $_POST['Member_id'];
                $sql = " SELECT student_id,student_Fname,student_Lname,email,tel,id_card_number,student_pic
                FROM student WHERE student_id = '".$Member_id."' ";
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
                    echo json_encode($rows);
                }
            }
            if($ACTION == 'NewAdmin'){
                $staff_name = $_POST['staff_name'];
                $Staff_username = $_POST['Staff_username'];
                $Passkey1 = $_POST['Passkey1'];
                $Staff_mail = $_POST['Staff_mail'];

                $sql = " INSERT INTO staff (staff_name,username,passkey,email,staff_pic,staff_status_id) VALUE ";
                $sql .= " ('".$staff_name."','".$Staff_username."','".$Passkey1."','".$Staff_mail."','img_avatar.png','st001') ";
                $result = mysqli_query($Con,$sql);
                mysqli_close($Con);
                if($result){
                    header('Content-Type: application/json');
                    echo json_encode('1');
                }else{
                    header('Content-Type: application/json');
                    echo json_encode('0');
                }
            }
        break;
    }
?>