$(document).ready(function () {
  ListMembers();
  ShowProfile();
  ListAdmin();
  ShowEditStat();
  // $('#Member_form').validate({
  //     rules:{
  //         member_id:{
  //             required: true,
  //             minlength:13,
  //             messages: {
  //             required: "Required input",
  //             minlength: jQuery.validator.format("Please, at least {13} characters are necessary")
  //         },
  //     }
  // }
  // })
});
jQuery.extend(jQuery.validator.messages, {
  minlength: jQuery.validator.format("กรุณาใส่ให้ครบ {0} ตัว "),
});
$(document).on("click", "#member_add_btn", function () {
  if ($("#member_no").val() == null || $("#member_no").val() == "") {
    $("#member_no").focus();
    new PNotify({
      title: "พบช่องว่าง",
      type: "info",
      delay: 2000,
      top: "60px",
      text: "กรุณากรอก รหัสนักศึกษา / รหัสบุคลากร",
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
    $.ajax({
      url: "api/member.php",
      type: "POST",
      data: {
        ACTION: "NewMember",
        Member_No: $("#member_no").val(),
        Member_Name: $("#member_name").val(),
        Member_Lastname: $("#member_lastname").val(),
        Id_Number: $("#id_number").val(),
        Email: $("#email").val(),
        Tel: $("#tel").val(),
      },
      success: function (res) {
        console.log(res);
        if (res == "1") {
          $("#NewMemberModal").modal("toggle");
          location.reload();
          ListMembers();
          new PNotify({
            title: "สำเร็จ",
            type: "success",
            delay: 2000,
            top: "60px",
            text: "เพิ่มผู้ใช้งานเรียบร้อย",
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
          $("#member_no").focus();
          new PNotify({
            title: "พบข้อมูลซ้ำ",
            type: "info",
            delay: 2000,
            top: "60px",
            text: "กรุณากรอกใหม่อีกครั้ง",
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
$(document).on("click", "#edit_mem", function () {
  //$('#EditMemberModal').modal('show');
  $("#edimember_no").val($(this).attr("memberno"));
  $("#edimember_name").val($(this).attr("membername"));
  $("#edimember_lastname").val($(this).attr("memberlast"));
  $("#edi_id_number").val($(this).attr("id_number"));
  $("#ediemail").val($(this).attr("email"));
  $("#editel").val($(this).attr("tel"));
});
$(document).on("click", "#member_edit_btn", function () {
  $.ajax({
    url: "api/member.php",
    type: "POST",
    data: {
      ACTION: "EditMember",
      EditMember_No: $("#edimember_no").val(),
      EditMember_Name: $("#edimember_name").val(),
      EditMember_Lastname: $("#edimember_lastname").val(),
      EditMember_Number: $("#edi_id_number").val(),
      EditMember_Mail: $("#ediemail").val(),
      EditMember_Tel: $("#editel").val(),
    },
    success: function (res) {
      if (res == "1") {
        $("#EditMemberModal").modal("toggle");
        ShowProfile();
        new PNotify({
          title: "สำเร็จ",
          type: "success",
          delay: 2000,
          top: "60px",
          text: "แก้ไขข้อมูลผู้ใช้งานเรียบร้อย",
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
$(document).on("click", "#del_du", function () {
  //$('#DelMemberModal').modal('show');
  $("#deldurable_no").val($(this).attr("delmemberno"));
});
$(document).on("click", "#member_del_btn", function () {
  $.ajax({
    url: "api/member.php",
    type: "POST",
    data: {
      ACTION: "DelMember",
      delmember_no: $("#deldurable_no").val(),
    },
    success: function (res) {
      if (res == "1") {
        $("#DelMemberModal").modal("toggle");
        ShowProfile();
        new PNotify({
          title: "สำเร็จ",
          type: "success",
          delay: 2000,
          top: "60px",
          text: "ลบผู้ใช้งานเรียบร้อย",
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
$(document).on("click", "#viewprofile", function () {
  $("#member_id_info").val($(this).attr("member_info"));
  ShowProfile();
});
$(document).on("click", "#viewAdmin", function () {
  $("#admin_id").val($(this).attr("admin_info"));
  ShowAdminInfo();
});
$(document).on("click", "#close_edit", function () {
  location.reload();
});
$(document).on("click", "#edit_ad", function () {
  $("#editAd_name").val($(this).attr("staff_name"));
  $("#ediusername").val($(this).attr("username"));
  $("#edipass").val($(this).attr("passkey"));
  $("#ediAdemail").val($(this).attr("Ademail"));
  $("#edistat").val($(this).attr("stat"));
});

$(document).on("click", "#email", function () {
  if ($("#passkey").val() != $("#passkey2").val()) {
    alert("รหัสผ่านไม่ตรงกัน");
  }
});
$(document).on("click", "#Memberemail", function () {
  var id_card = $("#id_card").val();
  if (id_card.length != 13) alert("รหัสประชาชนไม่ถูกต้อง");
  else {
    for (i = 0, sum = 0; i < 12; i++)
      sum += parseFloat(id_card.charAt(i)) * (13 - i);
    if ((11 - (sum % 11)) % 10 != parseFloat(id_card.charAt(12)))
      alert("รหัสประชาชนไม่ถูกต้อง");
    else alert("รหัสประชาชนถูกต้อง");
  }
  $("#Member_form").validate({
    rules: {
      id_card: {
        required: true,
        minlength: 13,
      },
    },
  });

  $(document).on("click", "#admin_edit_btn", function () {
    $.ajax({
      url: "api/member.php",
      type: "POST",
      data: {
        ACTION: "EditAdmin",
        editAd_name: $("#editAd_name").val(),
        ediusername: $("#ediusername").val(),
        edipass: $("#edipass").val(),
        ediAdemail: $("#ediAdemail").val(),
        edistat: $("#edistat").val(),
      },
      success: function (res) {
        if (res == "1") {
          $("#EditAdminModal").modal("toggle");
          ShowAdminInfo();
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
        }
      },
    });
  });
  $(document).on("click", "#del_Ad", function () {
    $("#delAdmin_no").val($(this).attr("deladmin"));
    alert("5555");
  });
  $(document).on("click", "#admin_del_btn", function () {
    console.log("555");
    $.ajax({
      url: "api/member.php",
      type: "POST",
      data: {
        ACTION: "DelAdmin",
        delAdmin_no: $("#delAdmin_no").val(),
      },
      success: function (res) {
        if (res == "1") {
          $("#DelAdminModal").modal("toggle");
          ShowProfile();
          new PNotify({
            title: "สำเร็จ",
            type: "success",
            delay: 2000,
            top: "60px",
            text: "ลบผู้เรียบร้อย",
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

function ListMembers() {
  $.ajax({
    url: "api/member.php",
    type: "GET",
    success: function (res) {
      console.log(res);
      if (res.length > 0) {
        var elem = "";
        for (var i = 0; i < res.length; i++) {
          elem +=
            '<a href="#" id="viewprofile" data-title="ดูข้อมูล ' +
            res[i].student_Fname +
            '" data-toggle="modal" data-target="#ViewMemberModal" data-toggle="tooltip" member_info="' +
            res[i].student_id +
            '">';
          elem += '<div class="col-xs-2">';
          elem +=
            '<img src="imageMember/' +
            res[i].student_pic +
            '" alt="Avatar" class="avatar" style="width: 100px;height: 100px;border-radius: 50%;"></a>';
          elem += "</div>";
          elem += "</a>";
        }
        $("#MemberList").html(elem);
      }
    },
  });
}
function ListAdmin() {
  $.ajax({
    url: _AJURL + "api/member.php",
    type: "POST",
    data: {
      ACTION: "ShowAdmin",
    },
    success: function (res) {
      console.log(res);
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
function ShowProfile() {
  $.ajax({
    url: "api/member.php",
    type: "POST",
    data: {
      ACTION: "MemberInfo",
      Member_id: $("#member_id_info").val(),
    },
    success: function (res) {
      console.log(res);
      if (res.length > 0) {
        var elem = "";
        for (var i = 0; i < res.length; i++) {
          elem +=
            '<i id="edit_mem" class="fa fa-wrench" aria-hidden="true" title="แก้ไขข้อมูล" style="font-size:20px;cursor: pointer;"data-toggle="modal"';
          elem +=
            'data-target="#EditMemberModal" data-toggle="tooltip" memberno="' +
            res[i].student_id +
            '" membername="' +
            res[i].student_Fname +
            '" memberlast="' +
            res[i].student_Lname +
            '" id_number="' +
            res[i].id_card_number +
            '" email="' +
            res[i].email +
            '" tel="' +
            res[i].tel +
            '"></i>';
          elem +=
            '<i id="del_du" class="fa fa-trash" aria-hidden="true" title="ลบข้อมูล" style="font-size:20px;margin-left:2%;cursor: pointer;" data-toggle="modal" ';
          elem +=
            'data-target="#DelMemberModal" data-toggle="tooltip" delmemberno="' +
            res[i].student_id +
            '"></i>';
          elem += '<div class="panel panel-default">';
          elem +=
            '<div class="panel-heading"><center><img src="imageMember/' +
            res[i].student_pic +
            '" style="width:100px;height:100px"></img></center></div>';
          elem += '<div class="panel-body">';
          elem +=
            '<li class="list-group-item">รหัสนักศึกษา : ' +
            res[i].student_id +
            "</li>";
          elem +=
            '<li class="list-group-item">ชื่อ-นาสกุล :' +
            res[i].student_Fname +
            " " +
            res[i].student_Lname +
            "</li>";
          elem +=
            '<li class="list-group-item">e-mail : ' + res[i].email + "</li>";
          elem +=
            '<li class="list-group-item">เบอร์โทรติดต่อ : ' +
            res[i].tel +
            "</li>";
          elem += "</div>";
          elem += "</div>";
        }
        $("#showProfile").html(elem);
      }
    },
  });
}
function ShowEditStat() {
  $.ajax({
    url: _AJURL + "api/member.php",
    type: "POST",
    data: {
      ACTION: "ShowEditStat",
    },
    success: function (res) {
      console.log(res);
      if (res.length > 0) {
        var elem = "";
        for (var i = 0; i < res.length; i++) {
          elem +=
            '<option value="' +
            res[i].staff_status_id +
            '">' +
            res[i].staff_status_detail +
            "</option>";
        }
        $("#edistat").html(elem);
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
            '" passkey="' +
            res[i].passkey +
            '" Ademail="' +
            res[i].email +
            '" stat="' +
            res[i].staff_status_detail +
            '"></i>';
          elem +=
            '<i id="del_Ad" class="fa fa-trash" aria-hidden="true" title="ลบข้อมูล" style="font-size:20px;margin-left:2%;cursor: pointer;" data-toggle="modal" ';
          elem +=
            'data-target="#DelAdminModal" data-toggle="tooltip" deladmin="' +
            res[i].staff_id +
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
