var _URL = "http://localhost/DIMS/";
var _AJURL = "http://localhost/DIMS/";
var create_cookie1 = function (data) {
  var encrypted_data = CryptoJS.AES.encrypt(data, "SALT-2493");
  document.cookie = "DIMS=" + encrypted_data;
};
var create_cookie2 = function (data) {
  var encrypted_data = CryptoJS.AES.encrypt(data, "SALT-2493");
  document.cookie = "UserDIMS=" + encrypted_data;
};
var create_cookie3 = function (data) {
  var encrypted_data = CryptoJS.AES.encrypt(data, "SALT-2493");
  document.cookie = "StaffDIMS=" + encrypted_data;
};
var delete_cookie = function (name) {
  document.cookie = name + "=;expires=Thu, 01 Jan 1970 00:00:01 GMT;";
};
var getCookie = function (cname) {
  var name = cname + "=";
  var decodedCookie = decodeURIComponent(document.cookie);
  var ca = decodedCookie.split(";");
  for (var i = 0; i < ca.length; i++) {
    var c = ca[i];
    while (c.charAt(0) == " ") {
      c = c.substring(1);
    }
    if (c.indexOf(name) == 0) {
      var _cookie = c.substring(name.length, c.length);
      var decrypted = CryptoJS.AES.decrypt(_cookie, "SALT-2493");
      return decrypted.toString(CryptoJS.enc.Utf8);
    }
  }
  return "";
};
