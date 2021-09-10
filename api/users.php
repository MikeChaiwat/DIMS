<?php
    include('../config/connection.php');
    $request_method = $_SERVER["REQUEST_METHOD"];
    switch ($request_method) {
        case "POST":
            $ACTION = $_POST['ACTION'];
            if ($ACTION == 'AUTHENTICATION') {
                $USERNAME = $_POST['USERNAME'];
                $PASSWD = $_POST['PASSWD'];
                $passmd5 = md5($PASSWD);
                $sql = " SELECT staff_id,staff_name,username,passkey,staff_status.staff_status_detail,staff.LastUpdate FROM staff
                INNER JOIN staff_status on staff_status.staff_status_id = staff.staff_status_id
                WHERE staff.username = '".$USERNAME."' AND staff.passkey = '".$passmd5."' 
                 AND staff.staff_status_id = 'st001'  ";
                $query = mysqli_query($Con, $sql);
                $rc = mysqli_num_rows($query);
                if ($rc > 0) {
                    while ($row = mysqli_fetch_assoc($query)) {
                        $rows[] = $row;
                    }
                    $sql2 = "UPDATE staff SET LoginStatus = '1' , LastUpdate = NOW()
                    WHERE username = '".$USERNAME."' ";
                    $result = mysqli_query($Con, $sql2);
                    mysqli_close($Con);
                    header('Content-Type: application/json');
                    echo json_encode($rows);
                } else {
                    header('Content-Type: application/json');
                    echo json_encode('0');
                }
            }
            if ($ACTION == 'ChangeStatuss') {
                $sql3 = "UPDATE staff SET LoginStatus = '0' , LastUpdate = '0000-00-00 00:00:00'
                WHERE staff_status_id = 'st001'";
                $result = mysqli_query($Con, $sql3);
                mysqli_close($Con);
                if ($result) {
                    header('Content-Type: application/json');
                    echo json_encode('1');
                } else {
                    header('Content-Type: application/json');
                    echo json_encode('0');
                }
            }
            if ($ACTION == 'ShowTime') {
                $sql = " SELECT * FROM staff WHERE LoginStatus = '1' ";
                $query = mysqli_query($Con, $sql);
                $rc = mysqli_num_rows($query);
                mysqli_close($Con);
                if ($rc > 0) {
                    while ($row = mysqli_fetch_assoc($query)) {
                        $rows[] = $row;
                    }
                    header('Content-Type: application/json');
                    echo json_encode($rows);
                } else {
                    header('Content-Type: application/json');
                    echo json_encode('0');
                }
            }
        break;
    }
