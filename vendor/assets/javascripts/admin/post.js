    $('.title_post, .peralink_post, #user_name').keyup(function () {
        let input = $(this).val();
        let remove_unicode = removeVietnameseTones(input)
        let final_permalink = get_permalink(remove_unicode)
        $(".peralink_post").val(final_permalink)
    });

    function get_permalink(title) {
        return title.split(" ").join("-")
    }
     function removeVietnameseTones(str) {
             str = str.replace(/à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ/g,"a"); 
             str = str.replace(/è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ/g,"e"); 
             str = str.replace(/ì|í|ị|ỉ|ĩ/g,"i"); 
             str = str.replace(/ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ/g,"o"); 
             str = str.replace(/ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ/g,"u"); 
             str = str.replace(/ỳ|ý|ỵ|ỷ|ỹ/g,"y"); 
             str = str.replace(/đ/g,"d");
             str = str.replace(/À|Á|Ạ|Ả|Ã|Â|Ầ|Ấ|Ậ|Ẩ|Ẫ|Ă|Ằ|Ắ|Ặ|Ẳ|Ẵ/g, "A");
             str = str.replace(/È|É|Ẹ|Ẻ|Ẽ|Ê|Ề|Ế|Ệ|Ể|Ễ/g, "E");
             str = str.replace(/Ì|Í|Ị|Ỉ|Ĩ/g, "I");
             str = str.replace(/Ò|Ó|Ọ|Ỏ|Õ|Ô|Ồ|Ố|Ộ|Ổ|Ỗ|Ơ|Ờ|Ớ|Ợ|Ở|Ỡ/g, "O");
             str = str.replace(/Ù|Ú|Ụ|Ủ|Ũ|Ư|Ừ|Ứ|Ự|Ử|Ữ/g, "U");
             str = str.replace(/Ỳ|Ý|Ỵ|Ỷ|Ỹ/g, "Y");
             str = str.replace(/Đ/g, "D");
             // Some system encode vietnamese combining accent as individual utf-8 characters
             // Một vài bộ encode coi các dấu mũ, dấu chữ như một kí tự riêng biệt nên thêm hai dòng này
             str = str.replace(/\u0300|\u0301|\u0303|\u0309|\u0323/g, ""); // ̀ ́ ̃ ̉ ̣  huyền, sắc, ngã, hỏi, nặng
             str = str.replace(/\u02C6|\u0306|\u031B/g, ""); // ˆ ̆ ̛  Â, Ê, Ă, Ơ, Ư
             // Remove extra spaces
             // Bỏ các khoảng trắng liền nhau
             str = str.replace(/ + /g," ");
             str = str.trim();
             // Remove punctuations
             // Bỏ dấu câu, kí tự đặc biệt
             str = str.replace(/!|@|%|\^|\*|\(|\)|\+|\=|\<|\>|\?|\/|,|\.|\:|\;|\'|\"|\&|\#|\[|\]|~|\$|_|`|-|{|}|\||\\/g," ");
             return str;
         }

         let time_out_search;
         $("#q_title_cont").keyup(function () {
             let key_word = $(this).val();
             clearTimeout(time_out_search)
             time_out_search = setTimeout(() => {
                 // call api
                 $.ajax({
                     url: "/admin/posts",
                     data: {
                         q: {
                             title_cont: key_word
                         },
                         authenticity_token: AUTH_TOKEN
                     },
                     type: 'GET',
                     dataType: 'script',
                 })
             }, 600);
         })