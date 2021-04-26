
$('.post-comment').on('click',function(){
    let new_comment = $("#textarea").val()
    let post_id = $(".post-body").attr("data-post-id")
    console.log(new_comment);
    console.log(post_id);
    $.ajax({
        url: `/post/${post_id}/comments`,
        data: {
            comment: {
                body: new_comment,
                post_id: post_id
            },
            authenticity_token: AUTH_TOKEN
        },
        type: 'POST',
        dataType: 'script',
    }).done(function (data) {
        $("#textarea").val("")
        $(".post-comment").addClass("btn-disabled")
        $(".post-comment").attr("disabled",true); 
    }).fail(function () {
        let mess = "Cập nhật thất bại";
        notiFail(mess)
    })
})

function notiSuccess(mess){
    toastr["success"](mess);
}

function notiFail(mess){
    toastr["error"](mess);
}

$("#textarea").keyup(function(){
    let comment_body = $(this).val();
   
    console.log(comment_body);
    if(comment_body == ""){
        $(".post-comment").attr("disabled",true);  
    }else{
        $(".post-comment").attr("disabled",false);
        $(".post-comment").removeClass("btn-disabled")
    }
     
})