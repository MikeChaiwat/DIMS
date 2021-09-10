$(document).ready(function(){
ListDurable();


$(document).on('click','#unit_add_btn',function(){
    if($('#unit_no').val() == null || $('#unit_no').val() == ""){
        $('#unit_no').focus();
        new PNotify({
            title: "Required Field is missing.",
            type: "info",
            delay: 2000,
            top: "60px",
            text: "Please fill out unit No.",
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
            url:  'api/unit.php',
            type: 'POST',
            data:{
                ACTION:'NewUnit',
                Unit_No: $('#unit_no').val(),
                Unit_Detail: $('#unit_detail').val(),
                
            },success:function (res) {
                console.log(res);
                if(res == '1'){
                    $('#NewUnitModal').modal('toggle');
                    ListDurable()
                    new PNotify({
                        title: "Success.",
                        type: "success",
                        delay: 2000,
                        top: "60px",
                        text: "Unit has been added.",
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


$(document).on('click','.editunit',function(){
    $('#EditUnitModal').modal('show');
    $('#ediunit_no').val($(this).attr('ediunitno'))
    $('#ediunit_detail').val($(this).attr('ediunit_detail'))
})
$(document).on('click','#unit_edit_btn',function(){

    $.ajax({
        url:  'api/unit.php',
        type: 'POST',
        data:{
            ACTION:'EditUnit',
            EdiUnit_No: $('#ediunit_no').val(),
            EdiUnit_Detail: $('#ediunit_detail').val(),
        },success: function(res){
            console.log(res);
            if(res == '1'){
                $('#EditUnitModal').modal('toggle');
                ListDurable()
                new PNotify({
                    title: "Success.",
                    type: "success",
                    delay: 2000,
                    top: "60px",
                    text: "Unit has been edited.",
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

$(document).on('click','.delunit',function(){
    $('#DelUnitModal').modal('show');
    $('#delunit_no').val($(this).attr('dediunitno'))
    $('#delunit_detail').val($(this).attr('delunit_detail'))
})
$(document).on('click','#unit_del_btn',function(){

    $.ajax({
        url:  'api/unit.php',
        type: 'POST',
        data:{
            ACTION:'DelUnit',
            DelUnit_No: $('#delunit_no').val(),
        },success: function(res){
            console.log(res);
            if(res == '1'){
                $('#DelUnitModal').modal('toggle');
                ListDurable()
                new PNotify({
                    title: "Success.",
                    type: "success",
                    delay: 2000,
                    top: "60px",
                    text: "Unit has been deleted.",
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

function ListDurable(){
    $.ajax({
        url:  'api/unit.php',
        type: 'GET',
        success: function(res){
            
            
            if(res.length > 0){
                var elem = '';
                for(var i = 0; i < res.length; i++){
                    elem += '<div class="tbl_ResultItemContainer BorderBottom">';
                    elem += '<div class="tbl_ResultItem20 BorderRight paddingLeft5 ">'+res[i].unit_id+'</div>';
                    elem += '<div class="tbl_ResultItem20 BorderRight paddingLeft5 data-toggle="tooltip" title="'+res[i].unit_detail+'">'+res[i].unit_detail+'</div>';
                    // elem += '<div class="tbl_ResultItem10 BorderRight paddingLeft5 data-toggle="tooltip" title="'+res[i].build_detail+'">'+res[i].build_detail+'</div>';
                    // elem += '<div class="tbl_ResultItem10 BorderRight paddingLeft5 data-toggle="tooltip" title="'+res[i].room_detail+'">'+res[i].room_detail+'</div>';
                    // elem += '<div class="tbl_ResultItem10 BorderRight paddingLeft5 ">'+res[i].status_detail+'</div>';
                    // elem += '<div class="tbl_ResultItem20 BorderRight paddingLeft5 data-toggle="tooltip" title="'+res[i].holding_name+'">'+res[i].holding_name+'</div>';
                    elem += '<div class="tbl_ResultItem5 paddingLeft5"><div class="editunit center" ediunitno="'+res[i].unit_id+'" ediunit_detail="'+res[i].unit_detail+'">';
                    elem += '<i class="fa fa-pencil-square" aria-hidden="true" data-toggle="tooltip" title="Edit"></i></div></div>';
                    elem += '<div class="tbl_ResultItem5 paddingLeft5"><div class="delunit center" dediunitno="'+res[i].unit_id+'" delunit_detail="'+res[i].unit_detail+'">'
                    elem += '<i class="fa fa-trash" aria-hidden="true" data-toggle="tooltip" title="Delete"></i></div></div>';
                    elem += '</div>';
                }
                $('#unit_list').html(elem)
            }
        }
    })
}