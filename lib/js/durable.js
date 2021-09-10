$(document).ready(function () {
  ListDurable();
  InDurableList();
  ListRoom();
  ListBuild();
  ListPic();
  OnloadImage();
  SearchDurable();
  SelectRoom();
  SelectHolding();
  SelectName();
  SelectImageChange();
  $(document).on("click", "#reset_statuscheck", function () {
    ResetStatuscheck();
  });

  $("#ChangeImage").on("change", function () {
    var image = $("#ChangeImage").val();
    $.ajax({
      url: _AJURL + "api/durable.php",
      type: "POST",
      data: {
        ACTION: "ChangeImage",
        image: image,
        detail: $("#Duview_detail").val(),
        name: $("#Duview_name").val(),
      },
      success: function (res) {
        if (res == "1") {
          var elem =
            '<img src="lib/images/' +
            $("#ChangeImage option:selected").text() +
            '" height="150" width="200" >';
          $("#showpic").html(elem);
          new PNotify({
            title: "สำเร็จ",
            type: "success",
            delay: 2000,
            top: "60px",
            text: "เปลี่ยนรูปครุภัณฑ์สำเร็จ",
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
            title: "ผิดพลาด",
            type: "error",
            delay: 2000,
            top: "60px",
            text: "ไม่สามารถเปลี่ยนรูปครุภัณฑ์ได้",
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
  /////////////////////////////add////////////////////////////////////////////
  $(document).on("click", "#durable_add_btn", function () {
    if ($("#durable_no").val() == null || $("#durable_no").val() == "") {
      $("#durable_no").focus();
      new PNotify({
        title: "Required Field is missing.",
        type: "info",
        delay: 2000,
        top: "60px",
        text: "Please fill out durable No.",
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
        url: _AJURL + "api/durable.php",
        type: "POST",
        data: {
          ACTION: "NewDurable",
          Durable_No: $("#durable_no").val(),
          Durable_Name: $("#durable_name").val(),
          Durable_Detail: $("#durable_detail").val(),
          Unit_No: $("#unit_no").val(),
          Type_No: $("#type_no").val(),
          Room_Detail: $("#room").val(),
          Status_No: $("#status_no").val(),
          Pic_id: $("#durable_pic").val(),
          Note: $("#durable_note").val(),
        },
        success: function (res) {
          console.log(res);
          if (res == "1") {
            $("#NewDurableModal").modal("toggle");
            new PNotify({
              title: "สำเร็จ",
              type: "success",
              delay: 2000,
              top: "60px",
              text: "เพิ่มข้อมูลครุภัณฑ์",
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
            new PNotify({
              title: "ผิดพลาด",
              type: "error",
              delay: 2000,
              top: "60px",
              text: "ไม่สามารถเพิ่มข้อมูลครุภัณฑ์ได้",
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
  ////////////////////////////////////////////////////////////////////////////
  $(document).on("click", "#close_view", function () {
    location.reload();
  });
  //////////////////////////edit////////////////////////////////////////////
  $(document).on("click", "#edit_du", function () {
    //$('#EditDurableModal').modal('show');
    $("#edidurable_no").val($(this).attr("edidurableno"));
    $("#edidurable_name").val($(this).attr("edidurablename"));
    $("#edidurable_detail").val($(this).attr("edidurable_detail"));
    $("#editype_no").val($(this).attr("editype"));
    $("#unit_no").val($(this).attr("ediunit"));
    $("#ediloc_no").val($(this).attr("ediloc"));
    $("#ediroom").val($(this).attr("ediroom"));
    $("#edistatus_no").val($(this).attr("edistatus"));
  });

  $(document).on("click", "#durable_edit_btn", function () {
    console.log("Edit");
    $.ajax({
      url: _AJURL + "api/durable.php",
      type: "POST",
      data: {
        ACTION: "EditDur",
        EditDurable_id: $("#edidurable_no").val(),
        EditDurable_Name: $("#edidurable_name").val(),
        EditDurable_Detail: $("#edidurable_detail").val(),
        EditType_No: $("#editype_no").val(),
        EditUnit_No: $("#unit_no").val(),
        EditLoc: $("#ediloc_no").val(),
        EditRoom: $("#ediroom").val(),
        EditStatus: $("#edistatus_no").val(),
      },
      success: function (res) {
        console.log(res);
        if (res == "1") {
          new PNotify({
            title: "สำเร็จ",
            type: "success",
            delay: 2000,
            top: "60px",
            text: "แก้ไขข้อมูลเรียบร้อยแล้ว",
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
  //////////////////////////////////////////////////////////////////////////
  /////////////////////////Delete///////////////////////////////////////////
  $(document).on("click", "#del_du", function () {
    $("#del_id").val($(this).attr("deldurableno"));
  });
  $(document).on("click", "#Del_btn", function () {
    $.ajax({
      url: _AJURL + "api/durable.php",
      type: "POST",
      data: {
        ACTION: "DelDurable",
        DEldurable_id: $("#del_id").val(),
      },
      success: function (res) {
        console.log(res);
        if (res == "1") {
          $("#DelDurableModal").modal("toggle");
          location.reload();
          new PNotify({
            title: "สำเร็จ",
            type: "success",
            delay: 2000,
            top: "60px",
            text: "แก้ไขข้อมูลเรียบร้อยแล้ว",
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
  //////////////////////////////////////////////////////////////////////////
  ///////////////////////////view////////////////////////////////////////
  $(document).on("click", "#viewdurable", function () {
    $("#ViewDurableModal").modal("show");
    $("#Duview_name").val($(this).attr("duviewname"));
    $("#Duview_detail").val($(this).attr("duviewdetail"));
    InDurableList();
  });
  /////////////////////////////////////////////////////////////////////////
  $(document).on("click", "#loc_add_btn", function () {
    if ($("#loc_id").val() == null || $("#loc_id").val() == "") {
      $("#loc_id").focus();
      new PNotify({
        title: "พบช่องว่าง",
        type: "info",
        delay: 2000,
        top: "60px",
        text: "กรุณากรอกที่ช่อง รหัสสถานที่",
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
        url: _AJURL + "api/durable.php",
        type: "POST",
        data: {
          ACTION: "NewLoc",
          Loc_id: $("#loc_id").val(),
          Loc_detail: $("#loc_detail").val(),
        },
        success: function (res) {
          console.log(res);
          if (res == "1") {
            $("#AddbuildModal").modal("toggle");
            ListBuild();
            // ListDurable()
            new PNotify({
              title: "Success.",
              type: "success",
              delay: 2000,
              top: "60px",
              text: "เพิ่มสถานที่เรียบร้อยแล้ว",
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

  $(document).on("click", "#room_add_btn", function () {
    if ($("#room_detail").val() == null || $("#room_id").val() == "") {
      $("#room_detail").focus();
      new PNotify({
        title: "พบช่องว่าง",
        type: "info",
        delay: 2000,
        top: "60px",
        text: "กรุณากรอกชื่อห้อง",
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
        url: _AJURL + "api/durable.php",
        type: "POST",
        data: {
          ACTION: "NewRoom",
          Room_detail: $("#room_detail").val(),
        },
        success: function (res) {
          console.log(res);
          if (res == "1") {
            $("#AddroomModal").modal("toggle");
            ListRoom();
            new PNotify({
              title: "Success.",
              type: "success",
              delay: 2000,
              top: "60px",
              text: "เพิ่มสถานที่เรียบร้อยแล้ว",
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
  $(document).on("click", "#searching", function () {
    SearchDurable();
    //alert($('#search').val())
  });
  $(document).change("#name_select", function () {
    console.log($("#name_select").val());
    $.ajax({
      url: _AJURL + "api/durable.php",
      type: "POST",
      data: {
        ACTION: "ShowSelectDuName",
        name_select: $("#name_select").val(),
      },
      success: function (res) {
        console.log(res);
        if (res.length > 0) {
          var elem = "";
          for (var i = 0; i < res.length; i++) {
            elem +=
              '<a href="#" title="ดูข้อมูล" data-toggle="modal" data-target="#ViewDurableModal" data-toggle="tooltip" id="viewdurable" duviewname="' +
              res[i].product_name +
              '" duviewdetail="' +
              res[i].product_detail +
              '">';
            elem += '<div class="col-xs-4">';
            elem += '<div class="panel panel-primary">';
            elem += '<div class="panel-heading">';
            elem += res[i].product_name;
            elem += "</div>";
            elem +=
              '<div class="panel-body"><center><img src="lib/images/' +
              res[i].durable_image +
              '" height="150" width="200"></div>';
            elem +=
              '<div class="panel-footer">' + res[i].product_detail + "</div>";
            elem += "</div>";
            elem += "</div>";
            elem += "</a>";
          }
          $("#DurableList").html(elem);
        }
      },
    });
  });
});
function ListDurable() {
  $.ajax({
    url: _AJURL + "api/durable.php",
    type: "GET",
    success: function (res) {
      if (res.length > 0) {
        var elem = "";
        for (var i = 0; i < res.length; i++) {
          elem +=
            '<a href="#" title="ดูข้อมูล" data-toggle="modal" data-target="#ViewDurableModal" data-toggle="tooltip" id="viewdurable" duviewname="' +
            res[i].product_name +
            '" duviewdetail="' +
            res[i].product_detail +
            '">';
          elem += '<div class="col-xs-4">';
          elem += '<div class="panel panel-primary">';
          elem += '<div class="panel-heading">';
          elem += res[i].product_name;
          elem += "</div>";
          elem +=
            '<div class="panel-body"><center><img src="lib/images/' +
            res[i].durable_image +
            '" height="150" width="200"></div>';
          elem +=
            '<div class="panel-footer">' + res[i].product_detail + "</div>";
          elem += "</div>";
          elem += "</div>";
          elem += "</a>";
        }
        $("#DurableList").html(elem);
      }
    },
  });
}
function InDurableList() {
  $.ajax({
    url: _AJURL + "api/durable.php",
    type: "POST",
    data: {
      ACTION: "ShowDurable",
      Durable_name: $("#Duview_name").val(),
      Durable_de: $("#Duview_detail").val(),
    },
    success: function (res) {
      if (res.length > 0) {
        var elem = "";
        var elem2 = "";
        var elem3 = "";
        for (var i = 0; i < res.length; i++) {
          elem +=
            "<li >" +
            res[i].product_id +
            " -------- " +
            res[i].holding_name +
            " " +
            res[i].status_detail +
            " ";
          elem +=
            '<i id="edit_du" class="fa fa-wrench" aria-hidden="true" title="แก้ไขข้อมูล" style="margin-left:20%;cursor: pointer;"data-toggle="modal"';
          elem +=
            'data-target="#EditDurableModal" data-toggle="tooltip" edidurableno="' +
            res[i].product_id +
            '" edidurablename="' +
            res[i].product_name +
            '" edidurable_detail="' +
            res[i].product_detail +
            '" ediroom="' +
            res[i].room_id +
            '" edistatus="' +
            res[i].status_id +
            '" editype="' +
            res[i].types_id +
            '" ediunit="' +
            res[i].unit_id +
            '" ediloc="' +
            res[i].loc_id +
            '"></i>';
          elem +=
            '<i id="del_du" class="fa fa-times" aria-hidden="true" title="ลบข้อมูล" style="margin-left:5%;cursor: pointer;" data-toggle="modal" ';
          elem +=
            'data-target="#DelDurableModal" data-toggle="tooltip" deldurableno="' +
            res[i].product_id +
            '"></i>';
          elem += "</li>";
        }
        elem2 += res[0].product_name + " | " + res[0].product_detail;
        elem3 +=
          '<img src="lib/images/' +
          res[0].durable_image +
          '" height="150" width="200" >';
        $("#listDurable").html(elem);
        $("#showDurable").html(elem2);
        $("#showpic").html(elem3);
      }
    },
  });
}
function ListRoom() {
  $.ajax({
    url: _AJURL + "api/room.php",
    type: "GET",
    success: function (res2) {
      if (res2.length > 0) {
        var elem = "";
        for (var i = 0; i < res2.length; i++) {
          elem +=
            '<option value="' +
            res2[i].room_id +
            '">' +
            res2[i].room_detail +
            "</option>";
        }
        $("#room").html(elem);
        $("#ediroom").html(elem);
      }
    },
  });
}
function ListBuild() {
  $.ajax({
    url: _AJURL + "api/build.php",
    type: "GET",
    success: function (res) {
      if (res.length > 0) {
        var elem = "";
        for (var i = 0; i < res.length; i++) {
          elem +=
            '<option value="' +
            res[i].loc_id +
            '">' +
            res[i].build_detail +
            "</option>";
        }
        $("#loc_no").html(elem);
        $("#locations_id").html(elem);
        $("#ediloc_no").html(elem);
      }
    },
  });
}
function ListPic() {
  $.ajax({
    url: _AJURL + "api/durableImage.php",
    type: "GET",
    success: function (res) {
      if (res.length > 0) {
        var elem = "";
        for (var i = 0; i < res.length; i++) {
          elem +=
            '<option value="' +
            res[i].pic_id +
            '">' +
            res[i].durable_image +
            "</option>";
        }
        $("#durable_pic").html(elem);
      }
    },
  });
}
function OnloadImage() {
  $("#durable_pic").change(function () {
    $.ajax({
      url: _AJURL + "api/durableImage.php",
      type: "POST",
      data: {
        ACTION: "LoadImage",
        Pic_Id: $("#durable_pic").val(),
      },
      success: function (res) {
        console.log(res);
        if (res.length > 0) {
          var elem = "";
          for (var i = 0; i < res.length; i++) {
            elem +=
              '<img id="previewing" src="lib/images/' +
              res[i].durable_image +
              ' "  width="150" height="150"/>';
          }
          $("#image_preview").html(elem);
        }
      },
    });
  });
}
function SearchDurable() {
  $.ajax({
    url: _AJURL + "api/durable.php",
    type: "POST",
    data: {
      ACTION: "search",
      Search: $("#search").val(),
    },
    success: function (res) {
      if (res > 0) {
        var elem = "";
        for (var i = 0; i < res.length; i++) {
          elem +=
            '<a href="#" title="ดูข้อมูล" data-toggle="modal" data-target="#ViewDurableModal" data-toggle="tooltip" id="viewdurable" duviewname="' +
            res[i].product_name +
            '" duviewdetail="' +
            res[i].product_detail +
            '">';
          elem += '<div class="col-xs-4">';
          elem += '<div class="panel panel-primary">';
          elem += '<div class="panel-heading">';
          elem += res[i].product_name;
          elem += "</div>";
          elem +=
            '<div class="panel-body"><center><img src="lib/images/' +
            res[i].durable_image +
            '" height="150" width="200"></div>';
          elem +=
            '<div class="panel-footer">' + res[i].product_detail + "</div>";
          elem += "</div>";
          elem += "</div>";
          elem += "</a>";
        }
        $("#DurableList").html(elem);
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
        $("#room_select").html(elem);
      }
    },
  });
}
function SelectHolding() {
  $.ajax({
    url: _AJURL + "api/durable.php",
    type: "POST",
    data: {
      ACTION: "SelectHolding",
    },
    success: function (res) {
      if (res.length > 0) {
        var elem = "";
        elem += '<option value="" disabled selected>---เลือกสถานะ---</option>';
        for (var i = 0; i < res.length; i++) {
          elem +=
            '<option value="' +
            res[i].holding_id +
            '">' +
            res[i].holding_name +
            "</option>";
        }
        $("#stat_select").html(elem);
      }
    },
  });
}
function SelectName() {
  $.ajax({
    url: _AJURL + "api/durable.php",
    type: "POST",
    data: {
      ACTION: "SelectName",
    },
    success: function (res) {
      if (res.length > 0) {
        var elem = "";
        elem +=
          '<option value="" disabled selected>---เลือกชื่อตั้งเบิก---</option>';
        for (var i = 0; i < res.length; i++) {
          elem +=
            '<option value="' +
            res[i].product_name +
            '">' +
            res[i].product_name +
            "</option>";
        }
        $("#name_select").html(elem);
      }
    },
  });
}
function ResetStatuscheck() {
  var r = confirm("คุณต้องการรีเซ็ตสถานะการตรวจสอบครุภัณฑ์ทั้งหมดหรือไม่");
  if (r == true) {
    $.ajax({
      url: _AJURL + "api/durable.php",
      type: "POST",
      data: {
        ACTION: "ResetStatuscheck",
      },
      success: function (res) {
        if (res == "1") {
          new PNotify({
            title: "Success",
            type: "success",
            delay: 2000,
            top: "60px",
            text: "รีเซ็ตสถานะการตรวจสอบเรียบร้อย",
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
        }
      },
    });
  } else {
    console.log("Reset Abort");
  }
}
function SelectImageChange() {
  $.ajax({
    url: _AJURL + "api/durable.php",
    type: "POST",
    data: {
      ACTION: "SelectImageChange",
    },
    success: function (res) {
      if (res !== "0") {
        var elem = "";
        elem += '<option value="" disabled selected>เปลี่ยนรูปภาพ</option>';
        for (var i = 0; i < res.length; i++) {
          elem +=
            '<option value="' +
            res[i].pic_id +
            '">' +
            res[i].durable_image +
            "</option>";
        }
        $("#ChangeImage").html(elem);
      } else {
      }
    },
  });
}
