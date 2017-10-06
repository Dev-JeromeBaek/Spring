$(function() {

   	gnbInit();
	pageInit();
	page_popInit();
	mainslideInit();
	customStytleInit();

});

function gnbInit() {
    $("#gnb .menu").hover(
        function() { $(this).children(".sub_menu").stop(true,true).slideDown(200);
					$(this).children(".link").addClass("on").stop(true,true);},
        function() { $(this).children(".sub_menu").stop(true,true).slideUp(200);
					$(this).children(".link").removeClass("on").stop(true,true);}
    );
    
    var lnbInterval = null;
 
}



function pageInit() {
   $(".intro_info .m_sb_1").live("mouseover", function(){
	   $('.img_in1 img').addClass("on").stop(true,true).animate({
	  width:460,
	  height:300,
	  left:-60,
		top:-60
	},1000);
	    return false;
});

  $(".intro_info .m_sb_1").live("mouseout", function(){
	  $('.img_in1 img').removeClass("on").stop(true,true).animate({
	  width:400,
	  height:240,
		  left:0,
		top:0
	},900);
	    return false;
});
    $(".intro_info .m_sb_2").live("mouseover", function(){
	   $('.img_in2 img').addClass("on").stop(true,true).animate({
	  width:460,
	  height:300,
		  left:-60,
		top:-60
	},1000);
	    return false;
});

  $(".intro_info .m_sb_2").live("mouseout", function(){
	  $('.img_in2 img').removeClass("on").stop(true,true).animate({
	  width:400,
	  height:240,
		    left:0,
		top:0
	},900);
	    return false;
});

   $(".intro_info .m_sb_3").live("mouseover", function(){
	   $('.img_in3 img').addClass("on").stop(true,true).animate({
	  width:460,
	  height:300,
		  left:-60,
		top:-60
	},1000);
	    return false;
});

  $(".intro_info .m_sb_3").live("mouseout", function(){
	  $('.img_in3 img').removeClass("on").stop(true,true).animate({
	  width:400,
	  height:240,
		     left:0,
		top:0
	},900);
	    return false;
});



	//아코디언메뉴
	 			// Store Variables
				var accordion_tab = $('.faqBox dt'),
				accordion_content = $('.faqBox dd');

			// When the tab is clicked function
			accordion_tab.on('click', function(e){

				// Disable tab links
				e.preventDefault();

				// Remove the active class
				accordion_tab.removeClass('on');

				// Hide the content
				accordion_content.slideUp(100);

				// If tab is hidden open it and add the active class
				if($(this).next().is(':hidden') == true) {

					$(this).addClass('on');

					$(this).next().slideDown(100);
				 }   
			 });
	  //탭메뉴 설정
    $(".content_tabmenu > .tab").on("click",function() {
        if(!$(this).hasClass("on")) {
            var prevTab = $(this).parent().children(".on").removeClass("on");
            
            var getSlide = prevTab.eq(0).data("slide");
            if(getSlide != undefined && getSlide.length > 0) getSlide.cycle("pause");
            var nextSlide = $(this).data("slide");
            if(nextSlide != undefined && nextSlide.length > 0) nextSlide.cycle("resume");

            var index = $(this).addClass("on").closest(".content_tabmenu").children(".tab").index(this);
            $(this).parent().children(".panel").hide().eq(index).show();
        }
        return false;
    });

	  slideInit($(".gallimg_slide"));

 }


function slideInit(target) {
     $(target).each(function(i) {
        var slideOpt = {
            speed:500,
            //timeout:5000,
			timeout:15000,
            pause:true,
            pauseOnPagerHover:true,
            prev:$(this).children(".prev_bt"),
            next:$(this).children(".next_bt")
        }
        if($(this).hasClass("thumb_slide")) {
            var slideThumb = $(this).parent().children(".small_siide");
            slideOpt.pager = slideThumb;
            //slideOpt.pagerEvent:"hover"
            slideOpt.pagerAnchorBuilder = function(idx, slide) {
                return slideThumb.children().eq(idx);
            }
        }
        else if($(this).hasClass("slide_wrap")) {
            slideOpt.fx = "scrollHorz";
        }
        var slide = $(this).children("ul").cycle(slideOpt);
        
        if($(this).closest("dd.panel").length > 0) {
            if(!$(this).closest("dd.panel").hasClass("on")) slide.cycle("pause");
            $(this).closest("dd.panel").prev("dt.tab").data("slide",slide);
        }
    });
}

 function mainslideInit() {
    $(".main_slide .gallimg_slide").each(function(i) {
        var slideOpt = {
            speed:500,
            timeout:4000,
            pause:true,
            pauseOnPagerHover:true,
            prev:$(this).children(".prev_bt"),
            next:$(this).children(".next_bt")
        }
        if($(this).hasClass("thumb_slide")) {
            var slideThumb = $(this).parent().children(".small_siide");
            slideOpt.pager = slideThumb;
            //slideOpt.pagerEvent:"hover"
            slideOpt.pagerAnchorBuilder = function(idx, slide) {
                return slideThumb.children().eq(idx);
            }
        }
        else if($(this).hasClass("slide_wrap")) {
            slideOpt.fx = "scrollHorz";
        }
        var slide = $(this).children("ul").cycle(slideOpt);
        
        if($(this).closest("dd.panel").length > 0) {
            if(!$(this).closest("dd.panel").hasClass("on")) slide.cycle("pause");
            $(this).closest("dd.panel").prev("dt.tab").data("slide",slide);
        }
    });
}
 /*팝업창 제어*/
 function page_popInit(){
    //팝업 닫기
    $(".popup .btn_close").on("click",function() {
        $(this).closest(".popup").stop(true,true).fadeOut(200);
        return false;
    });
	
    //alert 팝업
    $(".alert_popup .btn_close, .alert_popup .btn_confirm").on("click",function() {
        $("#alert_mask").stop(true,true).animate({ opacity:0},200,function() {
            $(this).hide();
        });
        $(".alert_popup:visible").stop(true,true).fadeOut(200);
        return false;
    });
  
}


 function alert_show(target) {
    $("#alert_mask").css("opacity",0).show().stop(true,true).animate({ opacity:0.8},200);
    $(".alert_popup." + target).stop(true,true).fadeIn(200).find(".input").val("");

}

function alert_show_pwd(target,no) {
	$("#b_no_pwd").val(no);
    $("#alert_mask").css("opacity",0).show().stop(true,true).animate({ opacity:0.8},200);
    $(".alert_popup." + target).stop(true,true).fadeIn(200).find(".input").val("");
}

function roomchange(id){
	var url = "/common/roomtype.php";
	
	$.ajax({
		type: "POST",
		url: url,
		data:{
			"id":id
		},
		error:function(data,error) {
			//alert(error);
		},
		success: function(data) {
			$("#r_adult").html(data);
			$("#adult_value .value").text('Adult');
			roomchange1(id);
		}
	});
	
}
function roomchange1(id){
	var url = "/common/roomtype1.php";
	
	$.ajax({
		type: "POST",
		url: url,
		data:{
			"id":id
		},
		error:function(data,error) {
			//alert(error);
		},
		success: function(data) {
			$("#r_child").html(data);
			$("#child_value .value").text('Children');
		}
	});
	
}

function roomchange_h(id){
	var url = "/common/roomtype.php";
	
	$.ajax({
		type: "POST",
		url: url,
		data:{
			"id":id
		},
		error:function(data,error) {
			//alert(error);
		},
		success: function(data) {
			$("#adult").html(data);
			roomchange_h1(id);
		}
	});
	
}
function roomchange_h1(id){
	var url = "/common/roomtype1.php";
	
	$.ajax({
		type: "POST",
		url: url,
		data:{
			"id":id
		},
		error:function(data,error) {
			//alert(error);
		},
		success: function(data) {
			$("#child").html(data);
		}
	});
	
}


function go_reservation(){
	document.location.href="/reservation/reservation.php?rooms="+$("#b_rooms option:selected").val()+"&adult="+$("#adult option:selected").val()+"&child="+$("#child option:selected").val()+"&check_in="+$("#check_in_id").val()+"&check_out="+$("#check_out_id").val();
}

function go_reservation1(rooms){
	document.location.href="/reservation/reservation.php?rooms="+rooms+"&b_type="+$("#b_type1 option:selected").val();
}
	 
function customStytleInit() {
    $(".selectbox").each(function() {
        $(this).wrap("<div class='selectbox_wrap'></div>").parent().append("<span class='value'>" + $(this).find("option:selected").text() + "</span>");
        var value = $(this).parent().children(".value");
        if($(this).hasClass("droplist")) {
            var dropList = [];
            var getPlace = $(this).attr("placeholder") == undefined ? "" : $(this).attr("placeholder");
            $(this).find("option").each(function() {
                if($(this).text() != getPlace) dropList.push("<a href='#'>" + $(this).text() + "</a>");
            });
            $(this).parent().addClass("dropdown").append("<div class='list'>" + dropList.join("") + "</div>");
            value.on("click",function() {
                if($(this).parent().hasClass("on")) {
                    $(this).parent().removeClass("on").children(".list").stop(true,true).slideUp(100);
                }
                else {
                    $(this).parent().addClass("on").children(".list").stop(true,true).slideDown(100);
                }
            });
            $(this).parent().find(".list a").on("click",function() {
                var getSelect = $(this).closest(".selectbox_wrap");
                var getValue = $(this).text();
                getSelect.removeClass("on").children(".list").stop(true,true).slideUp(100);
                getSelect.find("select option").each(function() {
                    if($(this).text() == getValue) {
                        $(this).prop("selected",true);
                        return false;
                    }
                });
                value.html(getValue);
                return false;
            });
        }
        else {
            $(this).on("change",function() {
                value.html($(this).find("option:selected").text());
                if($(this).hasClass("move")) {
                    window.open(this.value, "_blank");
                }
            });
        }
    });
    

}