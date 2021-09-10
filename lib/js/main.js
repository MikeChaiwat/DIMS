$(document).ready(function () {
  Init();

  $(document).on("click", "#log_out", function () {
    cookie = delete_cookie("DIMS");

    if (cookie == undefined) {
      $.ajax({
        url: _AJURL + "api/users.php",
        type: "POST",
        data: {
          ACTION: "ChangeStatuss",
        },
        success: function (res) {
          if (res == "1") {
            window.location.href = _AJURL;
          } else {
          }
        },
      });
    }
  });
});

function Init() {
  var cookie = getCookie("DIMS");

  if (cookie != "") {
    var staff_id = cookie.split("|")[0];
    var staff_name = cookie.split("|")[1];
    var staff_status_detail = cookie.split("|")[2];

    $(".user_show").html(staff_name);
  } else {
    window.location.href = _AJURL;
  }
}
