$(document).ready(function () {
  checklistdurable();
  SelectRoom();
  ShowEditDu();
  EdtSelectRoom();
  ShowNameDu();
  DWTQR("check_canvas");
  $(document).on("click", "#scanCheck", function () {
    dwStartScan2();
  });
  $(document).on("click", "#closecheck", function () {
    $("#ListCheckDurable").toggle("hide");
    location.reload();
  });
  $(document).change("#room_check", function () {
    if ($("#room_check").val() != null) {
      console.log("room_check: " + $("#room_check").val());
      $.ajax({
        url: _AJURL + "api/durable.php",
        type: "POST",
        data: {
          ACTION: "FilterdurableCheck",
          Check_Room: $("#room_check").val(),
        },
        success: function (res) {
          console.log("FilterdurableCheck" + res);
          var ducheck = $("#durable_check").val("");
          if (res.length > 0) {
            var elem = "";
            for (var i = 0; i < res.length; i++) {
              elem += "<tr >";
              elem += "<td>" + res[i].product_id + "</td>";
              elem +=
                '<td style="white-space: nowrap;overflow:hidden;text-overflow:clip;">' +
                res[i].product_name +
                "</td>";
              //    elem +='<td>'+res[i].product_detail+'</td>';
              elem += "<td>" + res[i].build_detail + "</td>";
              elem += "<td>" + res[i].room_detail + "</td>";
              elem += "<td>" + res[i].status_detail + "</td>";
              elem += "<td>" + res[i].holding_name + "</td>";
              elem += "<td>" + res[i].checkstatus_name + "</td>";
              elem += "<td>" + res[i].staff_name + "</td>";
              elem += "<td>" + res[i].modify_date + "</td>";
              elem += "</tr>";
            }
            $("#checkdurablelist").html(elem);
            ShowNameDu();
            var elem2 =
              '<select class="form-control" id="durable_check" style="width: 200px; margin-left: 5%;margin-top: 1%;margin-bottom: 1%;" ></select>';

            $("#showSelectDu").html(elem2);
          }
        },
      });
    }
  });

  $(document).on("click", "#edit_check_durable", function () {
    $("#edt_du_id").val($(this).attr("edtCheck"));
    ShowEditDu();
  });
  $(document).on("click", "#update", function () {
    $.ajax({
      url: "api/durable.php",
      type: "POST",
      data: {
        ACTION: "EditCheckRoom",
        edt_du_id: $("#edt_du_id").val(),
        edt_room: $("#edt_room").val(),
      },
      success: function (res) {
        if (res == "1") {
          $("#EditCheckDurable").modal("toggle");
          showCheckDurable();
          new PNotify({
            title: "สำเร็จ",
            type: "success",
            delay: 2000,
            top: "60px",
            text: "อัพเดทข้อมูลเรียบร้อยแล้ว",
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
          new PNotify({
            title: "เกิดข้อผิดพลาด",
            type: "error",
            delay: 2000,
            top: "60px",
            text: "ไม่มารถอัพเดทข้อมูล",
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
  $(document).on("click", "#durable_check_btn", function () {
    showCheckDurable();
  });

  $(document).on("click", "#confirmcheck", function () {
    ConfirmCheckDurable();
  });
});

function dwQRReader2(qrdata) {
  console.log(qrdata);
  $("#check_scan").val(qrdata);
  showCheckDurable();
}
function checklistdurable() {
  $.ajax({
    url: _AJURL + "api/durable.php",
    type: "POST",
    data: {
      ACTION: "durableCheck",
    },
    success: function (res) {
      if (res.length > 0) {
        var elem = "";
        for (var i = 0; i < res.length; i++) {
          elem += "<tr >";
          elem += "<td>" + res[i].product_id + "</td>";
          elem +=
            '<td style="white-space: nowrap;overflow:hidden;text-overflow:clip;">' +
            res[i].product_name +
            "</td>";
          //    elem +='<td>'+res[i].product_detail+'</td>';
          elem += "<td>" + res[i].build_detail + "</td>";
          elem += "<td>" + res[i].room_detail + "</td>";
          elem += "<td>" + res[i].status_detail + "</td>";
          elem += "<td>" + res[i].holding_name + "</td>";
          elem += "<td>" + res[i].checkstatus_name + "</td>";
          elem += "<td>" + res[i].staff_name + "</td>";
          elem += "<td>" + res[i].modify_date + "</td>";
          elem += "</tr>";
        }
        if (elem == "") {
          elem = "ไม่มีข้อมูล";
        }
        $("#checkdurablelist").html(elem);
      }
    },
  });
}
function SelectRoom() {
  $.ajax({
    url: _AJURL + "api/durable.php",
    type: "POST",
    data: {
      ACTION: "SelectRoom",
    },
    success: function (res) {
      console.log(res);
      if (res.length > 0) {
        var elem = "";
        elem +=
          '<option value="" disabled selected>---เลือกสถานที่/ห้อง---</option>';
        for (var i = 0; i < res.length; i++) {
          elem +=
            '<option value="' +
            res[i].room_id +
            '">' +
            res[i].room_detail +
            "</option>";
        }
        $("#room_check").html(elem);
      }
    },
  });
}
function EdtSelectRoom() {
  $.ajax({
    url: _AJURL + "api/durable.php",
    type: "POST",
    data: {
      ACTION: "SelectRoom",
    },
    success: function (res) {
      console.log(res);
      if (res.length > 0) {
        var elem = "";
        elem += '<option value="">---เลือกสถานที่/ห้อง---</option>';
        for (var i = 0; i < res.length; i++) {
          elem +=
            '<option value="' +
            res[i].room_id +
            '">' +
            res[i].room_detail +
            "</option>";
        }
        $("#edt_room").html(elem);
      }
    },
  });
}
function ShowEditDu() {
  console.log($("#edt_du_id").val());
  $.ajax({
    url: _AJURL + "api/durable.php",
    type: "POST",
    data: {
      ACTION: "CheckLocDu",
      check_edt: $("#edt_du_id").val(),
    },
    success: function (res) {
      console.log($("#edt_du_id").val());
      if (res.length > 0) {
        var elem = "";
        for (var i = 0; i < res.length; i++) {
          elem += '<div class="panel panel-default">';
          elem +=
            '<div class="panel-heading" style="margin:auto;"><center><img src="lib/images/' +
            res[i].durable_image +
            '" style="width:100px;height:100px"></img></center></div>';
          elem +=
            '<li class="list-group-item">หมายเลขครุภัณฑ์ ' +
            res[i].product_id +
            "</li>";
          elem +=
            '<li class="list-group-item">ชื่อตั้งเบิก ' +
            res[i].product_name +
            " </li>";
          elem +=
            '<li class="list-group-item">รายละเอียด ' +
            res[i].product_detail +
            " </li>";
          elem +=
            '<li class="list-group-item">สถานะโอนย้าย ' +
            res[i].status_detail +
            " </li>";
          // elem += '';
          elem += "</div>";
        }
        $("#showEdit").html(elem);
      }
    },
  });
}
function showCheckDurable() {
  var durable_id;
  $.ajax({
    url: _AJURL + "api/durable.php",
    type: "POST",
    data: {
      ACTION: "CheckLocationDurable",
      check_scan: $("#check_scan").val(),
    },
    success: function (res) {
      console.log(res);
      if (res != "0") {
        $("#CheckDurable").modal("hide");
        $("#ListCheckDurable").modal("show");
        var elem = "";
        var elem2 = "";
        var elem3 = "";
        for (var i = 0; i < res.length; i++) {
          elem += '<div class="panel panel-default">';
          elem +=
            '<div class="panel-heading" style="margin:auto;"><center><img src="lib/images/' +
            res[i].durable_image +
            '" style="width:100px;height:100px"></img></center></div>';
          elem += '<div class="panel-body">';
          elem +=
            '<li class="list-group-item" >หมายเลขครุภัณฑ์ : ' +
            res[i].product_id +
            " </li>";
          elem +=
            '<li class="list-group-item">ชื่อตั้งเบิก : ' +
            res[i].product_name +
            " </li>";
          elem +=
            '<li class="list-group-item">รายละเอียด : ' +
            res[i].product_detail +
            " </li>";
          elem +=
            '<li class="list-group-item">สถานะโอนย้าย : ' +
            "<select id='status'>" +
            "<option value='s0001'>" +
            "รับโอน" +
            "</option>" +
            "<option value='s0002'>" +
            "อยากจำหน่าย" +
            "</option>" +
            "<option value='s0003'>" +
            "-" +
            "</option>" +
            "</select>" +
            " </li>";
          elem +=
            '<li class="list-group-item">สถานะครุภัณฑ์ : ' +
            "<select id='holding'>" +
            "<option value='0000'>" +
            "ปกติ" +
            "</option>" +
            "<option value='1111'>" +
            "ถูกยืม" +
            "</option>" +
            "<option value='2222'>" +
            "ชำรุด" +
            "</option>" +
            "</select>" +
            " </li>";
          elem +=
            '<li class="list-group-item">การตรวจสอบ : ' +
            res[i].checkstatus_name +
            " </li>";
          elem +=
            '<li class="list-group-item">สถานที่/ห้อง : ' +
            res[i].room_detail +
            " </li>";
          elem += '<li class="list-group-item">';
          elem +=
            '<button id="edit_check_durable" class="btn btn-warning" data-toggle="modal" data-target="#EditCheckDurable" data-toggle="tooltip" edtCheck="' +
            res[i].product_id +
            '">อัพเดทสถานที่ปัจจุบัน</button>';
          elem += "</li>";
          elem += "</div>";
          elem += "</div>";
          elem2 += res[i].product_id;
        }
        // elem2 += res[0].product_name +' | '+ res[0].product_detail;
        // elem3 += '<img src="lib/images/'+res[0].durable_image+'" height="150" width="200" >';
        $("#ChecklistDurable").html(elem);
        $("#Duview_detail").val(elem2);
        // $('#showDurable').html(elem2)
        // $('#showpic').html(elem3)
      } else {
        new PNotify({
          title: "ผิดพลาด",
          type: "error",
          delay: 2000,
          top: "60px",
          text: "ไม่มีครุภัณฑ์นี้อยู่",
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
  $(document).change("#status", function () {
    $("#status_id").val($("#status").val());
    console.log($("#status_id").val());
  });

  $(document).change("#holding", function () {
    $("#holding_id").val($("#holding").val());
    console.log($("#holding_id").val());
  });
}

function ConfirmCheckDurable() {
  var idDurable = $("#Duview_detail").val();
  var status_id = $("#status_id").val();
  var holding_id = $("#holding_id").val();
  var today = NowDate();
  var staff_id = GetIdStaff();
  $.ajax({
    url: _AJURL + "api/durable.php",
    type: "POST",
    data: {
      ACTION: "ConfirmCheckDurable",
      id_durable: idDurable,
      holding_id: holding_id,
      status_id: status_id,
      today: today,
      staff_id: staff_id,
    },
    success: function (res) {
      if (res == "1") {
        $("#ListCheckDurable").modal("hide");
        new PNotify({
          title: "สำเร็จ",
          type: "success",
          delay: 2000,
          top: "60px",
          text: "ตรวจสอบครุภัณฑ์เรียบร้อยแล้ว",
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
        $("#ListCheckDurable").modal("hide");
        new PNotify({
          title: "ผิดพลาด",
          type: "error",
          delay: 2000,
          top: "60px",
          text: "เกิดข้อผิดพลาดในการตรวจสอบครุภัณฑ์",
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

function ShowNameDu() {
  $.ajax({
    url: _AJURL + "api/durable.php",
    type: "POST",
    data: {
      ACTION: "SelectNameDurable",
      Room_Du: $("#room_check").val(),
    },
    success: function (res) {
      console.log(res);
      if (res.length > 0) {
        var elem = "";
        elem += '<option value="">---เลือกชื่อครุภัณฑ์---</option>';
        for (var i = 0; i < res.length; i++) {
          elem +=
            '<option value="' +
            res[i].product_name +
            '">' +
            res[i].product_name +
            "</option>";
        }
        $("#durable_check").html(elem);
      }
    },
  });
}

function NowDate() {
  var today = new Date();
  var dd = today.getDate();
  var mm = today.getMonth() + 1;
  var yyyy = today.getFullYear();
  if (dd < 10) {
    dd = "0" + dd;
  }

  if (mm < 10) {
    mm = "0" + mm;
  }

  today = yyyy + "-" + mm + "-" + dd;
  return today;
}

function GetIdStaff() {
  var cookie = getCookie("StaffDIMS");
  if (cookie != "") {
    var staff_id = cookie.split("|")[0];
  }
  return staff_id;
}
