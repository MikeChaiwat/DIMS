<?php
    include('phpqrcode/qrlib.php');
        
    $durable_id = $_GET['id']; // remember to sanitize that - it is user input!
    
    // here DB request or some processing
    $codeText = $durable_id;
    
  
    // outputs image directly into browser, as PNG stream
    QRcode::png($codeText, false, QR_ECLEVEL_L, 8);
