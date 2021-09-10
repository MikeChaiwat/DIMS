<?php
    include('../config/connection.php');
    $request_method = $_SERVER["REQUEST_METHOD"];
    switch ($request_method) {
        case "POST":
            $ACTION = $_POST['ACTION'];
            if ($ACTION =="durableList") {
                $user_id = $_POST['user_id'];
                $sql = " SELECT b.durable_id,p.product_name,b.loc_bor,b.borrow_date,b.return_date,c.confirm_status_detail FROM durable_borrowlist b 
                INNER JOIN product p on p.product_id = b.durable_id
                INNER JOIN confirm_status c on c.confirm_status_id = b.confirm_status_id WHERE b.student_id = '".$user_id."' ";
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
            
        break;
    }
