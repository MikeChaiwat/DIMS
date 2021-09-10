$(document).ready(function () {
  MaterialListborrow();

  DWTQR("material_qr_canvas");
  $(document).on("click", "#material_scan", function () {
    dwStartScan();
  });

  $(document).on("click", "#material_bor_btn", function () {
    $.ajax({
      url: _AJURL + "api/user_borrow_material.php",
      type: "POST",
      data: {
        ACTION: "searchingmaterial",
        material_id: $("#material_borrow_scan").val(),
      },
      success: function (res) {
        if (res !== "0") {
          $("#ScanQRMaterial").modal("toggle");
          $("#BorrowMaterial").modal("show");
          for (var i = 0; i < res.length; i++) {
            $("#material_name").val(res[i].material_name);
            $("#material_id").val(res[i].material_id);
          }
        } else {
          new PNotify({
            title: "แจ้งเตือน",
            type: "error",
            delay: 2000,
            top: "60px",
            text: "ไม่พบข้อมูล",
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
        }
      },
    });
  });

  $(document).on("click", "#material_submit_btn", function () {
    $.ajax({
      url: _AJURL + "api/user_borrow_material.php",
      type: "POST",
      data: {
        ACTION: "AddBorrowMaterial",
        user_no: $("#user_no").val(),
        material_id: $("#material_id").val(),
        material_loc: $("#local").val(),
        borrow_time: $("#borrow_time").val(),
        return_time: $("#return").val(),
      },
      success: function (res) {
        console.log("AddBorrowMaterial: " + res);
        if (res == "1") {
          $("#BorrowMaterial").modal("hide");
          new PNotify({
            title: "สำเร็จ",
            type: "success",
            delay: 2000,
            top: "60px",
            text: "เรียบร้อย",
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
          setTimeout(function () {
            location.reload();
          }, 2000);
        } else if (res == "0") {
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
        }
      },
    });
  });
});
function MaterialListborrow() {
  $.ajax({
    url: "api/user_borrow_material.php",
    type: "GET",
    success: function (res) {
      if (res !== 0) {
        var elem = "";
        for (var i = 0; i < res.length; i++) {
          elem += "<tr>";
          elem += "<td>" + res[i].material_id + "</td>";
          elem += "<td>" + res[i].material_name + "</td>";
          elem += "<td>" + res[i].loc_bor + "</td>";
          elem += "<td>" + res[i].borrow_date + "</td>";
          elem += "<td>" + res[i].return_date + "</td>";
          elem += "<td>" + res[i].confirm_status_detail + "</td>";
          elem += "</tr>";
        }
        $("#material_borrowlist").html(elem);
      }
    },
  });
}
function dwQRReader(qrdata) {
  //alert(qrdata);
  $("#material_borrow_scan").val(qrdata);
  $.ajax({
    url: "api/user_borrow_material.php",
    type: "POST",
    data: {
      ACTION: "searchingmaterial",
      material_id: $("#material_borrow_scan").val(),
    },
    success: function (res) {
      if (res !== "0") {
        $("#ScanQRMaterial").modal("toggle");
        $("#BorrowMaterial").modal("show");
        $("#material_id").val(qrdata);
        for (var i = 0; i < res.length; i++) {
          $("#material_name").val(res[i].material_name);
        }
      } else {
        new PNotify({
          title: "แจ้งเตือน",
          type: "error",
          delay: 2000,
          top: "60px",
          text: "ไม่พบวัสดุ",
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
      }
    },
  });
}
