$(document).ready(function () {
  Listbor();

  DWTQR("qr_canvas");
  $(document).on("click", "#scan", function () {
    dwStartScan();
  });
});
function Listbor() {
  $.ajax({
    url: _AJURL + "api/user_borrow.php",
    type: "POST",
    data: {
      ACTION: "durableList",
      user_id: $("#user_no").val(),
    },
    success: function (res) {
      if (res.length > 0) {
        var elem = "";
        for (var i = 0; i < res.length; i++) {
          elem += "<tr>";
          elem += "<td>" + res[i].durable_id + "</td>";
          elem += "<td>" + res[i].product_name + "</td>";
          elem += "<td>" + res[i].loc_bor + "</td>";
          elem += "<td>" + res[i].borrow_date + "</td>";
          elem += "<td>" + res[i].return_date + "</td>";
          elem += "<td>" + res[i].confirm_status_detail + "</td>";
          elem += "</tr>";
        }

        $("#borrowList").html(elem);
      }
    },
  });
}
function dwQRReader(qrdata) {
  //alert(qrdata);
  $("#borrow_scan").val(qrdata);
  $.ajax({
    url: "api/borrow.php",
    type: "POST",
    data: {
      ACTION: "searchingdurable",
      Borrow_Scan: $("#borrow_scan").val(),
    },
    success: function (res) {
      console.log(res);
      if (res == "0") {
        $.ajax({
          url: "api/borrow.php",
          type: "POST",
          data: {
            ACTION: "searching2",
            Borrow_Scan: $("#borrow_scan").val(),
          },
          success: function (res) {
            console.log(res);
            if (res == "0") {
              $("#borrow_scan").val("");
              new PNotify({
                title: "แจ้งเตือน",
                type: "error",
                delay: 2000,
                top: "60px",
                text: "ครุภัณฑ์ถูกยืมไปแล้ว",
                animation: "fade",
                animate_speed: "fast",
                text_escape: true,
                styling: "fontawesome",
                before_open: function (PNotify) {
                  PNotify.css({
                    top: "60px",
                  });
                },
              });
            } else {
              if (res.length > 0) {
                $("#ScanQR").modal("toggle");
                $("#Borrow").modal("show");
                $("#durable_no").val(qrdata);
                for (var i = 0; i < res.length; i++) {
                  $("#durable_name").val(res[i].box_detail);
                }

                // window.location.href = _URL + 'usermain.php?page=borrow'
              }
            }
          },
        });
      } else {
        if (res.length > 0) {
          $("#ScanQR").modal("toggle");
          $("#Borrow").modal("show");
          $("#durable_no").val(qrdata);
          for (var i = 0; i < res.length; i++) {
            $("#durable_name").val(res[i].product_name);
          }

          // window.location.href = _URL + 'usermain.php?page=borrow'
        }
      }
    },
  });
}
function Init() {
  var cookie = getCookie("UserDIMS");
  if (cookie != "") {
    var student_id = cookie.split("|")[0];
    var student_Fname = cookie.split("|")[1];
    var student_Lname = cookie.split("|")[2];
    var id_card_number = cookie.split("|")[3];
    console.log(student_Fname);
    $(".showFname").html(student_Fname);
    $(".user_no").html(student_id);
    $("#user_no").val(student_id);
    $("#user_name").val(student_Fname);
    $("#user_lastname").val(student_Lname);
    $("#user_name").html(student_Fname);
    $("#user_lastname").html(student_Lname);
  } else {
    // window.location.href = _URL + 'userlogin.php';
  }
}
