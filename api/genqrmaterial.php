<?php
    include('../config/connection.php');
    $request_method = $_SERVER["REQUEST_METHOD"];
    switch ($request_method) {
        case "GET":
            $sql = "SELECT DISTINCT material.material_name,material.material_detail,material_images.image_name
            FROM t_material
            INNER JOIN material on t_material.material_id = material.material_id
            INNER JOIN material_images on material_images.image_id = t_material.image_id
            ORDER BY material.material_name ASC";
            $query = mysqli_query($Con, $sql);
            $rc = mysqli_num_rows($query);
            // $sql = "SELECT loc_id,";
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
            if ($ACTION == 'ShowDurableQR') {
                $material_name = $_POST['material_name'];
                $material_detail = $_POST['material_detail'];
                $sql = "SELECT DISTINCT material.material_id,material.material_name,material.material_detail,material_images.image_name,
                build_room.room_id,build_room.room_detail,material_status.status_id,material_status.status_name,
                typematerial.typematerial_id,typematerial.typematerial_name
                                FROM t_material
                                INNER JOIN material_status on t_material.status_id = material_status.status_id
                                INNER JOIN material on t_material.material_id = material.material_id
                                INNER JOIN unit on unit.unit_id = material.unit_id
                                INNER JOIN material_images on material_images.image_id = t_material.image_id
                                INNER JOIN build_room on build_room.room_id = t_material.room_id
                                INNER JOIN typematerial on material.typematerial_id = typematerial.typematerial_id
                                WHERE material.material_name='".$material_name."' AND material.material_detail='".$material_detail."'";
                $query = mysqli_query($Con, $sql);
                $rc = mysqli_num_rows($query);
                // $sql = "SELECT loc_id,";
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
           

            // no break
        default:
            break;
    }
