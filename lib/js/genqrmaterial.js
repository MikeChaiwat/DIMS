$(document).ready(function () {
  ListDurableGenQR();

  $(document).on("click", "#viewmaterialgenqr", function () {
    $("#matview_name_genqr").val($(this).attr("material_name"));
    $("#matview_detail_genqr").val($(this).attr("material_detail"));
    InDurableListGenQR();
  });

  $(document).on("click", "#btngenqr", function () {
    $("#material_id_genqr").val($(this).attr("material_id_genqr"));
    GenerateQRCode();
  });
});

function ListDurableGenQR() {
  $.ajax({
    url: _AJURL + "api/genqrmaterial.php",
    type: "GET",
    success: function (res) {
      if (res.length > 0) {
        var elem = "";
        for (var i = 0; i < res.length; i++) {
          elem +=
            '<a href="#" title="ดูข้อมูล" data-toggle="modal" data-target="#ViewMaterialGenQRModal" data-toggle="tooltip" id="viewmaterialgenqr" material_name="' +
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
        $("#MaterialListGenQR").html(elem);
      }
    },
  });
}

function InDurableListGenQR() {
  $.ajax({
    url: _AJURL + "api/genqrmaterial.php",
    type: "POST",
    data: {
      ACTION: "ShowDurableQR",
      material_name: $("#matview_name_genqr").val(),
      material_detail: $("#matview_detail_genqr").val(),
    },
    success: function (res) {
      if (res.length > 0) {
        var elem = "";
        var elem2 = "";
        var elem3 = "";
        for (var i = 0; i < res.length; i++) {
          elem +=
            "<li >" +
            res[i].material_id +
            " ---- " +
            res[i].status_name +
            " ----> ";
          elem +=
            "<a href='#' id='btngenqr' class='btn btn-primary' data-toggle='modal' data-target='#MaterialQRCodeModal' material_id_genqr='" +
            res[i].material_id +
            "'>" +
            "สร้าง QR-Code </a>";

          elem += "</li>";
        }
        elem2 += res[0].material_name + " | " + res[0].material_detail;
        elem3 +=
          '<img src="lib/images/' +
          res[0].image_name +
          '" height="150" width="200" >';
        $("#listMaterialQR").html(elem);
        $("#mat_showDurableQR").html(elem2);
        $("#mat_showpicQR").html(elem3);
      }
    },
  });
}

function GenerateQRCode() {
  var material_id = $("#material_id_genqr").val();
  window.location = "printqrmaterial.php?id=" + material_id;
}
