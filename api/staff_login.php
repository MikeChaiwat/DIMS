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
                $passmd5 = md5($PASSWD);
                $sql = " SELECT staff_id,staff_name,username,passkey,staff_status.staff_status_detail,staff_pic FROM staff
                INNER JOIN staff_status on staff_status.staff_status_id = staff.staff_status_id
                WHERE staff.username = '".$USERNAME."' AND staff.passkey = '".$passmd5."'";
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
            if ($ACTION =='findStaff') {
                $Email = $_POST['Email'];
                $sql = " SELECT * FROM staff WHERE email = '".$Email."' ";
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
            break;
    }
