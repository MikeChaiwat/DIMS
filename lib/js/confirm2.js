$(document).ready(function () {
  ListBorrow2();

  $(document).on("click", "#confirm_btn", function () {
    var c = confirm("คุณต้องการอนุมัติการยืมนี้ใช่หรือไม่");
    if (c == true) {
      $.ajax({
        url: _AJURL + "api/confirm2.php",
        type: "POST",
        data: {
          ACTION: "Confirm2",
          confirm_id: $("#data_confirm").val(),
        },
        success: function (res) {
          console.log(res);
          if (res == "1") {
            setTimeout(() => {
              location.reload();
            }, 2000);
            new PNotify({
              title: "สำเร็จ",
              type: "success",
              delay: 2000,
              top: "60px",
              text: "ยืนยันการอนุมัติเรียบร้อย",
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
            new PNotify({
              title: "ผิดพลาด",
              type: "error",
              delay: 2000,
              top: "60px",
              text: "ยืนยันการอนุมัติไม่สำเร็จ",
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
  });
  $(document).on("click", "#cancel_btn", function () {
    var c = confirm("คุณต้องการไม่อนุมัติการยืมนี้ใช่หรือไม่");
    if (c == true) {
      $.ajax({
        url: _AJURL + "api/confirm2.php",
        type: "POST",
        data: {
          ACTION: "Cancel",
          confirm_id: $("#data_confirm").val(),
        },
        success: function (res) {
          if (res == "1") {
            setTimeout(() => {
              location.reload();
            }, 2000);
            new PNotify({
              title: "สำเร็จ",
              type: "success",
              delay: 2000,
              top: "60px",
              text: "ยืนยันการไม่อนุมัติเรียบร้อย",
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
            new PNotify({
              title: "ผิดพลาด",
              type: "error",
              delay: 2000,
              top: "60px",
              text: "ยืนยันการไม่อนุมัติไม่สำเร็จ",
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
  });
});

function ListBorrow2() {
  $.ajax({
    url: _AJURL + "api/confirm2.php",
    type: "GET",
    success: function (res) {
      if (res !== "0") {
        var elem = "";
        for (var i = 0; i < res.length; i++) {
          elem += '<div class="tbl_ResultItemContainer BorderBottom">';
          elem +=
            '<div class="tbl_ResultItem10 BorderRight paddingLeft5 data-toggle="tooltip" title="' +
            res[i].student_id +
            '">' +
            res[i].student_id +
            "</div>";
          elem +=
            '<div class="tbl_ResultItem10 BorderRight paddingLeft5 data-toggle="tooltip" title="' +
            res[i].student_Fname +
            '">' +
            res[i].student_Fname +
            "</div>";
          elem +=
            '<div class="tbl_ResultItem10 BorderRight paddingLeft5 data-toggle="tooltip" title="' +
            res[i].student_Lname +
            '">' +
            res[i].student_Lname +
            "</div>";
          elem +=
            '<div class="tbl_ResultItem15 BorderRight paddingLeft5 data-toggle="tooltip" title="' +
            res[i].material_id +
            '">' +
            res[i].material_id +
            "</div>";
          elem +=
            '<div class="tbl_ResultItem15 BorderRight paddingLeft5 data-toggle="tooltip" title="' +
            res[i].material_name +
            '">' +
            res[i].material_name +
            "</div>";
          elem +=
            '<div class="tbl_ResultItem10 BorderRight paddingLeft5 data-toggle="tooltip" title="' +
            res[i].loc_bor +
            '">' +
            res[i].loc_bor +
            "</div>";
          elem +=
            '<div class="tbl_ResultItem10 BorderRight paddingLeft5 data-toggle="tooltip" title="' +
            res[i].borrow_date +
            '">' +
            res[i].borrow_date +
            "</div>";
          elem +=
            '<div class="tbl_ResultItem10 BorderRight paddingLeft5 data-toggle="tooltip" title="' +
            res[i].return_date +
            '">' +
            res[i].return_date +
            "</div>";
          elem +=
            '<input type=text id="data_confirm" value="' +
            res[i].material_id +
            '" hidden="hidden"></i>';
          elem +=
            '<div class="tbl_ResultItem5 BorderRight paddingLeft5"><button type="button" id="cancel_btn" class="btn btn-danger btn-xs">ไม่อนุมัติ</button></div>';
          elem +=
            '<div class="tbl_ResultItem5 BorderRight paddingLeft5"><button type="button" id="confirm_btn" class="btn btn-success btn-xs">อนุมัติ</button></div>';

          elem += "</div>";
        }
        $("#bor_list2").html(elem);
      }
    },
  });
}
function SendMail() {
  $.ajax({
    url: _AJURL + "api/sendmail.php",
    type: "POST",
    data: {
      ACTION: "findtool",
    },
    success: function (res) {
      console.log(res);
      if (res.length > 0) {
        //console.log('Email sended.')
        for (var i = 0; i < res.length; i++) {
          var mail = res[i].email;
          var user_id = res[i].student_id;
          var studen_F = res[i].student_Fname;
          var studen_L = res[i].student_Lname;
          var B_Date = res[i].borrow_date;
          var R_Date = res[i].return_date;
          var box_name = res[i].box_detail;
        }
        $.ajax({
          url: _AJURL + "api/sendmail.php",
          type: "POST",
          data: {
            ACTION: "sendTools",
            Mail: mail,
            studen_F: studen_F,
            studen_L: studen_L,
            B_Date: B_Date,
            R_Date: R_Date,
            box_name: box_name,
            user_id: user_id,
          },
          success: function (res) {
            console.log(res);
            // if(res == '1'){
            //    SendMail()
            //    alert('ถึงตรงนี้ละ');
            //    location.reload();
            //     ListBorrow()
            // }
          },
        });
      }
    },
  });
}
