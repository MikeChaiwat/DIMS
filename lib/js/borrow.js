$(document).ready(function(){
    Listborrow()
})
function Listborrow(){
    $.ajax({
        url:   _AJURL+'api/borrow.php',
        type: 'GET',
        success: function(res){
            if(res.length > 0){
                var elem = '';
                for(var i = 0; i < res.length; i++){
                    elem += '<div class="tbl_ResultItemContainer BorderBottom">';
                    elem += '<div class="tbl_ResultItem12 BorderRight paddingLeft5 data-toggle="tooltip" title="'+res[i].student_id+'">'+res[i].student_id+'</div>';
                    elem += '<div class="tbl_ResultItem12 BorderRight paddingLeft5 data-toggle="tooltip" title="'+res[i].student_Fname+'">'+res[i].student_Fname+'</div>';
                    elem += '<div class="tbl_ResultItem12 BorderRight paddingLeft5 data-toggle="tooltip" title="'+res[i].student_Lname+'">'+res[i].student_Lname+'</div>';
                    elem += '<div class="tbl_ResultItem15 BorderRight paddingLeft5 data-toggle="tooltip" title="'+res[i].durable_id+'">'+res[i].durable_id+'</div>';
                    elem += '<div class="tbl_ResultItem12 BorderRight paddingLeft5 data-toggle="tooltip" title="'+res[i].product_name+'">'+res[i].product_name+'</div>';
                    elem += '<div class="tbl_ResultItem12 paddingLeft5 data-toggle="tooltip" title="'+res[i].loc_bor+'">'+res[i].loc_bor+'</div>';
                    elem += '<div class="tbl_ResultItem12 paddingLeft5 data-toggle="tooltip" title="'+res[i].borrow_date+'">'+res[i].borrow_date+'</div>';
                    elem += '<div class="tbl_ResultItem12 paddingLeft5 data-toggle="tooltip" title="'+res[i].return_date+'">'+res[i].return_date+'</div>';
                    elem += '</div>';
                }
                $('#BorrowList').html(elem)
            }
        }
    })
}


