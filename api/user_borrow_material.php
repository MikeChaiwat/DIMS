<?php
    include('../config/connection.php');
    $request_method = $_SERVER["REQUEST_METHOD"];
    switch ($request_method) {
        case "GET":
            $sql = "SELECT m.material_id,m.material_name,mb.loc_bor,mb.borrow_date,mb.return_date,c.confirm_status_detail 
            FROM material_borrowlist mb
            INNER JOIN material m on m.material_id = mb.material_id 
            INNER JOIN confirm_status c on c.confirm_status_id = mb.confirm_status_id";

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
            break;
        case "POST":
            $ACTION = $_POST['ACTION'];
            if ($ACTION == 'searchingmaterial') {
                $material_id = $_POST['material_id'];
                $sql = "SELECT * FROM material WHERE material_id = '".$material_id."' ";
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
            if ($ACTION == 'AddBorrowMaterial') {
                $user_no = $_POST['user_no'];
                $material_id = $_POST['material_id'];
                $material_loc = $_POST['material_loc'];
                $borrow_time = $_POST['borrow_time'];
                $return_time = $_POST['return_time'];
                $sql2 = "SELECT * FROM material_borrowlist WHERE material_id = '".$material_id."' ";
                $query2 = mysqli_query($Con, $sql2);
                $row = mysqli_num_rows($query2);
                if ($row > 0) {
                    header('Content-Type: application/json');
                    echo json_encode('0');
                } else {
                    $sql = "INSERT INTO material_borrowlist VALUE (NULL,'".$user_no."','".$material_id."','".$material_loc."','".$borrow_time."','".$return_time."','c0001')";
                    $query = mysqli_query($Con, $sql);
                    if ($query) {
                        header('Content-Type: application/json');
                        echo json_encode('1');
                    } else {
                        header('Content-Type: application/json');
                        echo json_encode('0');
                    }
                }
                mysqli_close($Con);
            }

            break;
    }
