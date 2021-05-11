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
  //  console.log(position);
    if(position > 296 && position < 435){
        if(flag == 0){
            $(".list-posts-views").addClass("sticky-top-custom")
        }
        flag = 1;
    }
    if(position > 435 ){
        if(flag == 1){
            $(".list-posts-views").removeClass("sticky-top-custom")
            flag = 0 ;
        }
    }
    if(position < 200){
        if(flag == 1){
            $(".list-posts-views").removeClass("sticky-top-custom")
            flag = 0 ;
        }
    }
})

 let readtime = $(".read-time").attr("data-read-time");
 let post_id = $(".post-body").attr("data-post-id");
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