// console.log("aaaaa")
var el = document.getElementById('items');
if(el != null){
    var sortable = Sortable.create(el, {
        swapThreshold: 1,
        animation: 150,
        handle: ".btn-drag",
        onUpdate: function ( /**Event*/ evt) {
            updatePosition()
        }
    });
    // call update  upposition el
    function updatePosition() {
        let list_category = $(".category-items");
        let json_category = {};
        list_category.each(function (index, element) {
            json_category[$(element).attr("data-id")] = index + 1;
        })
        // console.log(json_category);
        ajaxUpdatePosition(json_category)
    }
    // ajax update positon
    function ajaxUpdatePosition(data) {
        
        $.ajax({
            url: "/admin/categories/update_position",
            data: {
                authenticity_token: AUTH_TOKEN,
                category: data,
            },
            type: 'POST',
            dataType: 'json',
    
        }).done(function (data) {
            notiSuccess(data.mes)
            
        }).fail(function () {
            let mess = "Cập nhật thất bại";
            notiFail(mess)
        })
    }
    
}

//call selec2
$('.select2').select2({multiple: true})