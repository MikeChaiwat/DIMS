$(document).ready(function () {
  Init();
  ShowTime();
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

  $(document).on("click", "#test", function () {
    console.log("KUY");
    $("#ForgetPassAdmin").modal("show");
  });

  $(document).on("click", "#login", function () {
    $.ajax({
      url: _AJURL + "api/users.php",
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
          $("#Confirm_log").modal("show");
        } else {
          if (res.length > 0) {
            var cookieval =
              res[0].staff_id +
              "|" +
              res[0].staff_name +
              "|" +
              res[0].staff_status_detail;
            create_cookie1(cookieval);
            window.location.href = "main.php?page=home";
          }
        }
      },
    });
  });
  $(document).on("click", "#confirm_btn", function () {
    $.ajax({
      url: _AJURL + "api/users.php",
      type: "POST",
      data: {
        ACTION: "ChangeStatuss",
      },
      success: function (res) {
        if (res == "1") {
          $("#Confirm_log").modal("toggle");
          var cookie = delete_cookie("DIMS");
          location.reload();
        } else {
        }
      },
    });
  });
});
function ShowTime() {
  $.ajax({
    url: _AJURL + "api/users.php",
    type: "POST",
    data: {
      ACTION: "ShowTime",
      USERNAME: $("#lg_username").val(),
      PASSWD: $("#lg_password").val(),
    },
    success: function (res) {
      if (res.length > 0) {
        var elem = "";
        for (var i = 0; i < res.length; i++) {
          elem += res[i].LastUpdate;
        }
        $("#ShowTime").html(elem);
      }
    },
  });
}
function Init() {
  var cookie = getCookie("DIMS");

  if (cookie != "") {
    window.location.href = "main.php?page=home";
  } else {
    console.log("no cookie");
  }
}
