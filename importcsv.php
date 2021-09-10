<?php
include('config/connection.php');

if (isset($_POST['submit'])) {
    //Import uploaded file to Database
    $handle = fopen($_FILES['filename']['tmp_name'], "r");
    $i = 0;
    while (($data = fgetcsv($handle)) !== false) {
        $durable_id = $data[0];
        $durable_name = $data[1];
        $durable_detail = $data[2];
        $durable_type = $data[3];
        $durable_status = $data[4];
        $durable_unit = $data[5];
        $room = $data[6];
        $img = $data[7];
        $note = $data[8];
        $loc = 1;
        $holding = "0000";
        $sql = "INSERT INTO product (product_id,product_name,product_detail,unit_id,types_id) 
        VALUE ('".$durable_id."','".$durable_name."','".$durable_detail."','".$durable_unit."','".$durable_type."')";
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
            $sql2 = " INSERT INTO t_durable (durable_id,product_id,loc_id,room_id,status_id,holding_id,pic_id,modify_date,checkstatus_id,staff_id,note) 
                    VALUE ('".$durable_id."','".$durable_id."','".$loc."','".$room_id."','".$durable_status."','".$holding."','".$img."','0000-00-00','0','0','".$note."')";
            $query2 = mysqli_query($Con, $sql2);
            if ($query2) {
                $i++;
            }
        }
    }
    echo("<script LANGUAGE='JavaScript'>
    window.alert('นำเข้าข้อมูลสำเร็จ นำเข้าทั้งหมด ${i} รายการ');
    window.location.href='main.php?page=import';
    </script>");
} else {
    echo("<script LANGUAGE='JavaScript'>
    window.alert('นำเข้าข้อมูลไม่สำเร็จ ');
    window.location.href='main.php?page=import';
    </script>");
}
