<?php
    include('../config/connection.php');
    $request_method = $_SERVER["REQUEST_METHOD"];
    switch ($request_method) {
        case "POST":
            $ACTION = $_POST['ACTION'];
            if ($ACTION == 'listmaterial') {
                $sql = "SELECT material.material_id, material.material_name, material.material_detail, room_detail, image_name 
                        FROM t_material 
                        JOIN material on material.material_id = t_material.material_id
                        JOIN build_room on build_room.room_id = t_material.room_id
                        JOIN material_images on material_images.image_id = t_material.image_id
                        ORDER BY material.material_id ASC";
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
