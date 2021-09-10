$(document).ready(function () {
  ListDurableGenQR();

  $(document).on("click", "#viewdurablegenqr", function () {
    $("#ViewDurableGenQRModal").modal("show");
    $("#Duview_name_genqr").val($(this).attr("duviewname"));
    $("#Duview_detail_genqr").val($(this).attr("duviewdetail"));
    InDurableListGenQR();
  });

  $(document).on("click", "#btngenqr", function () {
    $("#durable_id_genqr").val($(this).attr("durable_id_genqr"));
    GenerateQRCode();
  });
});

function ListDurableGenQR() {
  $.ajax({
    url: _AJURL + "api/genqr.php",
    type: "GET",
    success: function (res) {
      if (res.length > 0) {
        var elem = "";
        for (var i = 0; i < res.length; i++) {
          elem +=
            '<a href="#" title="ดูข้อมูล" data-toggle="modal" data-target="#ViewDurableGenQRModal" data-toggle="tooltip" id="viewdurablegenqr" duviewname="' +
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
        $("#DurableListGenQR").html(elem);
      }
    },
  });
}

function InDurableListGenQR() {
  $.ajax({
    url: _AJURL + "api/genqr.php",
    type: "POST",
    data: {
      ACTION: "ShowDurableQR",
      Durable_name: $("#Duview_name_genqr").val(),
      Durable_de: $("#Duview_detail_genqr").val(),
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
            " ---- " +
            res[i].holding_name +
            " " +
            res[i].status_detail +
            " ----> ";
          elem +=
            "<a href='#' id='btngenqr' class='btn btn-primary' data-toggle='modal' data-target='#QRCodeModal' durable_id_genqr='" +
            res[i].product_id +
            "'>" +
            "สร้าง QR-Code </a>";

          elem += "</li>";
        }
        elem2 += res[0].product_name + " | " + res[0].product_detail;
        elem3 +=
          '<img src="lib/images/' +
          res[0].durable_image +
          '" height="150" width="200" >';
        $("#listDurableQR").html(elem);
        $("#showDurableQR").html(elem2);
        $("#showpicQR").html(elem3);
      }
    },
  });
}

function GenerateQRCode() {
  var durable_id = $("#durable_id_genqr").val();
  window.location = "printqr.php?id=" + durable_id;
}
