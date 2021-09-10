<?php
    include('../config/connection.php');
    $request_method = $_SERVER["REQUEST_METHOD"];
    switch ($request_method) {
        case "GET":
            $sql = " SELECT t.tools_id,t.tools_name,t.tools_detail,b.box_detail,t.box_id FROM tools t 
            INNER JOIN boxes b on b.box_id = t.box_id 
            WHERE b_status_id = 's_b_0000' ";
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
            if ($ACTION == 'ShowMaterial') {
                $sql = "SELECT DISTINCT material.material_name,material.material_detail,material_images.image_name
                        FROM t_material 
                        INNER JOIN material on t_material.material_id = material.material_id
                        INNER JOIN material_images on t_material.image_id = material_images.image_id 
                        ORDER BY material.material_name ASC";
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
            }
            if ($ACTION == 'AddMaterial') {
                $material_id = $_POST['material_id'];
                $material_name = $_POST['material_name'];
                $material_detail = $_POST['material_detail'];
                $type_material = $_POST['type_material'];
                $image_id = $_POST['image_id'];
                $unit_no = $_POST['unit_no'];
                $room = $_POST['room'];
                $status = "1";

                $sql2 = " INSERT INTO material (material_id,material_name,material_detail,unit_id,typematerial_id) 
                VALUE ('".$material_id."','".$material_name."','".$material_detail."','".$unit_no."','".$type_material."')";
                $result2 = mysqli_query($Con, $sql2);
                if ($result2) {
                    $sql = " INSERT INTO t_material (info_id,material_id,room_id,status_id,image_id,modify_date,checkstatus_id) 
                    VALUE ('".$material_id."','".$material_id."','".$room."','".$status."','".$image_id."','0000-00-00','0')";
                    $result = mysqli_query($Con, $sql);
                    mysqli_close($Con);
                    if ($result) {
                        header('Content-Type: application/json');
                        echo json_encode('1');
                    }
                } else {
                    header('Content-Type: application/json');
                    echo json_encode('0');
                }
            }
            if ($ACTION == 'InShowMaterial') {
                $material_name = $_POST['material_name'];
                $material_detail = $_POST['material_detail'];
                $sql = "SELECT DISTINCT material.material_id,material.material_name,material.material_detail,material_images.image_name,
                build_room.room_id,build_room.room_detail,material_status.status_id,material_status.status_name,
                typematerial.typematerial_id,typematerial.typematerial_name,unit.unit_id
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
            if ($ACTION == 'EditMaterial') {
                $material_id = $_POST['material_id'];
                $material_name = $_POST['material_name'];
                $material_detail = $_POST['material_detail'];
                $material_type = $_POST['material_type'];
                $material_unit = $_POST['material_unit'];
                $material_room = $_POST['material_room'];
                $material_status = $_POST['material_status'];

                $sql = "UPDATE t_material INNER JOIN material ON material.material_id = t_material.material_id
                        SET material.material_name = '".$material_name."',
                        material.material_detail = '".$material_detail."',
                        material.unit_id = '".$material_unit."',
                        material.typematerial_id = '".$material_type."',
                        t_material.room_id = '".$material_room."',
                        t_material.status_id = '".$material_status."'
                        WHERE t_material.material_id = '".$material_id."'";
                $query = mysqli_query($Con, $sql);
                if ($query) {
                    header('Content-Type: application/json');
                    echo json_encode('1');
                } else {
                    header('Content-Type: application/json');
                    echo json_encode('0');
                }
            }
            if ($ACTION == 'DelMaterial') {
                $material_id = $_POST['material_id'];
                $sql2 = "DELETE FROM t_material WHERE t_material.material_id = '".$material_id."' ";
                $result2 = mysqli_query($Con, $sql2);
                if ($result2) {
                    $sql = "DELETE FROM material WHERE material.material_id = '".$material_id."' ";
                    $result = mysqli_query($Con, $sql);
                    mysqli_close($Con);
                    if ($result) {
                        header('Content-Type: application/json');
                        echo json_encode('1');
                    }
                } else {
                    header('Content-Type: application/json');
                    echo json_encode('0');
                }
            }
            if ($ACTION == 'SelectImageChange') {
                $sql = "SELECT * FROM material_images";
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
            if ($ACTION == 'ChangeImage') {
                $img = $_POST["image"];
                $detail = $_POST["detail"];
                $name = $_POST['name'];
                $sql = "UPDATE t_material INNER JOIN material on material.material_id = t_material.material_id
                        SET image_id=".$img."
                        WHERE material_name='".$name."' AND material_detail='".$detail."'";
                $query = mysqli_query($Con, $sql);
                if ($query) {
                    header('Content-Type: application/json');
                    echo json_encode('1');
                } else {
                    header('Content-Type: application/json');
                    echo json_encode('0');
                }
            }
      
        break;
    }
?>
        