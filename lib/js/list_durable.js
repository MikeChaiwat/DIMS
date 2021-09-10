$(document).ready(function () {
  $.ajax({
    url: _AJURL + "api/list_durable.php",
    type: "POST",
    data: {
      ACTION: "listdurable",
    },
    success: function (res) {
      if (res !== "0") {
        var elem = "";
        for (var i = 0; i < res.length; i++) {
          elem += "<tr>";
          elem += "<td>" + res[i].product_id + "</td>";
          elem += "<td>" + res[i].product_name + "</td>";
          elem += "<td>" + res[i].product_detail + "</td>";
          elem += "<td>" + res[i].room_detail + "</td>";
          elem +=
            "<td><img src='lib/images/" +
            res[i].durable_image +
            " ' alt='Durable Image' width='150'></td>";
          elem += "</tr>";
        }
        $("#list_durable").html(elem);
      } else {
        new PNotify({
          title: "แจ้งเตือน",
          type: "error",
          delay: 2000,
          top: "60px",
          text: "ไม่พบข้อมูล",
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
