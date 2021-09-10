$(document).ready(function () {
  Init();
  callnotification();
  callnotification2();

  DWTQR("qr_canvas");
  $(document).on("click", "#scan", function () {
    dwStartScan();
  });

  $(document).on("click", "#User_Out", function () {
    var cookie = delete_cookie("StaffDIMS");
    window.location.href = _AJURL;
    if (cookie == undefined) {
      window.location.href = _AJURL;
    }
  });

  $(document).on("click", "#durable_re_btn", function () {
    $.ajax({
      url: _AJURL + "api/borrow.php",
      type: "POST",
      data: {
        ACTION: "searchReturn",
        Borrow_Scan: $("#borrow_scan").val(),
      },
      success: function (res) {
        if (res == "1") {
          //เจอข้อมูลยืมครุภัณฑ์
          durableshow();
          $("#res").val(res);
        } else if (res == "2") {
          //เจอข้อมูลยืมวัสดุ
          materialshow();
          $("#res").val(res);
        } else {
          new PNotify({
            title: "คำเตือน",
            type: "error",
            delay: 2000,
            top: "60px",
            text: "ไม่พบข้อมูลครุภัณฑ์และวัสดุ",
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

        // if (res == "0") {
        //   new PNotify({
        //     title: "คำเตือน",
        //     type: "error",
        //     delay: 2000,
        //     top: "60px",
        //     text: "ไม่พบข้อมูลครุภัณฑ์",
        //     animation: "fade",
        //     animate_speed: "fast",
        //     text_escape: true,
        //     styling: "fontawesome",
        //     before_open: function (PNotify) {
        //       PNotify.css({
        //         top: "60px",
        //       });
        //     },
        //   });
        // }
      },
    });
  });
  $(document).on("click", "#durable_submit_btn", function () {
    var opt = $("#res").val();
    if (opt == "1") {
      $.ajax({
        url: _AJURL + "api/return.php",
        type: "POST",
        data: {
          ACTION: "DelBorrow",
          Durable_no: $("#durable_no").val(),
          Borrow_Scan: $("#borrow_scan").val(),
        },
        success: function (res) {
          console.log(res);
          if (res == "1") {
            $("#Borrow").modal("toggle");
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
          }
        },
      });
    }
    if (opt == "2") {
      $.ajax({
        url: _AJURL + "api/return.php",
        type: "POST",
        data: {
          ACTION: "DelBorrowMaterial",
          Durable_no: $("#durable_no").val(),
          Borrow_Scan: $("#borrow_scan").val(),
        },
        success: function (res) {
          console.log(res);
          if (res == "1") {
            $("#Borrow").modal("toggle");
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
          }
        },
      });
    }
    // $.ajax({
    //   url: _AJURL + "api/borrow.php",
    //   type: "POST",
    //   data: {
    //     ACTION: "searchReTool",
    //     Borrow_Scan: $("#borrow_scan").val(),
    //   },
    //   success: function (res) {
    //     console.log(res);
    //     if (res == "1") {
    //       $.ajax({
    //         url: "api/return.php",
    //         type: "POST",
    //         data: {
    //           ACTION: "DelBorrowTools",
    //           Durable_no: $("#durable_no").val(),
    //           user_no: $("#user_no").val(),
    //         },
    //         success: function (res) {
    //           console.log(res);
    //           if (res == "1") {
    //             $("#Borrow").modal("toggle");
    //             new PNotify({
    //               title: "สำเร็จ",
    //               type: "success",
    //               delay: 2000,
    //               top: "60px",
    //               text: "เรียบร้อย",
    //               animation: "fade",
    //               animate_speed: "fast",
    //               text_escape: true,
    //               styling: "fontawesome",
    //               before_open: function (PNotify) {
    //                 PNotify.css({
    //                   top: "60px",
    //                 });
    //               },
    //             });
    //             location.reload();
    //           }
    //         },
    //       });
    //     } else {
    //       $.ajax({
    //         url: _AJURL + "api/return.php",
    //         type: "POST",
    //         data: {
    //           ACTION: "DelBorrow",
    //           Durable_no: $("#durable_no").val(),
    //           Borrow_Scan: $("#borrow_scan").val(),
    //         },
    //         success: function (res) {
    //           console.log(res);
    //           if (res == "1") {
    //             $("#Borrow").modal("toggle");
    //             new PNotify({
    //               title: "สำเร็จ",
    //               type: "success",
    //               delay: 2000,
    //               top: "60px",
    //               text: "เรียบร้อย",
    //               animation: "fade",
    //               animate_speed: "fast",
    //               text_escape: true,
    //               styling: "fontawesome",
    //               before_open: function (PNotify) {
    //                 PNotify.css({
    //                   top: "60px",
    //                 });
    //               },
    //             });
    //             setTimeout(function () {
    //               location.reload();
    //             }, 2000);
    //           }
    //         },
    //       });
    //     }
    //   },
    // });
  });
});
function materialshow() {
  $.ajax({
    url: _AJURL + "api/borrow.php",
    type: "POST",
    data: {
      ACTION: "searching4",
      Borrow_Scan: $("#borrow_scan").val(),
    },
    success: function (res) {
      console.log(res);
      if (res !== "0") {
        $("#ScanQR").modal("toggle");
        $("#Borrow").modal("toggle");
        for (var i = 0; i < res.length; i++) {
          $("#user_no").val(res[i].student_id);
          $("#user_name").val(res[i].student_Fname);
          $("#user_lastname").val(res[i].student_Lname);
          $("#durable_no").val(res[i].material_id);
          $("#durable_name").val(res[i].material_name);
          $("#local").val(res[i].loc_bor);
          $("#borrow_time").val(res[i].borrow_date);
          $("#return").val(res[i].return_date);
        }
      } else {
        new PNotify({
          title: "คำเตือน",
          type: "error",
          delay: 2000,
          top: "60px",
          text: "ไม่พบข้อมูลวัสดุ",
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
function durableshow() {
  $.ajax({
    url: _AJURL + "api/borrow.php",
    type: "POST",
    data: {
      ACTION: "searching3",
      Borrow_Scan: $("#borrow_scan").val(),
    },
    success: function (res) {
      console.log(res);
      if (res == "0") {
        $("#borrow_scan").val("");
        new PNotify({
          title: "คำเตือน",
          type: "error",
          delay: 2000,
          top: "60px",
          text: "ไม่พบข้อมูลครุภัณฑ์",
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
      if (res.length > 0) {
        $("#ScanQR").modal("toggle");
        $("#Borrow").modal("show");
        for (var i = 0; i < res.length; i++) {
          $("#user_no").val(res[i].student_id);
          $("#user_name").val(res[i].student_Fname);
          $("#user_lastname").val(res[i].student_Lname);
          $("#durable_no").val(res[i].durable_id);
          $("#durable_name").val(res[i].product_name);
          $("#local").val(res[i].loc_bor);
          $("#borrow_time").val(res[i].borrow_date);
          $("#return").val(res[i].return_date);
        }
      }
    },
  });
}
function callnotification() {
  $.ajax({
    url: "api/confirm.php",
    type: "GET",
    success: function (res) {
      if (res.length > 0) {
        for (var i = 0; i < res.length; i++) {
          $("#notice").html(res.length);
        }
      }
    },
  });
}
function callnotification2() {
  $.ajax({
    url: "api/confirm2.php",
    type: "GET",
    success: function (res) {
      if (res !== "0") {
        for (var i = 0; i < res.length; i++) {
          $("#notice2").html(res.length);
        }
      }
    },
  });
}
function dwQRReader(qrdata) {
  console.log(qrdata);
  $("#borrow_scan").val(qrdata);
  $.ajax({
    url: _AJURL + "api/borrow.php",
    type: "POST",
    data: {
      ACTION: "searching3",
      Borrow_Scan: $("#borrow_scan").val(),
    },
    success: function (res) {
      console.log(res);
      if (res == "0") {
        if (res.length > 0) {
          $.ajax({
            url: _AJURL + "api/borrow.php",
            type: "POST",
            data: {
              ACTION: "searching4",
              Borrow_Scan: $("#borrow_scan").val(),
            },
            success: function (res) {
              console.log(res);
              if (res == "0") {
                $("#borrow_scan").val("");
                new PNotify({
                  title: "คำเตือน",
                  type: "error",
                  delay: 2000,
                  top: "60px",
                  text: "ไม่พบข้อมูลครุภัณฑ์",
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
                  $("#ScanQR").modal("toggle");
                  $("#Borrow").modal("show");
                  for (var i = 0; i < res.length; i++) {
                    $("#bor_id").val(res[i].b_id);
                    $("#user_no").val(res[i].student_id);
                    $("#user_name").val(res[i].student_Fname);
                    $("#user_lastname").val(res[i].student_Lname);
                    $("#durable_no").val(res[i].box_id);
                    $("#durable_name").val(res[i].box_detail);
                    $("#local").val(res[i].loc_bor);
                    $("#borrow_time").val(res[i].borrow_date);
                    $("#return").val(res[i].return_date);
                  }
                }
              }
            },
          });
        }
      } else {
        $("#ScanQR").modal("toggle");
        $("#Borrow").modal("show");
        for (var i = 0; i < res.length; i++) {
          $("#bor_id").val(res[i].b_id);
          $("#user_no").val(res[i].student_id);
          $("#user_name").val(res[i].student_Fname);
          $("#user_lastname").val(res[i].student_Lname);
          $("#durable_no").val(res[i].durable_id);
          $("#durable_name").val(res[i].product_name);
          $("#local").val(res[i].loc_bor);
          $("#borrow_time").val(res[i].borrow_date);
          $("#return").val(res[i].return_date);
        }
      }
    },
  });
}
function Init() {
  var cookie = getCookie("StaffDIMS");

  if (cookie != "") {
    var staff_id = cookie.split("|")[0];
    var staff_name = cookie.split("|")[1];
    var staff_status_detail = cookie.split("|")[2];
    var staff_pic = cookie.split("|")[3];

    $("#showuser").html(staff_name);
    var showpic =
      '<img src="imageMember/' +
      staff_pic +
      '" class="" style="marin-left:1%;widht:30px;height:30px;border-radius: 50%;"></img>';
    $("#showpic").html(showpic);
    var showUserPic =
      '<img src="imageMember/' +
      staff_pic +
      '" class="" style="marin-left:1%;widht:100px;height:100px;border-radius: 50%; margin-top:5%;"></img>';
    $("#showUserPic").html(showUserPic);
    $("#ShowUserName").html(staff_name);
  } else {
    window.location.href = _URL;
  }
}
