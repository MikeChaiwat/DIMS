<?php
    include('../config/connection.php');
    $request_method = $_SERVER["REQUEST_METHOD"];
    switch ($request_method) {
        case "GET":
            $sql = "SELECT mb.student_id,s.student_Fname,s.student_Lname,mb.material_id,m.material_name,
                    mb.loc_bor,mb.borrow_date,mb.return_date FROM material_borrowlist mb
                    INNER JOIN student s on s.student_id = mb.student_id
                    INNER JOIN material m on m.material_id = mb.material_id
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
                echo json_encode('0');
            }
        break;
        case "POST":
            $ACTION = $_POST['ACTION'];
            if ($ACTION == 'Confirm2') {
                $confirm_id = $_POST['confirm_id'];

                $sql = "UPDATE material_borrowlist SET confirm_status_id = 'c0002' 
                WHERE material_id = '".$confirm_id."' ";
                $result = mysqli_query($Con, $sql);
                
                if ($result) {
                    $sql2 = "UPDATE t_material SET status_id = '3' 
                            WHERE material_id = '".$confirm_id."' ";
                    $query2 = mysqli_query($Con, $sql2);
                    header('Content-Type: application/json');
                    echo json_encode('1');
                } else {
                    header('Content-Type: application/json');
                    echo json_encode('0');
                }
                mysqli_close($Con);
            }
            if ($ACTION == 'Cancel') {
                $confirm_id = $_POST['confirm_id'];

                $sql = "DELETE FROM material_borrowlist WHERE material_id = '".$confirm_id."' ";
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
