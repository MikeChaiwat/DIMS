$(document).ready(function(){
    ListBorrow()

    $(document).on('click','#confirm_btn',function(){
        $.ajax({
            url: _AJURL+'api/confirm.php',
            type: 'POST',
            data:{
                ACTION:'Confirm',
                Confirm_id: $('#data_confirm').val(),
                b_id:$('#b_id').val()
            },success: function(res){
                console.log(res)
                if(res == '1'){
                    SendMail()
                    location.reload()
                }
            }
        })
    })
    $(document).on('click','#cancel_btn',function(){
        $.ajax({
            url: 'api/confirm.php',
            type: 'POST',
            data:{
                ACTION:'Cancel',
                Confirm_id: $('#data_confirm').val(),
                b_id:$('#b_id').val()
            },success: function(res){
                console.log(res)
                
                    location.reload();
                    ListBorrow()
                
                
            }
        })
        $(doc)
    })
})
function ListBorrow(){
    $.ajax({
        url:  _AJURL+'api/confirm.php',
        type: 'GET',
        success: function(res){
            if(res.length > 0){
                var elem = '';
                for(var i = 0; i < res.length; i++){
                    elem += '<div class="tbl_ResultItemContainer BorderBottom">';
                    elem += '<div class="tbl_ResultItem10 BorderRight paddingLeft5 data-toggle="tooltip" title="'+res[i].student_id+'">'+res[i].student_id+'</div>';
                    elem += '<div class="tbl_ResultItem10 BorderRight paddingLeft5 data-toggle="tooltip" title="'+res[i].student_Fname+'">'+res[i].student_Fname+'</div>';
                    elem += '<div class="tbl_ResultItem10 BorderRight paddingLeft5 data-toggle="tooltip" title="'+res[i].student_Lname+'">'+res[i].student_Lname+'</div>';
                    elem += '<div class="tbl_ResultItem15 BorderRight paddingLeft5 data-toggle="tooltip" title="'+res[i].durable_id+'">'+res[i].durable_id+'</div>';
                    elem += '<div class="tbl_ResultItem15 BorderRight paddingLeft5 data-toggle="tooltip" title="'+res[i].product_name+'">'+res[i].product_name+'</div>';
                    elem += '<div class="tbl_ResultItem10 BorderRight paddingLeft5 data-toggle="tooltip" title="'+res[i].loc_bor+'">'+res[i].loc_bor+'</div>';
                    elem += '<div class="tbl_ResultItem10 BorderRight paddingLeft5 data-toggle="tooltip" title="'+res[i].borrow_date+'">'+res[i].borrow_date+'</div>';
                    elem += '<div class="tbl_ResultItem10 BorderRight paddingLeft5 data-toggle="tooltip" title="'+res[i].return_date+'">'+res[i].return_date+'</div>';
                    elem += '<input type=text id="data_confirm" value="'+res[i].durable_id+'" hidden="hidden"></i>';
                    elem += '<input type=text id="b_id" value="'+res[i].b_id+'" hidden="hidden"></i>';
                    
                    elem += '<div class="tbl_ResultItem5 BorderRight paddingLeft5"><button type="button" id="cancel_btn" class="btn btn-danger btn-xs">ยกเลิก</button></div>';
                    elem += '<div class="tbl_ResultItem5 BorderRight paddingLeft5"><button type="button" id="confirm_btn" class="btn btn-success btn-xs">ยืนยัน</button></div>';
                    elem += '</div>';
                }
                $('#bor_list').html(elem)
                
            }
        }
    })
}
function SendMail(){
    $.ajax({
        url:  _AJURL+'api/confirm.php',
        type: 'GET',
        success: function(res){
            if(res.length > 0){
                var elem = '';
                for(var i = 0; i < res.length; i++){
                   var student_id = res[i].student_id;
                } 
            }
            $.ajax({
                url: _AJURL+'api/sendmail.php',
                    type: 'POST',
                    data:{
                        ACTION:'findDurable',
                        user_id: student_id,
        
                    },success: function(res) {
                    console.log(res)
                    if(res.length >0){
                        //console.log('Email sended.')
                        for(var i =0 ;i< res.length;i++){
                            var mail = res[i].email;
                            var user_id = res[i].student_id;
                            var studen_F = res[i].student_Fname;
                            var studen_L = res[i].student_Lname;
                            var B_Date = res[i].borrow_date;
                            var R_Date = res[i].return_date;
                            var durable_N = res[i].product_name;
                        }
                        $.ajax({
                            url: _AJURL+'api/sendmail.php',
                            type: 'POST',
                            data:{
                                ACTION:'sendDurable',
                                Mail: mail,
                                studen_F: studen_F,
                                studen_L: studen_L,
                                B_Date: B_Date,
                                R_Date: R_Date,
                                durable_N: durable_N,
                                user_id: user_id,
                            },success: function(res){
                                console.log(res)
                                if(res == '1'){
                                   
                                   
                                   location.reload();
                                    ListBorrow()
                                }   
                            }
                        })
        
                    }
                }
            });
        }
    })
}
