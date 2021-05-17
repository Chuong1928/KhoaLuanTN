class DialogInfoUser {
    constructor(class_hover = '.show-info-user') {
        this.class_hover = class_hover;
        this.url_get_info = '';
        this.cache_data = {};
        this.flag_create_popup = false;
    }

    init() {
        this.handleHover();
    }

    handleHover() {
        let self = this;
        let current_hover;
        // bind event client hover user name
        $(document).on("mouseenter",self.class_hover, function(){
            current_hover = this
            $(this).css('color', 'blue')
            // check cache data
            // ton tai roi => hien ra
            // chua co thi hien dialog loading
            // get data
            // hien ra
            let current_id = $(this).data().idUser
           // console.log(current_id);
            self.processPopup(this);
            self.hoverEvent(current_id,current_hover);
        } )
        // $(self.class_hover).mouseenter(function() {
        //     $(this).css('color', 'blue')
        //     // check cache data
        //     // ton tai roi => hien ra
        //     // chua co thi hien dialog loading
        //     // get data
        //     // hien ra
        //     let current_id = $(this).data().idUser

        //     self.processPopup(this);
        //     self.hoverEvent(current_id);
        // })


        $('body').mousemove(function(e) {
            //console.log(e)
            if($(e.target).closest(self.class_hover + ', .dialog-user-info').length == 0) {
                self.hidePopup();
            }
            
        })

    }
    processPopup(target) {
        // check popup and show popup
        !this.flag_create_popup && this.createPopup()

        // show popup
        this.progressPosition($(target))
        this.showPopup();
    }

    async hoverEvent(target_id,current_hover) {
        let data;
        // check data cache
        // phai biet id hover
        if(this.cache_data[target_id] === undefined) {
            // hien thi loading animation
            this.popup.html(this.tenmplateLoading());
            // get data
            data = await this.getData(target_id);
            // cache data 
            this.cache_data[data.id] = data;

        }else {
            data = this.cache_data[target_id]
        }
        // xu ly vs thang data
        this.processData(data,current_hover);
        
    }
    progressPosition(target) {
        this.popup.removeClass('on-top on-bottom')
        let window_height = $(window).height();
        let offset = target.offset()
        let offset_viewport_top = target.offset().top - $(window).scrollTop()


        if(window_height/2 > offset_viewport_top) {
            //console.log(offset.top + target.innerHeight() + 10)
            // hien o duoi
            this.popup.css('top', offset.top + target.innerHeight() + 10);
            this.popup.addClass('on-bottom');


        }else {
            //  hien o tren
            this.popup.css('top', offset.top);
            this.popup.addClass('on-top');

        }

        this.popup.css('left', offset.left);

    }
    hidePopup() {
        if(this.popup){
            this.popup.removeClass('active');
        }
       
    }
    showPopup() {
        // hien thi len = cach add class active
        this.popup.addClass('active');
    }

    processData(data,current_hover) {
        let html_data = this.tenmplateUserInfo(data,current_hover);

        this.popup.html(html_data)
    }

    tenmplateUserInfo(data,current_hover) {
        console.log(current_hover);
        let check_login = $(current_hover).attr("data-follower-check")
        if(check_login === "true"){
            console.log(check_login);
            console.log("hủy theo dõi");
            console.log(typeof check_login);
            return (`
            <div >
                <div class="d-flex align-items-center">
                    <div>
                        <img src="${data.default_avatar}" class="avatar">
                    </div>
                    <div class="ml-2">
                        <h5 class="text-left mb-0"><a href="/authors/${data.id}">${data.name}</a></h5>
                        <p class="mb-0">${data.email}</p>
                        <div class="d-flex">
                            <div class="mr-3">
                                <span class="mdi mdi-pencil"></span>
                                <span>${data.posts_count}</span>
                            </div>
                            <div class="mr-3">
                                <span class="mdi mdi-account-multiple-plus"></span>
                                <span>${data.followers_count}</span>
                            </div>
                        </div>
                    </div>
                </div>
                <hr class="my-1"/>
                <div class="d-flex align-items-center justify-content-between py-2">
                    <div>
                        <!--  -->
                    </div>
                    <div>
                    <button class="btn btn-outline-primary btn-sm btn-unfollow" data-user-id = "${data.id}">Hủy theo dõi </button>
                       
                    </div>
                </div>
            </div>
        `)
        }
        if(check_login === "false"){
            console.log("theo dõi");
            console.log(typeof check_login);
            return (`
            <div >
                <div class="d-flex align-items-center">
                    <div>
                        <img src="${data.default_avatar}" class="avatar">
                    </div>
                    <div class="ml-2">
                        <h5 class="text-left mb-0"><a href="/authors/${data.id}">${data.name}</a></h5>
                        <p class="mb-0">${data.email}</p>
                        <div class="d-flex">
                            <div class="mr-3">
                                <span class="mdi mdi-pencil"></span>
                                <span>${data.posts_count}</span>
                            </div>
                            <div class="mr-3">
                                <span class="mdi mdi-account-multiple-plus"></span>
                                <span>${data.followers_count}</span>
                            </div>
                        </div>
                    </div>
                </div>
                <hr class="my-1"/>
                <div class="d-flex align-items-center justify-content-between py-2">
                    <div>
                        <!--  -->
                    </div>
                    <div>
                    <button class="btn btn-outline-primary btn-sm btn-follow" data-user-id = "${data.id}">Theo dõi</button>
                    </div>
                </div>
            </div>
        `)
        }
       
    }

    getData(id) {
        return $.ajax({
            url: '/authors/' + id,
            dataType: 'json',
            type: 'GET'
        })

    }
    createPopup() {
        this.flag_create_popup = true;

        this.popup = $(this.templatePopup())
        // tao popup
        $('body').append(this.popup);
    }

    tenmplateLoading() {
        return (`
            <i class="mdi mdi-spin mdi-loading"></i>
        `)
    }

    templatePopup() {
        return (`
            <div class="dialog-user-info">
                
            </div>
        `)
    }
}

$(function() {
    new DialogInfoUser().init()
})