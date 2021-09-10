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
      url: _AJURL + "api/staff_login.php",
      type: "POST",
      data: {
        ACTION: "AUTHENTICATION",
        USERNAME: $("#lg_username").val(),
        PASSWD: $("#lg_password").val(),
      },
      success: function (res) {
        if (res == "0") {
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
            res[0].staff_id +
            "|" +
            res[0].staff_name +
            "|" +
            res[0].staff_status_detail +
            "|" +
            res[0].staff_pic;
          create_cookie3(cookieval);
          window.location.href = _URL + "staff_main.php?page=home";
        }
      },
    });
  });
  $(document).on("click", "#repass", function () {
    $.ajax({
      url: _AJURL + "api/staff_login.php",
      type: "POST",
      data: {
        ACTION: "findStaff",
        Email: $("#email").val(),
      },
      success: function (res) {
        console.log(res);
        if (res.length > 0) {
          //console.log('Email sended.')
          for (var i = 0; i < res.length; i++) {
            var staff_name = res[i].staff_name;
            var username = res[i].username;
            var passkey = res[i].passkey;
            var email = res[i].email;
          }
          $.ajax({
            url: _AJURL + "api/sendmail.php",
            type: "POST",
            data: {
              ACTION: "sendRepass",
              staff_name: staff_name,
              username: username,
              passkey: passkey,
              email: email,
            },
            success: function (res) {
              console.log(res);
              if (res == "1") {
                alert("เรียบร้อย");
                //    location.reload();
                //     ListBorrow()
              }
            },
          });
        }
      },
    });
  });
  $(document).change("#username", function () {
    if (
      $("#username").val() == "ADMIN" ||
      $("#username").val() == "admin" ||
      $("#username").val() == "Admin" ||
      $("#username").val() == "AdMin" ||
      $("#username").val() == "admintrator"
    ) {
      alert('ไม่สามารถตั้ง "admin" หรือ "admintrator" ได้ ');
    }
  });

  $(document).on("focusout", "#passkey2", function () {
    console.log("focusout");

    if ($("#passkey2").val() !== $("#passkey").val()) {
      $("#message").html("password ไม่ตรงกัน <br>").css("color", "red");
    } else {
      $("#message").html("password ตรงกัน <br>").css("color", "green");
    }
  });
});
