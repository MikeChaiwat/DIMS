<?php
include('config/connection.php');

if (isset($_POST['submit'])) {
    //Import uploaded file to Database
    $handle = fopen($_FILES['filename']['tmp_name'], "r");
    $i = 0;
    while (($data = fgetcsv($handle)) !== false) {
        $material_id = $data[0];
        $material_name = $data[1];
        $material_detail = $data[2];
        $material_type = $data[3];
        $material_unit = $data[4];
        $status = 1;
        $room = $data[5];
        $img = $data[6];
        $note = $data[7];

        $sql = "INSERT INTO material (material_id,material_name,material_detail,unit_id,typematerial_id) 
        VALUE ('".$material_id."','".$material_name."','".$material_detail."','".$material_unit."','".$material_type."')";
        $query = mysqli_query($Con, $sql);
        if ($query) {
            $sql3 = "SELECT room_id FROM build_room WHERE room_detail='".$room."'";
            $query3 = mysqli_query($Con, $sql3);
            $rc = mysqli_num_rows($query3);
            if ($rc > 0) {
                while ($row = mysqli_fetch_assoc($query3)) {
                    $room_id = $row["room_id"];
                }
            } else {
                $room_id = 1;
            }
            $sql2 = " INSERT INTO t_material (info_id,material_id,room_id,status_id,image_id,modify_date,checkstatus_id,staff_id,note) 
                    VALUE ('".$material_id."','".$material_id."','".$room_id."','".$status."','".$img."','0000-00-00','0','0','".$note."')";
            $query2 = mysqli_query($Con, $sql2);
            if ($query2) {
                $i++;
            }
        }
    }
    echo("<script LANGUAGE='JavaScript'>
    window.alert('นำเข้าข้อมูลสำเร็จ นำเข้าทั้งหมด ${i} รายการ');
    window.location.href='main.php?page=importmat';
    </script>");
} else {
    echo("<script LANGUAGE='JavaScript'>
    window.alert('นำเข้าข้อมูลไม่สำเร็จ ');
    window.location.href='main.php?page=importmat';
    </script>");
}
