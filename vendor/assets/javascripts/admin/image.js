function readURL(input) {

    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#blah').attr('src', e.target.result);
        }

        reader.readAsDataURL(input.files[0]);
    }
}

$("#category_avatar, #user_avatar").change(function(){
    $('.current-img').remove()
    $('#blah').removeClass("d-none")
    
    readURL(this);
});