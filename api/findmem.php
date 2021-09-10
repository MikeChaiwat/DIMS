<?php
    include('../config/connection.php');
    $request_method = $_SERVER["REQUEST_METHOD"];
    switch ($request_method) {
        case "GET":
            break;
        case "POST":
            $ACTION = $_POST['ACTION'];
            if($ACTION == 'FindPass'){
                $User_no = $_POST['User_no'];
                $old_Pass = $_POST['old_Pass'];

                $sql =" SELECT * FROM student WHERE username = '".$User_no."' AND passwords = '".$old_Pass."' ";
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
            if($ACTION == 'ChangePass'){
                $User_no = $_POST['User_no'];
                $New_Pass = $_POST['New_Pass'];

                $sql = " UPDATE student SET passwords = '".$New_Pass."' WHERE student_id = '".$User_no."' ";
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