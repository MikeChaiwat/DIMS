<?php
include('config/connection.php');
if (isset($_FILES["image"])) {
    $image_name = $_FILES["image"]["name"];
    $image_path = "lib/images/" ;
    $upload_Path = $image_path.$image_name;
    $success = move_uploaded_file($_FILES["image"]["tmp_name"], $upload_Path);
    if ($success) {
        $sql = "INSERT INTO durable_picture(pic_id, durable_image) VALUES (null,'".$image_name."')";
        $query = mysqli_query($Con, $sql);
        if ($query) {
            echo '<script type="text/javascript">alert("เพิ่มรูปภาพสำเร็จ");';
            echo "window.location = 'main.php?page=durable'; ";
            echo "</script>";
        }
    }
}
