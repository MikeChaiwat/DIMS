<?php
    include('../config/connection.php');
    $request_method = $_SERVER["REQUEST_METHOD"];
    switch ($request_method) {
        case "GET":
            $sql = " SELECT b.b_id,b.student_id,s.student_Fname,s.student_Lname,b.durable_id,p.product_name,b.loc_bor,
            b.borrow_date,b.return_date FROM durable_borrowlist b
            INNER JOIN student s on s.student_id = b.student_id  
            INNER JOIN product p on p.product_id = b.durable_id
          
            WHERE confirm_status_id = 'c0001' ";
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
        break;
        case "POST":
            $ACTION = $_POST['ACTION'];
            if ($ACTION == 'Confirm') {
                $Confirm_id = $_POST['Confirm_id'];
                $b_id = $_POST['b_id'];
                $sql = "UPDATE durable_borrowlist SET confirm_status_id = 'c0002' 
                WHERE durable_id = '".$Confirm_id."' AND b_id = '".$b_id."' ";
                $result = mysqli_query($Con, $sql);
                if ($result) {
                    $sql2 = "UPDATE t_durable SET holding_id = '1111' 
                    WHERE durable_id = '".$Confirm_id."' ";
                    $result2 = mysqli_query($Con, $sql2);
                    mysqli_close($Con);
                    if ($result2) {
                        header('Content-Type: application/json');
                        echo json_encode('1');
                    }
                } else {
                    header('Content-Type: application/json');
                    echo json_encode('0');
                }
            }
            if ($ACTION == 'Cancel') {
                $Confirm_id = $_POST['Confirm_id'];
                $b_id = $_POST['b_id'];
                $sql = "DELETE FROM durable_borrowlist WHERE durable_id = '".$Confirm_id."' ";
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
        break;
    }
