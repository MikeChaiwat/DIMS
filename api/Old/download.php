<?php
    include('../config/config.php');
    $DIR = DIR;
    if(substr($_GET['folder'],0,3) == 'All'){
        $folder = substr($_GET['folder'],4);
        $file = $_GET['filename'];
        $filetobedownloaded = $DIR.'/'.$folder.'/'.$file;
        header("Cache-Control: public");
        header("Content-Description: File Transfer");
        header("Content-Disposition: attachment; filename=".$file."");
        header("Content-Transfer-Encoding: binary");
        header("Content-Type: binary/octet-stream");
        readfile($filetobedownloaded);
    }else{
        $folder = $_GET['folder'];
        $file = $_GET['filename'];
        $filetobedownloaded = $DIR.'/'.$folder.'/'.$file;
        header("Cache-Control: public");
        header("Content-Description: File Transfer");
        header("Content-Disposition: attachment; filename=".$file."");
        header("Content-Transfer-Encoding: binary");
        header("Content-Type: binary/octet-stream");
        readfile($filetobedownloaded);
    }
?>