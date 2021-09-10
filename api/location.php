<?php
include('../config/connection.php');
$request_method = $_SERVER["REQUEST_METHOD"];
switch ($request_method) {
    case "GET":
        $sql = "SELECT locations.loc_id,locations.build_detail,build_room.room_detail,build_room.room_id from locations
        INNER JOIN build_room on locations.loc_id = build_room.loc_id";
        $query = mysqli_query($Con,$sql);
        $rc = mysqli_num_rows($query);
        // $sql[1] = "SELECT loc_id,";
        if($rc > 0){
            while($row = mysqli_fetch_assoc($query)){
                $rows[] = $row;
            }
            mysqli_close($Con);
            header('Content-Type: application/json');
            echo json_encode($rows);

        }else{
            header('Content-Type: application/json');
            echo json_encode('0');
        }

    break;
    case 'POST':
    $ACTION = $_POST['ACTION'];
    if ($ACTION == 'NewLoc') {
        $Loc_No = $_POST['Loc_No'];
        $Build_Detail = $_POST['build_Detail'];
        $Room_No = $_POST['Room_No'];
        $Room_Detail = $_POST['Room_Detail'];

        $sql = " INSERT INTO build_room (room_id,loc_id,room_detail) VALUE ('".$Room_No."','".$Loc_No."','".$Room_Detail."')";
        $sql2 = " INSERT INTO locations (loc_id,build_detail) VALUE ('".$Loc_No."','".$Build_Detail."')";
        $result1 = mysqli_query($Con,$sql);
        $result2 = mysqli_query($Con,$sql2);
        mysqli_close($Con);
                
        if($result1 || $result2){
            
                header('Content-Type: application/json');
                echo json_encode('1');
            
        }else{
            header('Content-Type: application/json');
            echo json_encode('0');
        }
    }
    if ($ACTION == 'EditLoc') {
        $EdiLoc_No = $_POST['EdiLoc_No'];
        $EdiBuild_Detail = $_POST['EdiBuild_Detail'];
        $EdiRoom_No = $_POST['EdiRoom_No'];
        $EdiRoom_Detail = $_POST['EdiRoom_Detail'];

        $sql = "UPDATE build_room
        SET room_detail = '".$EdiRoom_Detail."' 
        WHERE room_id  AND loc_id = '".$EdiLoc_No."'";

        $result = mysqli_query($Con,$sql);
        mysqli_close($Con);
                
        if($result){
                header('Content-Type: application/json');
                echo json_encode('1');
        }else{
            header('Content-Type: application/json');
            echo json_encode('0');
        }
    }
    if ($ACTION == 'DelLoc') {
        $DelLoc_No = $_POST['DelLoc_No'];
        $DelRoom_No = $_POST['DelRoom_No'];

        $sql = " DELETE b FROM build_room b INNER JOIN locations l on l.loc_id = b.loc_id
        WHERE b.room_id = '".$DelRoom_No."' ";
        $result = mysqli_query($Con,$sql);
        mysqli_close($Con);

        if($result){
            header('Content-Type: application/json');
            echo json_encode('1');
        }else{
            header('Content-Type: application/json');
            echo json_encode('0');
        }
    }
    break;
}
?>