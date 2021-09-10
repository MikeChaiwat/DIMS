<?php
    include('../config/connection.php');
    $ext = pathinfo(basename($_FILES["image"]["name"]),PATHINFO_EXTENSION);
    $new_image_name = 'img_'.uniqid().".".$ext;
    $image_path = "../imageMember/" ;
    $upload_Path = $image_path.$new_image_name;

    $success = move_uploaded_file($_FILES["image"]["tmp_name"],$upload_Path);
    if($success == FALSE){
        echo("upload failed");
    }
    else{
        echo("upload complete");
        echo($upload_Path);
    }
    $sql = " INSERT INTO student (student_id,student_Fname,student_Lname,id_card_number,email,tel,student_pic) VALUE ";
                $sql .= " ('1234','','','','','','".$new_image_name."') ";
                $result = mysqli_query($Con,$sql);
                mysqli_close($Con);
                // if($result){
                //     header('Content-Type: application/json');
                //     echo json_encode('1');
                // }else{
                //     header('Content-Type: application/json');
                //     echo json_encode('0');
                // }
?>
<form id="uploadimage" action="" method="post" enctype="multipart/form-data">
                <div id="selectImage">
                <label>Select Your Image</label><br/>
                <input type="file" name="file" id="file" required />
                <input type="submit" value="Upload" class="submit" />
</form>