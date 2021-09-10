$(document).ready(function () {
  ListAdmin();
  $(document).on("click", "#viewAdmin", function () {
    $("#admin_id").val($(this).attr("admin_info"));
    ShowAdminInfo();
  });
  // ************** EDIT Admin *************
  $(document).on("click", "#edit_ad", function () {
    $("#editAd_name").val($(this).attr("staff_name"));
    $("#ediusername").val($(this).attr("username"));
    $("#ediAdemail").val($(this).attr("Ademail"));
  });
  $(document).on("click", "#changepass_btn", function () {
    var user = $("#ediusername").val();
    var c = confirm("ยืนยันการเปลี่ยน password");
    if (c == true) {
      if ($("#newpass").val() == $("#confirm_newpass").val()) {
        $.ajax({
          url: "api/member.php",
          type: "POST",
          data: {
            ACTION: "CheckOldpass",
            username: user,
            oldpass: $("#oldpass").val(),
            newpass: $("#newpass").val(),
          },
          success: function (res) {
            console.log(res);
            if (res == "1") {
              new PNotify({
                title: "สำเร็จ",
                type: "success",
                delay: 2000,
                top: "60px",
                text: "เปลี่ยน password สำเร็จ กรุณาล็อกอินใหม่",
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
                window.location = "admin.php";
              }, 2000);
            } else {
              new PNotify({
                title: "ผิดพลาด",
                type: "error",
                delay: 2000,
                top: "60px",
                text: "password เก่าไม่ถูกต้อง",
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
      } else {
        alert("Password ใหม่ไม่ตรงกัน");
      }
    }
  });
  $(document).on("click", "#admin_edit_btn", function () {
    var c = confirm("ยืนยันการแก้ไขข้อมูล");
    if (c == true) {
      $.ajax({
        url: "api/member.php",
        type: "POST",
        data: {
          ACTION: "EditAdmin",
          editAd_name: $("#editAd_name").val(),
          ediusername: $("#ediusername").val(),
          edipass: $("#edipass").val(),
          ediAdemail: $("#ediAdemail").val(),
        },
        success: function (res) {
          console.log(res);
          if (res == "1") {
            new PNotify({
              title: "สำเร็จ",
              type: "success",
              delay: 2000,
              top: "60px",
              text: "แก้ไขข้อมูลเรียบร้อย",
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
          } else {
            new PNotify({
              title: "ผิดพลาด",
              type: "error",
              delay: 2000,
              top: "60px",
              text: "ไม่สามารถแก้ไขข้อมูลได้",
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

  // ************** DELETE Admin *************
  $(document).on("click", "#del_Ad", function () {
    $("#admin_del_user").val($(this).attr("deladminuser"));
  });

  $(document).on("click", "#admin_del_btn", function () {
    var user = $("#admin_del_user").val();
    var pass = $("#admin_del_pass").val();
    var c = confirm("ยืนยันการลบข้อมูล");
    if (c == true) {
      $.ajax({
        url: "api/member.php",
        type: "POST",
        data: {
          ACTION: "DelAdmin",
          username: user,
          pass: pass,
        },
        success: function (res) {
          if (res == "1") {
            new PNotify({
              title: "สำเร็จ",
              type: "success",
              delay: 2000,
              top: "60px",
              text: "ลบข้อมูลเรียบร้อย กำลังกลับไปหน้าล็อกอิน",
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
              window.location = "admin.php";
            }, 2000);
          } else {
            new PNotify({
              title: "ผิดพลาด",
              type: "error",
              delay: 2000,
              top: "60px",
              text: "ไม่สามารถลบข้อมูลได้",
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

function ListAdmin() {
  $.ajax({
    url: _AJURL + "api/member.php",
    type: "POST",
    data: {
      ACTION: "ShowAdmin",
    },
    success: function (res) {
      if (res.length > 0) {
        var elem = "";
        for (var i = 0; i < res.length; i++) {
          elem +=
            '<a href="#" id="viewAdmin" data-title="ดูข้อมูล ' +
            res[i].staff_name +
            '" data-toggle="modal" data-target="#ViewAdminModal" data-toggle="tooltip" admin_info="' +
            res[i].staff_id +
            '">';
          elem += '<div class="col-xs-2">';
          elem +=
            '<img src="imageMember/' +
            res[i].staff_pic +
            '" alt="Avatar" class="avatar" style="width: 100px;height: 100px;border-radius: 50%;"></a>';
          elem += "</div>";
          elem += "</a>";
        }
        $("#AdminList").html(elem);
      }
    },
  });
}
function ShowAdminInfo() {
  $.ajax({
    url: "api/member.php",
    type: "POST",
    data: {
      ACTION: "AdminInfo",
      admin_id: $("#admin_id").val(),
    },
    success: function (res) {
      if (res.length > 0) {
        var elem = "";
        for (var i = 0; i < res.length; i++) {
          elem +=
            '<i id="edit_ad" class="fa fa-wrench" aria-hidden="true" title="แก้ไขข้อมูล" style="font-size:20px;cursor: pointer;"data-toggle="modal"';
          elem +=
            'data-target="#EditAdminModal" data-toggle="tooltip" staff_name="' +
            res[i].staff_name +
            '" username="' +
            res[i].username +
            '" Ademail="' +
            res[i].email +
            '"></i>';
          elem +=
            '<i id="del_Ad" class="fa fa-trash" aria-hidden="true" title="ลบข้อมูล" style="font-size:20px;margin-left:2%;cursor: pointer;" data-toggle="modal" ';
          elem +=
            'data-target="#DelAdminModal" data-toggle="tooltip" deladminuser="' +
            res[i].username +
            '"></i>';
          elem += '<div class="panel panel-default">';
          elem +=
            '<div class="panel-heading"><center><img src="imageMember/' +
            res[i].staff_pic +
            '" style="width:100px;height:100px"></img></center></div>';
          elem += '<div class="panel-body">';
          elem +=
            '<li class="list-group-item">ชื่อ-นามสกุล : ' +
            res[i].staff_name +
            "</li>";
          elem +=
            '<li class="list-group-item">username :' +
            res[i].username +
            "</li>";

          elem +=
            '<li class="list-group-item">e-mail : ' + res[i].email + "</li>";
          elem +=
            '<li class="list-group-item">สถานะ : ' +
            res[i].staff_status_detail +
            "</li>";
          elem += "</div>";
          elem += "</div>";
        }
        $("#showProfileAdmin").html(elem);
      }
    },
  });
}
