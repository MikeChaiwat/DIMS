$(document).ready(function () {
  Init();
});
function Init() {
  var cookie1 = getCookie("DIMS");
  var cookie2 = getCookie("StaffDIMS");
  var cookie3 = getCookie("UserDIMS");

  if (cookie1 != "") {
    window.location.href = "main.php?page=home";
  } else {
  }
  if (cookie2 != "") {
    window.location.href = _URL + "staff_main.php?page=home";
  } else {
  }
  if (cookie3 != "") {
    window.location.href = _URL + "usermain.php?page=home";
  } else {
  }
}
