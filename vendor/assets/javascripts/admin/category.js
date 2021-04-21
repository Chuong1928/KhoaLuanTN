// console.log("aaaaa")
var el = document.getElementById('items');
var sortable = Sortable.create(el,{
    swapThreshold: 1,
    animation: 150,
    handle: ".btn-drag",
    onUpdate: function (/**Event*/evt) {
        let list_category = $(".category-items");
        let json_category = {};
        list_category.each(function(index,element){
            json_category[$(element).attr("data-id")] = index+1;
        })
        console.log(json_category);
		$.ajax({
            url: "/admin/categories/update_position",
            data:{
                authenticity_token: AUTH_TOKEN,
                category: json_category,
            } ,
            type: 'POST',
            dataType: 'script',
        })
    }
});
