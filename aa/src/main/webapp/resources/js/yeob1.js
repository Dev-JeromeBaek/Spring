/**
 * 빽사장님 모듈입니다!
 */
//	[#.01 메뉴바  ]
// --- [#.01 메뉴바  ] ---
$(function() {

   	gnbInit();
	pageInit();
	page_popInit();
//	[#.01 메인화면 슬라이드  ]
	mainslideInit();
	customStytleInit();

});

// --- [#.02 메인화면 슬라이드 ] ---
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
// --- [#.03 ] ---
// --- [#.04 ] ---
// --- [#.05 ] ---
// --- [#.06 ] ---
// --- [#.07 ] ---
// --- [#.08 ] ---
// --- [#.09 ] ---
// --- [#.10 ] ---
// --- [#.11 ] ---
// --- [#.12 ] ---
// --- [#.13 ] ---
// --- [#.14 ] ---
// --- [#.15 ] ---
// --- [#.16 ] ---
// --- [#.17 ] ---
// --- [#.18 ] ---
// --- [#.19 ] ---
// --- [#.20 ] ---



















