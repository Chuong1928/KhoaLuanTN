$('.title_tag, .peralink_tag, .slug_tag').keyup(function () {
    let input = $(this).val();
    console.log(input == "");
    let remove_unicode = removeVietnameseTones(input)
    let final_permalink = get_permalink(remove_unicode)
    let value = $(this).val().toLowerCase();
    $("#myList").addClass('d-none')
    if(value != ""){
        $("#myList").removeClass('d-none')
        $("#myList li").filter(function() {
            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
          });
    }
    $(".peralink_tag").val(final_permalink)
    $(".slug_tag").val(final_permalink)
   
});

$('.select2').select2({
    tags: true,
    tokenSeparators: [',', ' ']
})
