<?php
    include('../config/connection.php');
    $request_method = $_SERVER["REQUEST_METHOD"];
    switch ($request_method) {
        case "GET":
            $sql = "SELECT mb.student_id,s.student_Fname,s.student_Lname,mb.material_id,m.material_name,
                    mb.loc_bor,mb.borrow_date,mb.return_date FROM material_borrowlist mb
                    INNER JOIN student s on s.student_id = mb.student_id
                    INNER JOIN material m on m.material_id = mb.material_id
                    WHERE confirm_status_id = 'c0002'";
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
    }
