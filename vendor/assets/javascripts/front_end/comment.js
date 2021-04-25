
$('.post-comment').on('click',function(){
    let new_comment = $("#textarea").val()
    let post_id = $(".post-body").attr("data-post-id")
    console.log(new_comment);
    console.log(post_id);
    $.ajax({
        url: "/admin/comments",
        data: {
            comment: {
                body: new_comment,
                post_id: post_id
            },
            authenticity_token: AUTH_TOKEN
        },
        type: 'POST',
        dataType: 'json',
    }).done(function (data) {
        notiSuccess(data.mes)
        console.log(data.this_comment)
        console.log(data.this_user)
        $("#list-comment").prepend(`<div class="media py-3 border-bottom ">
         <img src="${ data.this_user.avatar }" class="avatar-xs mr-3 rounded-circle" alt="img">
                <div class="media-body">
                    <h5 class="mt-0 mb-1 font-size-15"> ${ data.this_user.name }</h5>
                    <p class="text-muted">${ data.this_comment.body }</p>
                    <ul class="list-inline float-sm-right mb-sm-0">
                        <li class="list-inline-item">
                            <a href="#"><i class="far fa-thumbs-up mr-1"></i>${ data.this_comment.like}</a>
                        </li>
                            <li class="list-inline-item">
                            <a href="#"><i class="fas fa-thumbs-down mr-1"></i>${ data.this_comment.dislike }</a>
                        </li>
                        <li class="list-inline-item">
                            <a href="#"><i class="far fa-comment-dots mr-1"></i> Comment</a>
                        </li>
                    </ul>
                    <div class="text-muted font-size-12"><i class="far fa-calendar-alt text-primary mr-1"></i> 5 hrs ago</div>
                </div>
            </div>`);
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
    