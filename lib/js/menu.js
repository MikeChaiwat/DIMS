function MenuList(){
    $.ajax({
        url: 'api/menu.html',
        type: 'GET',
        success: function(res){
            if(res.length > 0){
                var elem = '';
                for(var i = 0; i < res.length; i++){
                    elem += '<div style="width:100%;height:100px;line-height:50px">';
                    elem += '<center><i class="fa fa-user-circle-o" style="font-size: 100px; margin-top: 4%" aria-hidden="true"></i></center>';
                    elem += '</div>';
                    elem += '<div style="margin-top: 10%">';
                    elem += '<center><h3><i class="fa fa-circle-o-notch" aria-hidden="true" style="font-size: 15px;color: #27AE60;font-weight: bold"></i> User</h3></center>';
                    elem += '</div>';
                    elem += '<div class="nav nav-pills nav-stacked">';
                    elem += '<li class="active"><a href="main.php?page=home"><i class="fa fa-home" aria-hidden="true"></i> Home</a></li>';
                    elem += '<li><a href="main.php?page=durable">Durable List</a></li>';
                    elem += '<li><a href="main.php?page=member">Member List</a></li>';
                    elem += '<li><a href="#">Borrow List</a></li>';
                    elem += '<li><a href="#">Return List</a></li>';
                    elem += '<li style="margin-top: 78%" class="active"><a href="#"><i class="fa fa-sign-out" aria-hidden="true"></i> Logout</a></li>';
                    elem += '</div>';
                }
                $('#Menu_border').html(elem)
            }
        }
    })
}