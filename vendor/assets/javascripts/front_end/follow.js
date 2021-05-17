$(function(){
    $(document).on('click', ".btn-follow", function(){
        let user_id =  $(this).attr("data-user-id")
        console.log(user_id);
       $.ajax({
            url: "/authors",
            data: {
                follow: {
                    
                    followed_id: user_id
                },
                authenticity_token: AUTH_TOKEN
            },
            type: 'POST',
            dataType: 'json',
        }).done(function (data) {
            notiSuccess(data.mes)
        }).fail(function () {
            let mess = "Cập nhật thất bại";
            notiFail(mess)
        })
    })
})


$(function(){
    $(document).on('click', ".btn-unfollow", function(){
        let user_id =  $(this).attr("data-user-id")
        console.log(user_id);
       $.ajax({
            url: `/authors/${user_id}`,
            data: {
                follow: {
                    
                    followed_id: user_id
                },
                authenticity_token: AUTH_TOKEN
            },
            type: 'DELETE',
            dataType: 'json',
        }).done(function (data) {
            notiSuccess(data.mes)
        }).fail(function () {
            let mess = "Cập nhật thất bại";
            notiFail(mess)
        })
    })
})