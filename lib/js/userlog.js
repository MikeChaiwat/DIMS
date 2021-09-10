jQuery.extend(jQuery.validator.messages, {
  minlength: jQuery.validator.format("กรุณาใส่ให้ครบ {0} ตัว "),
  number: jQuery.validator.format("กรุณาใส่แต่ตัวเลข "),
});

$(document).ready(function () {
  $("#login-form").validate({
    rules: {
      lg_username: {
        required: true,
      },
      lg_password: {
        required: true,
      },
    },
  });
  $("#login-form").submit(function (e) {
    e.preventDefault();
  });

  $(document).on("click", "#login", function () {
    $.ajax({
      url: _AJURL + "api/userlog.php",
      type: "POST",
      data: {
        ACTION: "AUTHENTICATION",
        USERNAME: $("#lg_username").val(),
        PASSWD: $("#lg_password").val(),
      },
      success: function (res) {
        if (res == "0") {
          console.log(res);
          $("#lg_username").val("");
          $("#lg_password").val("");
          new PNotify({
            title: "คำเตือน",
            type: "error",
            delay: 2000,
            top: "60px",
            text: "ไม่พบข้อมูลของผู้ใช้งาน",
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
          var cookieval =
            res[0].student_id +
            "|" +
            res[0].student_Fname +
            "|" +
            res[0].student_Lname +
            "|" +
            res[0].student_pic;
          create_cookie2(cookieval);
          window.location.href = _URL + "usermain.php?page=home";
        }
      },
    });
  });

  $(document).on("click", "#member_add_btn", function () {
    if ($("#member_no").val() == null || $("#member_no").val() == "") {
      $("#member_no").focus();
      new PNotify({
        title: "คำเตือน",
        type: "notice",
        delay: 2000,
        top: "60px",
        text: "กรุณาใส่รหัสนักศึกษา",
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
        url: _AJURL + "api/userlog.php",
        type: "POST",
        data: {
          ACTION: "NewMember",
          Member_No: $("#member_no").val(),
          Member_Name: $("#member_name").val(),
          Member_Lastname: $("#member_lastname").val(),
          Member_Id_Card: $("#member_id_card").val(),
          Member_Mail: $("#member_mail").val(),
          Member_Tel: $("#member_tel").val(),
        },
        success: function (res) {
          console.log(res);
          if (res == "1") {
            // alert('แสดงความยินดี')
            new PNotify({
              title: "แสดงความยินดี",
              type: "success",
              delay: 2000,
              top: "60px",
              text: "คุณลงทะเบียนสำเร็จแล้ว",
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
            SendMail();
            // $('#NewMemberModal').modal('toggle');
          } else {
            //alert('มีชื่อผู้ใช้งานนี้แล้ว')
            new PNotify({
              title: "คำเตือน",
              type: "notice",
              delay: 2000,
              top: "60px",
              text: "มีชื่อผู้ใช้งานนี้แล้ว",
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
  $(document).on("click", "#email", function () {
    var id_card = $("#id_card").val();
    if (id_card.length != 13) alert("รหัสประชาชนไม่ถูกต้อง");
    else {
      for (i = 0, sum = 0; i < 12; i++)
        sum += parseFloat(id_card.charAt(i)) * (13 - i);
      if ((11 - (sum % 11)) % 10 != parseFloat(id_card.charAt(12)))
        alert("รหัสประชาชนไม่ถูกต้อง");
      else;
      // alert('รหัสประชาชนถูกต้อง') ;
    }
  });
  $(document).on("click", "#fname", function () {
    var member_id = $("#member_id").val();
    if (member_id.length != 13) alert("รหัสนักศึกษาไม่ถูกต้อง");
    else;
    // alert('รหัสประชาชนถูกต้อง') ;
  });
  $(document).on("click", "#tel", function () {
    var id_card = $("#id_card").val();
    if (id_card.length != 13) {
      for (i = 0, sum = 0; i < 12; i++)
        sum += parseFloat(id_card.charAt(i)) * (13 - i);
      if ((11 - (sum % 11)) % 10 != parseFloat(id_card.charAt(12)))
        alert("รหัสประชาชนถูกต้อง");
      else alert("รหัสประชาชนไม่ถูกต้อง");
    }
  });

  $(document).on("click", "#sendForgot", function () {
    if ($("#Forusername").val() == null || $("#Forusername").val() == "") {
      $("#Forusername").focus();
      new PNotify({
        title: "คำเตือน",
        type: "notice",
        delay: 2000,
        top: "60px",
        text: "กรุณาใส่ username",
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
      // $.ajax({
      //     url: _AJURL + 'api/forgotpass.php',
      //     type: 'POST',
      //     data:{
      //         ACTION:'ForgotPass',
      //         Forusername: $('#Forusername').val(),
      //         Formail: $('#Formail').val(),
      //     },success: function(res){
      //         console.log(res)
      //         if(res == '1'){
      //             // alert('แสดงความยินดี')
      //             new PNotify({
      //                 title: "แจ้งเตือน",
      //                 type: "success",
      //                 delay: 2000,
      //                 top: "60px",
      //                 text: "ส่งข้อมูลไปที่ อีเมล์ของคุณแล้ว",
      //                 animation: "fade",
      //                 animate_speed: 'fast',
      //                 text_escape: true,
      //                 styling: 'fontawesome',
      //                 before_open: function(PNotify){
      //                     PNotify.css({
      //                         "top":"60px"
      //                     });
      //                 }
      //             });
      //             $('#ForgetPass').modal('toggle');
      //         }else{
      //             //alert('มีชื่อผู้ใช้งานนี้แล้ว')
      //             new PNotify({
      //                 title: "คำเตือน",
      //                 type: "notice",
      //                 delay: 2000,
      //                 top: "60px",
      //                 text: "ไม่พบข้อมูลผู้ใช้งาน",
      //                 animation: "fade",
      //                 animate_speed: 'fast',
      //                 text_escape: true,
      //                 styling: 'fontawesome',
      //                 before_open: function(PNotify){
      //                     PNotify.css({
      //                         "top":"60px"
      //                     });
      //                 }
      //             });
      //         }
      //     }
      // })
    }
  });
});
function SendMail() {
  $.ajax({
    url: _AJURL + "api/sendmail.php",
    type: "POST",
    data: {
      ACTION: "sendRegister",
      Member_No: $("#member_no").val(),
      Member_Name: $("#member_name").val(),
      Member_Lastname: $("#member_lastname").val(),
      Member_Id_Card: $("#member_id_card").val(),
      Member_Mail: $("#member_mail").val(),
      Member_Tel: $("#member_tel").val(),
    },
    success: function (res) {},
  });
}
function Init() {
  var cookie = getCookie("UserDIMS");
  if (cookie != "") {
    var username = cookie.split("|")[0];
    var name = cookie.split("|")[1];
    var status = cookie.split("|")[2];
  } else {
    window.location.href = _URL;
  }
}
