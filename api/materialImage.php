<?php
    include('../config/connection.php');
    $request_method = $_SERVER["REQUEST_METHOD"];
    switch ($request_method) {
        case 'GET':
            $sql = "SELECT image_id,image_name FROM material_images ";
            $query = mysqli_query($Con, $sql);
            $rc = mysqli_num_rows($query);
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
            mysqli_close($Con);
        break;
        case 'POST':
            $ACTION = $_POST['ACTION'];
            if ($ACTION == 'LoadImage') {
                $img_id = $_POST['img_id'];
                $sql = " SELECT image_name FROM material_images WHERE image_id = '".$img_id."' ";
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
                    echo json_encode($img_id);
                }
            }
        break;
    }
