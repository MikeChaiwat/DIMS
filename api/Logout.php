<?php
    include('../config/connection.php');
    $request_method = $_SERVER["REQUEST_METHOD"];
    switch ($request_method) {
        case "POST":
            $ACTION = $_POST['ACTION'];
            if($ACTION == 'EditUser'){
                $sql2 = "UPDATE staff SET LoginStatus = '0' , LastUpdate = '0000-00-00 00:00:00'
                WHERE staff_id = 'stf0001' ";
                    $result = mysqli_query($Con,$sql2);
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