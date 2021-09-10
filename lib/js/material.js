$(document).ready(function () {
  ShowMaterial();
  ListImageMaterial();
  OnloadImageMaterial();
  SelectImageMatChange();

  $(document).on("click", "#material_add_btn", function () {
    $.ajax({
      url: "api/material.php",
      type: "POST",
      data: {
        ACTION: "AddMaterial",
        material_id: $("#material_id").val(),
        material_name: $("#material_name").val(),
        material_detail: $("#material_detail").val(),
        type_material: $("#type_material").val(),
        image_id: $("#material_image").val(),
        unit_no: $("#unit_no").val(),
        room: $("#room").val(),
      },
      success: function (res) {
        console.log(res);
        if (res == "1") {
          new PNotify({
            title: "สำเร็จ",
            type: "success",
            delay: 2000,
            top: "60px",
            text: "เพิ่มวัสดุเรียบร้อยแล้ว",
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
            text: "ไม่สามารถเพิ่มข้อมูลวัสดุได้",
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
  $("#ChangeImageMaterial").on("change", function () {
    var image = $("#ChangeImageMaterial").val();
    $.ajax({
      url: _AJURL + "api/material.php",
      type: "POST",
      data: {
        ACTION: "ChangeImage",
        image: image,
        name: $("#view_material_name").val(),
        detail: $("#view_material_detail").val(),
      },
      success: function (res) {
        if (res == "1") {
          var elem =
            '<img src="lib/images/' +
            $("#ChangeImageMaterial option:selected").text() +
            '" height="150" width="200" >';
          $("#showpic_mat").html(elem);
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

  //********* Click View Material **********/
  $(document).on("click", "#viewmaterial", function () {
    $("#view_material_name").val($(this).attr("material_name"));
    $("#view_material_detail").val($(this).attr("material_detail"));
    InShowMaterialList();
  });

  //********* Edit Material **************/
  $(document).on("click", "#edit_material", function () {
    console.log("KUY");
    $("#edit_material_id").val($(this).attr("material_id"));
    $("#edit_material_name").val($(this).attr("material_name"));
    $("#edit_material_detail").val($(this).attr("material_detail"));
    $("#edit_typematerial").val($(this).attr("typematerial"));
    $("#material_unit_no").val($(this).attr("unit"));
    $("#ediroom").val($(this).attr("room"));
    $("#edit_status").val($(this).attr("status"));
  });

  $(document).on("click", "#material_edit_btn", function () {
    console.log("Edit");
    $.ajax({
      url: _AJURL + "api/material.php",
      type: "POST",
      data: {
        ACTION: "EditMaterial",
        material_id: $("#edit_material_id").val(),
        material_name: $("#edit_material_name").val(),
        material_detail: $("#edit_material_detail").val(),
        material_type: $("#edit_typematerial").val(),
        material_unit: $("#material_unit_no").val(),
        material_room: $("#ediroom").val(),
        material_status: $("#edit_status").val(),
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
        } else {
          new PNotify({
            title: "ผิดพลาด",
            type: "error",
            delay: 2000,
            top: "60px",
            text: "ไม่สามารถแก้ไขข้อมูลได้",
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

  //***********DELETE Material ************/
  $(document).on("click", "#del_material", function () {
    $("#material_del_id").val($(this).attr("material_id"));
  });
  $(document).on("click", "#material_del_btn", function () {
    $.ajax({
      url: _AJURL + "api/material.php",
      type: "POST",
      data: {
        ACTION: "DelMaterial",
        material_id: $("#material_del_id").val(),
      },
      success: function (res) {
        if (res == "1") {
          new PNotify({
            title: "สำเร็จ",
            type: "success",
            delay: 2000,
            top: "60px",
            text: "ลบข้อมูลวัสดุเรียบร้อยแล้ว",
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
            text: "ไม่สามารถลบข้อมูลวัสดุได้",
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
  //   $(document).on("click", "#editools", function () {
  //     $("#EdiToolsModal").modal("show");
  //     $("#editools_name").val($(this).attr("toolsname"));
  //     $("#editools_detail").val($(this).attr("toolsdetail"));
  //     $("#ediboxes_id").val($(this).attr("boxid"));
  //     $("#editools_id").val($(this).attr("toolsid"));
  //   });
  //   $(document).on("click", "#tools_edi_btn", function () {
  //     $.ajax({
  //       url: "api/tools.php",
  //       type: "POST",
  //       data: {
  //         ACTION: "Editools",
  //         Editools_name: $("#editools_name").val(),
  //         Editools_detail: $("#editools_detail").val(),
  //         Ediboxes_id: $("#ediboxes_id").val(),
  //         Editools_id: $("#editools_id").val(),
  //       },
  //       success: function (res) {
  //         console.log(res);
  //         if (res == "1") {
  //           $("#EdiToolsModal").modal("toggle");
  //           ListTools();
  //           new PNotify({
  //             title: "สำเร็จ",
  //             type: "success",
  //             delay: 2000,
  //             top: "60px",
  //             text: "แก้ไขข้อมูลเครื่องมือเรียบร้อยแล้ว",
  //             animation: "fade",
  //             animate_speed: "fast",
  //             text_escape: true,
  //             styling: "fontawesome",
  //             before_open: function (PNotify) {
  //               PNotify.css({
  //                 top: "60px",
  //               });
  //             },
  //           });
  //         }
  //       },
  //     });
  //   });
  //   $(document).on("click", ".viewtools", function () {
  //     $("#ViewToolsModal").modal("show");
  //     $("#showBox").html($(this).attr("box_de"));
  //     $("#view_id").val($(this).attr("boxid"));
  //     InBox();
  //   });
  //   $(document).on("click", "#ShowBox", function () {
  //     //$('#ViewToolsModal').modal('show');
  //     $("#showBox").html($(this).attr("sh_id"));
  //     $("#view_id").val($(this).attr("box_id"));
  //     InBox();
  //   });
  //   $(document).on("click", "#del_tool", function () {
  //     //$('#DelToolsModal').modal('show');
  //     $("#deltools_id").val($(this).attr("deltoolsno"));
  //   });
  //   $(document).on("click", "#tools_del_btn", function () {
  //     $.ajax({
  //       url: "api/tools.php",
  //       type: "POST",
  //       data: {
  //         ACTION: "DelTools",
  //         DelTools_id: $("#deltools_id").val(),
  //       },
  //       success: function (res) {
  //         console.log(res);
  //         if (res == "1") {
  //           $("#DelToolsModal").modal("toggle");
  //           InBox();
  //           new PNotify({
  //             title: "สำเร็จ",
  //             type: "success",
  //             delay: 2000,
  //             top: "60px",
  //             text: "ลบข้อมูลเครื่องมือเรียบร้อยแล้ว",
  //             animation: "fade",
  //             animate_speed: "fast",
  //             text_escape: true,
  //             styling: "fontawesome",
  //             before_open: function (PNotify) {
  //               PNotify.css({
  //                 top: "60px",
  //               });
  //             },
  //           });
  //         }
  //       },
  //     });
  //   });
  //   $(document).on("click", "#close_tool", function () {
  //     location.reload();
  //   });
});

// function ListTools() {
//   $.ajax({
//     url: "api/tools.php",
//     type: "GET",
//     success: function (res) {
//       console.log(res);
//       if (res.length > 0) {
//         var elem = "";
//         for (var i = 0; i < res.length; i++) {
//           elem += '<div class="tbl_ResultItemContainer BorderBottom">';
//           elem +=
//             '<div class="tbl_ResultItem30 BorderRight paddingLeft5">' +
//             res[i].tools_name +
//             "</div>";
//           elem +=
//             '<div class="tbl_ResultItem30 BorderRight paddingLeft5">' +
//             res[i].tools_detail +
//             "</div>";
//           elem +=
//             '<div class="tbl_ResultItem15 BorderRight paddingLeft5"><a href="#" data-toggle="tooltip" title="ดูกล่องเครื่องมือ" class="viewtools" box_de="' +
//             res[i].box_detail +
//             '" toolsname="' +
//             res[i].tools_name +
//             '" boxid="' +
//             res[i].box_id +
//             '">' +
//             res[i].box_detail +
//             "</a></div>";
//           elem +=
//             '<div class="tbl_ResultItem3 center"><div class="editools center" toolsid="' +
//             res[i].tools_id +
//             '" toolsname="' +
//             res[i].tools_name +
//             '" toolsdetail="' +
//             res[i].tools_detail +
//             '" boxid="' +
//             res[i].box_id +
//             '">';
//           elem +=
//             '<i class="fa fa-pencil-square" aria-hidden="true" data-toggle="tooltip" title="แก้ไข"></i></div></div>';
//           elem += "</div>";
//         }
//         $("#toolList").html(elem);
//       }
//     },
//   });
// }
// function InBox() {
//   $.ajax({
//     url: "api/tools.php",
//     type: "POST",
//     data: {
//       ACTION: "ShowTools",
//       boxes_id: $("#view_id").val(),
//     },
//     success: function (res) {
//       if (res.length > 0) {
//         var elem = "";
//         for (var i = 0; i < res.length; i++) {
//           elem += "<li>";
//           elem +=
//             '<i id="editools" class="fa fa-wrench" aria-hidden="true" title="แก้ไขข้อมูล" style="margin-left:0%;cursor: pointer;"data-toggle="modal"';
//           elem +=
//             'data-target="#EdiToolsModal" data-toggle="tooltip" toolsid="' +
//             res[i].tools_id +
//             '" toolsname="' +
//             res[i].tools_name +
//             '" toolsdetail="' +
//             res[i].tools_detail +
//             '" boxid="' +
//             res[i].box_id +
//             '"></i> ';
//           elem +=
//             '<i id="del_tool" class="fa fa-times" aria-hidden="true" title="ลบข้อมูล" style="margin-left:2%;cursor: pointer;" data-toggle="modal" ';
//           elem +=
//             'data-target="#DelToolsModal" data-toggle="tooltip" deltoolsno="' +
//             res[i].tools_id +
//             '"></i>';
//           elem += " | " + res[i].tools_name + " ";
//           elem += "</li>";
//         }
//         $("#listtools").html(elem);
//       }
//     },
//   });
// }

// function ListBox() {
//   $.ajax({
//     url: "api/box.php",
//     type: "GET",
//     success: function (res) {
//       // console.log(res)
//       if (res.length > 0) {
//         var elem = "";
//         for (var i = 0; i < res.length; i++) {
//           elem +=
//             '<option value="' +
//             res[i].box_id +
//             '">' +
//             res[i].box_detail +
//             "</option>";
//         }
//         $("#boxes_id").html(elem);
//         $("#ediboxes_id").html(elem);
//       }
//     },
//   });
// }
function ShowMaterial() {
  $.ajax({
    url: "api/material.php",
    type: "POST",
    data: {
      ACTION: "ShowMaterial",
    },
    success: function (res) {
      if (res !== 0) {
        var elem = "";
        for (var i = 0; i < res.length; i++) {
          elem +=
            '<a href="#" title="ดูข้อมูล" data-toggle="modal" data-target="#ViewMaterialModal" data-toggle="tooltip" id="viewmaterial" material_name="' +
            res[i].material_name +
            '" material_detail="' +
            res[i].material_detail +
            '">';
          elem += '<div class="col-xs-4">';
          elem += '<div class="panel panel-primary">';
          elem += '<div class="panel-heading">';
          elem += res[i].material_name;
          elem += "</div>";
          elem +=
            '<div class="panel-body"><center><img src="lib/images/' +
            res[i].image_name +
            '" height="150" width="200"></div>';
          elem +=
            '<div class="panel-footer">' + res[i].material_detail + "</div>";
          elem += "</div>";
          elem += "</div>";
          elem += "</a>";
        }
        $("#materiallist").html(elem);
      }
    },
  });
}

function InShowMaterialList() {
  $.ajax({
    url: _AJURL + "api/material.php",
    type: "POST",
    data: {
      ACTION: "InShowMaterial",
      material_name: $("#view_material_name").val(),
      material_detail: $("#view_material_detail").val(),
    },
    success: function (res) {
      if (res !== 0) {
        var elem = "";
        var elem2 = "";
        var elem3 = "";
        for (var i = 0; i < res.length; i++) {
          elem +=
            "<li >" +
            res[i].material_id +
            " -------- " +
            res[i].status_name +
            " ";
          elem +=
            '<i id="edit_material" class="fa fa-wrench" aria-hidden="true" title="แก้ไขข้อมูล" style="margin-left:20%;cursor: pointer;"data-toggle="modal"';
          elem +=
            'data-target="#EditMaterialModal" data-toggle="tooltip" material_id="' +
            res[i].material_id +
            '" material_name="' +
            res[i].material_name +
            '" material_detail="' +
            res[i].material_detail +
            '" room="' +
            res[i].room_id +
            '" status="' +
            res[i].status_id +
            '" typematerial="' +
            res[i].typematerial_id +
            '" unit="' +
            res[i].unit_id +
            '"></i>';
          elem +=
            '<i id="del_material" class="fa fa-times" aria-hidden="true" title="ลบข้อมูล" style="margin-left:5%;cursor: pointer;" data-toggle="modal" ';
          elem +=
            'data-target="#DelMaterialModal" data-toggle="tooltip" material_id="' +
            res[i].material_id +
            '"></i>';
          elem += "</li>";
        }
        elem2 += res[0].material_name + " | " + res[0].material_detail;
        elem3 +=
          '<img src="lib/images/' +
          res[0].image_name +
          '" height="150" width="200" >';
        $("#listMaterial").html(elem);
        $("#showMaterial").html(elem2);
        $("#showpic_mat").html(elem3);
      }
    },
  });
}

function ListImageMaterial() {
  $.ajax({
    url: _AJURL + "api/materialImage.php",
    type: "GET",
    success: function (res) {
      if (res !== 0) {
        var elem = "";
        for (var i = 0; i < res.length; i++) {
          elem +=
            '<option value="' +
            res[i].image_id +
            '">' +
            res[i].image_name +
            "</option>";
        }
        $("#material_image").html(elem);
      }
    },
  });
}
function OnloadImageMaterial() {
  $("#material_image").change(function () {
    $.ajax({
      url: _AJURL + "api/materialImage.php",
      type: "POST",
      data: {
        ACTION: "LoadImage",
        img_id: $("#material_image").val(),
      },
      success: function (res) {
        console.log(res);
        if (res.length > 0) {
          var elem = "";
          for (var i = 0; i < res.length; i++) {
            elem +=
              '<img id="previewing" src="lib/images/' +
              res[i].image_name +
              ' "  width="150" height="150"/>';
          }
          $("#image_preview_mat").html(elem);
        }
      },
    });
  });
}
function SelectImageMatChange() {
  $.ajax({
    url: _AJURL + "api/material.php",
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
            res[i].image_id +
            '">' +
            res[i].image_name +
            "</option>";
        }
        $("#ChangeImageMaterial").html(elem);
      } else {
      }
    },
  });
}
