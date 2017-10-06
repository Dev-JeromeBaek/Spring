$(function() {
	
//	[#. 메뉴바  ]
   	gnbInit();
//	[#. 숫자 카운터 ]
   	rollroll();
//  [#. 탑버튼 다운버튼]
   	top_down();
});

//--- [#. 메뉴바  ] ---
function gnbInit() {
    $("#gnb .menu").hover(
        function() { $(this).children(".sub_menu").stop(true,true).slideDown(200);
					$(this).children(".link").addClass("on").stop(true,true);},
        function() { $(this).children(".sub_menu").stop(true,true).slideUp(200);
					$(this).children(".link").removeClass("on").stop(true,true);}
    );
    var lnbInterval = null;
}

//--- [#. 탑버튼 다운버튼  ] ---
function top_down() {
	$("#topImgtopImg").hover(
		function() { $(this).attr("src", "/aaa/resources/img/yeob/bt_top2.png") }, 
		function() { $(this).attr("src", "/aaa/resources/img/yeob/bt_top1.png") }
	);
	$("#downImg").hover(
		function() { $(this).attr("src", "/aaa/resources/img/yeob/bt_down2.png") }, 
		function() { $(this).attr("src", "/aaa/resources/img/yeob/bt_down1.png") }
	);
}

//--- [#. 숫자 카운터  ] ---
function rollroll() {
	$(".counter").rollingCounter({
	    animate : true,
	    attrCount : 'data-count',
// 	    delayTime : 20 ,
	    waitTime : 1 ,
	    easing : 'easeOutBounce',
	    duration : 1000
	});
//	setTimeout("rollroll()", 2000);
}


