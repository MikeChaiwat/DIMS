$(document).ready(function(){
    Listlocation()

    $(document).on('click','#loc_add_btn',function(){
        if($('#loc_no').val() == null || $('#loc_no').val() == ""){
            $('#loc_no').focus();
            new PNotify({
                title: "Required Field is missing.",
                type: "info",
                delay: 2000,
                top: "60px",
                text: "กรุณากรอกรหัสสถานที่ด้วย",
                animation: "fade",
                animate_speed: 'fast',
                text_escape: true,
                styling: 'fontawesome',
                before_open: function(PNotify){
                    PNotify.css({
                        "top":"60px"
                    });
                }
            });
        }else{
            $.ajax({
                url:  'api/location.php',
                type: 'POST',
                data:{
                    ACTION:'NewLoc',
                    Loc_No: $('#loc_no').val(),
                    build_Detail: $('#build_detail').val(),
                    Room_No: $('#room_no').val(),
                    Room_Detail: $('#room_detail').val(),
                    
                },success:function (res) {
                    console.log(res);
                    if(res == '1'){
                        $('#NewLocModal').modal('toggle');
                        Listlocation()
                        new PNotify({
                            title: "Success.",
                            type: "success",
                            delay: 2000,
                            top: "60px",
                            text: "location has been added.",
                            animation: "fade",
                            animate_speed: 'fast',
                            text_escape: true,
                            styling: 'fontawesome',
                            before_open: function(PNotify){
                                PNotify.css({
                                    "top":"60px"
                                });
                            }
                        });
                    }
                }
            })
        }
       
    })

    $(document).on('click','.editloc',function(){
        $('#EditLocModal').modal('show');
        $('#ediloc_no').val($(this).attr('edilocno'))
        $('#edibuild_detail').val($(this).attr('edibuild_detail'))
        $('#ediroom_no').val($(this).attr('ediroom_id'))
        $('#ediroom_detail').val($(this).attr('ediroom_detail'))
    })
    $(document).on('click','#Loc_edit_btn',function(){

        $.ajax({
            url:  'api/location.php',
            type: 'POST',
            data:{
                ACTION:'EditLoc',
                EdiLoc_No: $('#ediloc_no').val(),
                EdiBuild_Detail: $('#edibuild_detail').val(),
                EdiRoom_No: $('#ediroom_no').val(),
                EdiRoom_Detail: $('#ediroom_detail').val(),
            },success: function(res){
                console.log(res);
                if(res == '1'){
                    $('#EditLocModal').modal('toggle');
                    Listlocation()
                    new PNotify({
                        title: "Success.",
                        type: "success",
                        delay: 2000,
                        top: "60px",
                        text: "location has been edited.",
                        animation: "fade",
                        animate_speed: 'fast',
                        text_escape: true,
                        styling: 'fontawesome',
                        before_open: function(PNotify){
                            PNotify.css({
                                "top":"60px"
                            });
                        }
                    });
                }
            }
        })
    })

    $(document).on('click','.delloc',function(){
        $('#DelLocModal').modal('show');
        $('#delloc_no').val($(this).attr('dellocno'))
        $('#delbuild_detail').val($(this).attr('delbuild_detail'))
        $('#delroom_no').val($(this).attr('delroom_id'))
        $('#delroom_detail').val($(this).attr('delroom_detail'))
    })
    $(document).on('click','#loc_del_btn',function(){

        $.ajax({
            url:  'api/location.php',
            type: 'POST',
            data:{
                ACTION:'DelLoc',
                DelLoc_No: $('#delloc_no').val(),
                DelRoom_No: $('#delroom_no').val()
            },success: function(res){
                console.log(res);
                if(res == '1'){
                    $('#DelLocModal').modal('toggle');
                    Listlocation()
                    new PNotify({
                        title: "Success.",
                        type: "success",
                        delay: 2000,
                        top: "60px",
                        text: "location has been deleted.",
                        animation: "fade",
                        animate_speed: 'fast',
                        text_escape: true,
                        styling: 'fontawesome',
                        before_open: function(PNotify){
                            PNotify.css({
                                "top":"60px"
                            });
                        }
                    });
                }
            }
        })
    })

})

function Listlocation(){
    $.ajax({
        url:  'api/location.php',
        type: 'GET',
        success: function(res){
            
            
            if(res.length > 0){
                var elem = '';
                for(var i = 0; i < res.length; i++){
                    elem += '<div class="tbl_ResultItemContainer BorderBottom">';
                    elem += '<div class="tbl_ResultItem20 BorderRight paddingLeft5 ">'+res[i].room_id+'</div>';
                    elem += '<div class="tbl_ResultItem20 BorderRight paddingLeft5 ">'+res[i].build_detail+'</div>';
                    elem += '<div class="tbl_ResultItem20 BorderRight paddingLeft5 ">'+res[i].room_detail+'</div>';
                    elem += '<div class="tbl_ResultItem5 paddingLeft5"><div class="editloc center" edilocno="'+res[i].loc_id+'" edibuild_detail="'+res[i].build_detail+'" ediroom_detail="'+res[i].room_detail+'" ediroom_id="'+res[i].room_id+'">';
                    elem += '<i class="fa fa-pencil-square" aria-hidden="true" data-toggle="tooltip" title="Edit"></i></div></div>';
                    elem += '<div class="tbl_ResultItem5 paddingLeft5"><div class="delloc center" dellocno="'+res[i].loc_id+'" delbuild_detail="'+res[i].build_detail+'" delroom_detail="'+res[i].room_detail+'" delroom_id="'+res[i].room_id+'">'
                    elem += '<i class="fa fa-trash" aria-hidden="true" data-toggle="tooltip" title="Delete"></i></div></div>';
                    elem += '</div>';
                }
                $('#loc_list').html(elem)
            }
        }
    })
}