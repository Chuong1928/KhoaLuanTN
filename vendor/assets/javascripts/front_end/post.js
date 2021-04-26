$(".only-tittle").click(function(event){
    event.preventDefault()
    $(".summary").addClass("d-none")
})

$(".with-summary").click(function(event){
    event.preventDefault()
    $(".summary").removeClass("d-none")
})


