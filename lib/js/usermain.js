$(document).ready(function () {
  Init();
  $(document).on("click", ".User_Out", function () {
    var cookie = delete_cookie("UserDIMS");
    if (cookie == "") {
      window.location.href = _URL + "userlogin.php";
    }
  });
  $(document).on("click", "#cancel_btn", function () {
    $("#Borrow").modal("toggle");
    location.reload();
  });
  $(document).on("click", "#durable_bor_btn", function () {
    $.ajax({
      url: _AJURL + "api/borrow.php",
      type: "POST",
      data: {
        ACTION: "searchingdurable",
        Borrow_Scan: $("#borrow_scan").val(),
      },
      success: function (res) {
        console.log(res);
        if (res == "0") {
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
        } else {
          if (res.length > 0) {
            $("#ScanQRDurable").modal("toggle");
            $("#BorrowDurable").modal("show");

            for (var i = 0; i < res.length; i++) {
              $("#durable_name").val(res[i].product_name);
              $("#durable_no").val(res[i].product_id);
            }
            // window.location.href = _URL + 'usermain.php?page=borrow'
          }
        }
      },
    });
  });
  $(document).on("click", "#durable_submit_btn", function () {
    $.ajax({
      url: _AJURL + "api/borrow.php",
      type: "POST",
      data: {
        ACTION: "AddBorrow",
        User_no: $("#user_no").val(),
        Borrow_Scan: $("#durable_no").val(),
        Borrow_Loc: $("#local").val(),
        Borrow_Time: $("#borrow_time").val(),
        Return_Time: $("#return").val(),
      },
      success: function (res) {
        console.log("AddBorrow: " + res);
        if (res == "1") {
          $("#Borrow").modal("hide");
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
  $(document).on("click", "#showInfoProfile", function () {
    ShowProfile();
  });

  $(document).on("change", "#borrow_time", function () {
    var d1 = new Date();
    var d2 = new Date(d1);

    // console.log(d1 == d2); // prints false (wrong!)
    // console.log(d1 === d2); // prints false (wrong!)
    // console.log(d1 != d2); // prints true  (wrong!)
    // console.log(d1 !== d2); // prints true  (wrong!)
    // console.log(d1.getTime()); // prints true (correct)
  });
  $(document).on("click", "#email", function () {
    var id_card = $("#id_card").val();
    if (id_card.length != 13) alert("รหัสประชาชนไม่ถูกต้อง");
    else {
      for (i = 0, sum = 0; i < 12; i++)
        sum += parseFloat(id_card.charAt(i)) * (13 - i);
      if ((11 - (sum % 11)) % 10 != parseFloat(id_card.charAt(12)))
        alert("รหัสประชาชนไม่ถูกต้อง");
      else alert("รหัสประชาชนถูกต้อง");
    }
  });
  $(document).on("click", "#changepass", function () {
    $("#ChangePass").modal("show");
  });
  // $(document).change('#newpass',function(){
  //     if($('#oldpass').val() != $('#newpass').val()){
  //         alert('Not')
  //     }
  // })
  $(document).on("click", "#SaveChange", function () {
    if ($("#oldpass").val() != $("#newpass").val()) {
      alert("New Password not equal");
      $("#newpass").val("");
    } else {
      $.ajax({
        url: "api/findmem.php",
        type: "POST",
        data: {
          ACTION: "ChangePass",
          User_no: $("#user_no").val(),
          New_Pass: $("#newpass").val(),
        },
        success: function (res) {
          if (res == "1") {
            new PNotify({
              title: "สำเร็จ",
              type: "success",
              delay: 2000,
              top: "60px",
              text: "เปลี่ยนรหัสผ่านเรียบร้อย",
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
            $("#ChangePass").modal("toggle");
          }
        },
      });
    }
  });
});

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
            '<i id="edit_mem" class="fa fa-wrench" aria-hidden="true" title="แก้ไขข้อมูล" style="font-size:20px;cursor: pointer;margin-left=5px;"data-toggle="modal"';
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
          elem += '<div class="panel panel-default">';
          elem +=
            '<div class="panel-heading" style="width:24%; margin:auto;"><center><img src="imageMember/' +
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
          elem +=
            '<li class="list-group-item">username : ' +
            res[i].username +
            "</li>";
          elem +=
            '<li class="list-group-item"><button id="changepass" class="btn btn-warning">Change Password</li>';
          elem += "</div>";
          elem += "</div>";
        }
        $("#showProfile").html(elem);
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
    console.log(student_id);
    $(".showFname").html(student_Fname);
    $("#user_no").html(student_id);
    $("#user_no").val(student_id);
    $("#member_id_info").val(student_id);
    $("#user_name").val(student_Fname);
    $("#user_lastname").val(student_Lname);
    $("#user_name").html(student_Fname);
    $("#user_lastname").html(student_Lname);
  } else {
    // window.location.href = _URL + 'userlogin.php';
  }
}
