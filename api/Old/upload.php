<?php
    include('../config/config.php');
    $DIR = DIR;
    $uploadedFiles = $_FILES['file'];
	$newname = $_FILES['file']['name'];
    if(substr($_POST['folder'],0,3) == 'All'){
        echo 'OK';
        $Folder = substr($_POST['folder'],4);
        $dir = $DIR.'/'.$Folder;
        if(isset($_FILES['file'])){
            if(is_dir($dir)){
                if(move_uploaded_file($_FILES['file']['tmp_name'],  $dir."/".$newname)){
                    echo $_FILES['file']['name']. " OK";
                } else {
                    echo $_FILES['file']['name']. " KO";
                }
            }
        }else{
            echo "No files uploaded ...";
        }
    }else{
        $Folder = $_POST['folder'];
        $dir = $DIR.'/'.$Folder;
        if(isset($_FILES['file'])){
            if(is_dir($dir)){
                if(move_uploaded_file($_FILES['file']['tmp_name'],  $dir."/".$newname)){
                    echo $_FILES['file']['name']. " OK";
                } else {
                    echo $_FILES['file']['name']. " KO";
                }
            }
        }else{
            echo "No files uploaded ...";
        }
    }
    
?>