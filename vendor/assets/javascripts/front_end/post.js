$(".only-tittle").click(function(event){
    event.preventDefault()
    $(".summary").addClass("d-none")
})

$(".with-summary").click(function(event){
    event.preventDefault()
    $(".summary").removeClass("d-none")
})

let flag = 0;
$(document).scroll(function(){
    let position = window.pageYOffset
    let currenoffset = $("#post-for-category").offset()
    if(currenoffset){
        let postposition = currenoffset.top - 100
        console.log(position);
        console.log(postposition);
        if(position > 280){
            if(flag == 0){
                $(".avatar-user").removeClass("d-none")
                $(".post-action").addClass("fixed-left")
            }
            flag = 1;
        }
        // if(position > 435 ){
        //     if(flag == 1){
        //         $(".list-posts-views").removeClass("sticky-top-custom")
        //         flag = 0 ;
        //     }
        // }
        if(position < 280 || position > postposition - 250){
            if(flag == 1){
                $(".avatar-user").addClass("d-none")
                $(".post-action").removeClass("fixed-left")
                flag = 0 ;
            }
        }
    }

})

 let readtime = $(".read-time").attr("data-read-time");
 let post_id = $(".post-body").attr("data-post-id");
 if(readtime){
    setTimeout(function(){
        console.log(readtime*60*1000);
        $.ajax({
            url: `/post/${post_id}`,
            data: {
                id: post_id,
                authenticity_token: AUTH_TOKEN,
            },
            type: 'PATCH',
            dataType: 'json',
        })
     },(readtime*60*1000)/2)
 }
 