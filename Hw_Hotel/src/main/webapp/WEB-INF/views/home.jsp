<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" pageEncoding="UTF-8"%>
<html>
<!-- <html lang="en"> -->
<head>
<meta charset="utf-8">
<meta name="naver-site-verification"
	content="0f0b62b00a1ecfa266557bb4895c80415611c721" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<!-- <meta name="description" content="대전 유성구 봉명동 위치, 비즈니스호텔, 각종 단체행사, 연회, 세미나 가능, "> -->
<!-- <meta property="og:type" content="website"> -->
<!-- <meta property="og:title" content="대전 유성 나무호텔"> -->
<!-- <meta property="og:description" content="대전 유성구 봉명동 위치, 비즈니스호텔, 각종 단체행사, 연회, 세미나 가능, "> -->
<!-- <meta property="og:image" content="http://www.namoohotel.kr/img/inc/logo.gif"> -->
<!-- <meta property="og:url" content="http://www.namoohotel.kr"> -->

<title>대전 유성 나무호텔</title>

<script type="text/javascript" src="/hotel/resources/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="/hotel/resources/js/jquery.placeholder.enhanced-1.5.js"></script>
<script type="text/javascript" src="/hotel/resources/js/jquery.cycle.all.js"></script>
<script type="text/javascript" src="/hotel/resources/js/common.js"></script>
<script type="text/javascript" src="/hotel/resources/js/lnb_menu.js"></script>
<link rel="canonical" href="http://www.namoohotel.kr">
<link rel="stylesheet" href="/hotel/resources/css/selectbox.css" /> 
<link rel="stylesheet" href="/hotel/resources/css/base.css" />
<link rel="stylesheet" href="/hotel/resources/css/layout.css" />
<link rel="stylesheet" href="/hotel/resources/js/datepicker/themes/base/jquery.ui.all.css" />
<script type="text/javascript" src="/hotel/resources/js/datepicker/ui/jquery.ui.core.min.js"></script>
<script type="text/javascript" src="/hotel/resources/js/datepicker/ui/jquery.ui.datepicker.min.js"></script>
<script type="text/javascript" src="/hotel/resources/js/datepicker/ui/jquery-ui.custom.min.js"></script>
<script src="/hotel/resources/js/lightbox.js"></script>
<link rel="stylesheet" href="/hotel/resources/css/lightbox.css">

<!--[if IE 7]>
<link rel="stylesheet" type="text/css" href="../css/ie7.css">
<![endif]-->

</head>
<body>

	<div id="top_wrap">
		<%-- ================================================================================= --%>
	<div class="bg_top"></div>
	<div class="container">
	<!-- 탑메뉴 -->
		<div class="top_menu">
			<h1><a href="/hotel/"><img src="/hotel/resources/imges/logo.gif" alt=""></a></h1>
			<!-- gnb -->
		<ul id="gnb" class="gnb">
			<li class="menu menu_01">
				<a href="/hotel/" class="link">HOME </a>
				
			</li>
			<li class="menu menu_02">
				<a href="../hotel/introduction.php" class="link">메뉴 1</a>
				<div class="sub_menu sub_bg2">
					<div>
						<a href="../hotel/introduction.php">메뉴 1-1</a>
						<a href="../hotel/concept.php">메뉴 1-2</a>
						<a href="../hotel/service.php">메뉴 1-3</a>
						<a href="../hotel/local_guide.php">메뉴 1-4</a>
						<a href="../hotel/gallery.php">메뉴 1-5</a>
						<a href="../hotel/location.php">메뉴 1-6</a>
					</div>
				</div>
			</li>
			<li class="menu menu_03">
				<a href="../rooms/standard1.php" class="link">메뉴 2</a>
				<div class="sub_menu sub_bg3">
					<div>
						<a href="../rooms/standard1.php">메뉴 2-1</a> 
						<a href="../rooms/premium1.php">메뉴 2-2</a> 
						<a href="../rooms/suite1.php">메뉴 2-3</a> 
					</div>
				</div>
			</li>

			<li class="menu menu_06">
				<a href="../facilities/facilities1.php" class="link">메뉴 3</a>
				<div class="sub_menu sub_bg6">
					<div>
						<a href="../facilities/facilities1.php">메뉴 3-1</a> 
						<a href="../facilities/facilities2.php">메뉴 3-2</a> 
					</div>
				</div>
			</li>

			<li class="menu menu_05">
				<a href="../community/news.php" class="link">메뉴 4</a>
				<div class="sub_menu sub_bg5">
					<div>
						<a href="../community/news.php">메뉴 4-1</a> 
						<a href="../community/event.php">메뉴 4-2</a>
						<a href="../community/promotion.php">메뉴 4-3</a>
						<a href="../community/gallery.php">메뉴 4-4</a>
						<a href="../community/contact.php">메뉴 4-5</a>
					</div>
				</div>
			</li>
			
			<li class="menu menu_04">
				<a href="../reservation/reservation.php" class="link">메뉴 5</a>
				<div class="sub_menu sub_bg4">
					<div>
						<a href="../reservation/reservation.php">메뉴 5-1</a> 
					</div>
				</div>
			</li>


			
		</ul>
		<!-- //gnb -->
		</div>
	</div>

		<%-- ================================================================================= --%>
		<!-- 메인비주얼 -->
		<div class="main_slide main_img">

			<div class="gallrey_slide">
				<div class="gallimg_slide thumb_slide">
					<ul>
						<li class="bg1"></li>
						<li class="bg2"></li>
						<li class="bg3"></li>
						<li class="bg4"></li>
						<li class="bg5"></li>
					</ul>
				</div>
			</div>
			<!-- <ul>
		 <li class="bg1"></li>
		 </ul> -->
		</div>
		<script type="text/javascript"
			src="/hotel/resources/js/jcarousellite_1.0.1.pack.js"></script>


		<link rel="stylesheet" href="/hotel/resources/css/slider.css"
			type="text/css" media="screen" />
		<script type="text/javascript">
			$(function() {
				$(".slider").jCarouselLite({
					speed : 1800,
					timeout : 100000,
					//auto:true,
					pauseOnPagerHover : true,
					btnNext : ".btn_next",
					btnPrev : ".btn_prev",
					visible : 4
				});
			});
		</script>
<script>
	function setCookie( name, value, expiredays ) { 
		var todayDate = new Date(); 
		todayDate.setDate( todayDate.getDate() + expiredays ); 
		document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";" 
	} 
	function closeWin(name) { 
		//document.getElementById(name).style.display = "none";
		$('#'+name).hide();
	}
	function todaycloseWin(name,id) { 
		var chkbox = "chkbox" + id;
		var ncookie = "ncookie_" + name;
		if ( document.getElementById(chkbox).checked ){ 
			setCookie( ncookie, "done" , 24 ); 
		}
		//document.getElementById(name).style.display = "none";
		$('#'+name).hide();
	}
	
	cookiedata = document.cookie; 

$(document).ready(function(){
	var pop = "#pop2";
	//alert(cookiedata.indexOf("ncookie_pop2=done"));
	if ( cookiedata.indexOf("ncookie_pop2=done") < 0 ){ 
		$(pop).show();
	} else {
		$(pop).hide();
	}
	var pop = "#pop6";
	//alert(cookiedata.indexOf("ncookie_pop6=done"));
	if ( cookiedata.indexOf("ncookie_pop6=done") < 0 ){ 
		$(pop).show();
	} else {
		$(pop).hide();
	}
		});

</script>
<div id="pop2" class="layerpopup" style="position:absolute;left:10px;top:250px;width:400px;z-index:100000000000000">
	<div class="popup" style="background:#ffffff"><a href="http://www.namoohotel.kr/community/event.php?mode=VIEW_FORM&amp;b_no=4&amp;&amp;b_class=2&amp;b_category=" target="_blank"></a><img width="400" height="450" title="1457740382_11139569.jpg" src="http://www.namoohotel.kr/pds/editor/201603/1457740382_11139569.jpg"><br></div>	

 <div class="close" style="position:relative;font-size:13px;background:#999;padding:10px 10px 10px 35px;">
  <form name="pop_form2">
  <div id="check"><input type="checkbox" name="chkbox" id="chkbox2" value="checkbox" onclick="todaycloseWin('pop2','2');" style="position:absolute;left:20px;top:13px;">&nbsp;<span>오늘 하루동안 보지 않기</span>&nbsp;</div>
  <div id="close" style="position:absolute;right:20px;top:10px;"><a href="#" onclick="closeWin('pop2');" style="color:#111">CLOSE</a></div>
  </form>
 </div>
</div> 
<div id="pop6" class="layerpopup" style="position:absolute;left:10px;top:750px;width:400px;z-index:100000000000000">
	<div class="popup" style="background:#ffffff"><img width="400" height="566" title="1487920600_81892912.gif" src="http://www.namoohotel.kr/pds/editor/201702/1487920600_81892912.gif"><br style="clear: both;"></div>	

 <div class="close" style="position:relative;font-size:13px;background:#999;padding:10px 10px 10px 35px;">
  <form name="pop_form6">
  <div id="check"><input type="checkbox" name="chkbox" id="chkbox6" value="checkbox" onclick="todaycloseWin('pop6','6');" style="position:absolute;left:20px;top:13px;">&nbsp;<span>오늘 하루동안 보지 않기</span>&nbsp;</div>
  <div id="close" style="position:absolute;right:20px;top:10px;"><a href="#" onclick="closeWin('pop6');" style="color:#111">CLOSE</a></div>
  </form>
 </div>
</div> 
		<div id="contents_wrap" class="main_contets">

			<div class="intro_info">
				<ul>
					<li class="m_sb m_sb_1"
						onclick="location.href='hotel/introduction.php'">
						<div class="img_n_3 img_in1">
							<img src="/hotel/resources/imges/main_s1.jpg">
						</div>
						<dl>
							<dt>INTRODUCTION</dt>
							<dd>
								나무 호텔은 고객의 눈을 즐겁게 만드는 다양한 디자인적 요소와<br>라이프스타일을 반영한 서비스를 통해
								고객에게 한 걸음 더 다가갑니다.
							</dd>
						</dl>
					</li>
					<li class="m_sb m_sb_2"
						onclick="location.href='rooms/standard1.php'">
						<div class="img_n_3 img_in2">
							<img src="/hotel/resources/imges/main_s2.jpg">
						</div>
						<dl>
							<dt>ROOMS</dt>
							<dd>
								모던하고 우아한 스타일로 설계된 나무 호텔의 차별성을 가진<br>각각의 객실들은 고객들에게 보다 다양한
								선택적 경험을 제공합니다.
							</dd>
						</dl>
					</li>
					<li class="m_sb m_sb_3"
						onclick="location.href='facilities/facilities1.php'">
						<div class="img_n_3 img_in3">
							<img src="/hotel/resources/imges/main_s3.jpg">
						</div>
						<dl>
							<dt>FACILITIES</dt>
							<dd>
								나무 호텔은 고객의 여러 욕구를 충족할 수 있는 세련되고<br>정갈한 분위기의 부대 시설을 통한 특별한
								서비스를 제공합니다.
							</dd>
						</dl>
					</li>
				</ul>
			</div>
		</div>
		<div class="m_rooms_list">
			<h3>NAMOO HOTEL ROOMS</h3>
			<div id="list">
				<div class="btn_slide btn_title">View All Rooms</div>
				<div class="btn_slide btn_prev">←</div>
				<div class="btn_slide btn_next">→</div>
				<div class="slider">
					<ul>
						<li>

							<p class="s_img_list">
								<img src="/hotel/resources/imges/rooms_1.jpg" alt="">
							</p>
							<div class="red_b_wrap"
								onclick="location.href='rooms/standard1.php'">
								<p class="red_bg"></p>
								<div class="red_txt">
									<div class="red_txt_box">
										<p>STANDARD DOUBLE A</p>
										<p>
											<span>\100,000</span><span> / day</span>
										</p>
									</div>
								</div>
							</div>

						</li>

						<li>

							<p class="s_img_list">
								<img src="/hotel/resources/imges/rooms_2.jpg" alt="">
							</p>
							<div class="red_b_wrap"
								onclick="location.href='rooms/standard2.php'">
								<p class="red_bg"></p>
								<div class="red_txt">
									<div class="red_txt_box">
										<p>STANDARD DOUBLE B</p>
										<p>
											<span>\100,000</span><span> / day</span>
										</p>
									</div>
								</div>
							</div>

						</li>

						<li>

							<p class="s_img_list">
								<img src="/hotel/resources/imges/rooms_3.jpg" alt="">
							</p>
							<div class="red_b_wrap"
								onclick="location.href='rooms/standard3.php'">
								<p class="red_bg"></p>
								<div class="red_txt">
									<div class="red_txt_box">
										<p>STANDARD DOUBLE C</p>
										<p>
											<span>\100,000</span><span> / day</span>
										</p>
									</div>
								</div>
							</div>

						</li>

						<li>

							<p class="s_img_list">
								<img src="/hotel/resources/imges/rooms_4.jpg" alt="">
							</p>
							<div class="red_b_wrap"
								onclick="location.href='rooms/premium1.php'">
								<p class="red_bg"></p>
								<div class="red_txt">
									<div class="red_txt_box">
										<p>STANDARD TWIN A</p>
										<p>
											<span>\100,000</span><span> / day</span>
										</p>
									</div>
								</div>
							</div>

						</li>


						<li>

							<p class="s_img_list">
								<img src="/hotel/resources/imges/rooms_5.jpg" alt="">
							</p>
							<div class="red_b_wrap"
								onclick="location.href='rooms/premium2.php'">
								<p class="red_bg"></p>
								<div class="red_txt">
									<div class="red_txt_box">
										<p>STANDARD TWIN B</p>
										<p>
											<span>\100,000</span><span> / day</span>
										</p>
									</div>
								</div>
							</div>

						</li>

						<li>
							<p class="s_img_list">
								<img src="/hotel/resources/imges/rooms_6.jpg" alt="">
							</p>
							<div class="red_b_wrap"
								onclick="location.href='rooms/premium3.php'">
								<p class="red_bg"></p>
								<div class="red_txt">
									<div class="red_txt_box">
										<p>STANDARD TWIN C</p>
										<p>
											<span>\100,000</span><span> / day</span>
										</p>
									</div>
								</div>
							</div>

						</li>

						<li>

							<p class="s_img_list">
								<img src="/hotel/resources/imges/rooms_7.jpg" alt="">
							</p>
							<div class="red_b_wrap"
								onclick="location.href='rooms/premium4.php'">
								<p class="red_bg"></p>
								<div class="red_txt">
									<div class="red_txt_box">
										<p>STANDARD TWIN D</p>
										<p>
											<span>\100,000</span><span> / day</span>
										</p>
									</div>
								</div>
							</div>

						</li>

						<li>

							<p class="s_img_list">
								<img src="/hotel/resources/imges/rooms_8.jpg" alt="">
							</p>
							<div class="red_b_wrap"
								onclick="location.href='rooms/suite1.php'">
								<p class="red_bg"></p>
								<div class="red_txt">
									<div class="red_txt_box">
										<p>KOREAN</p>
										<p>
											<span>\100,000</span><span> / day</span>
										</p>
									</div>
								</div>
							</div>

						</li>
					</ul>
				</div>
			</div>
		</div>

		<div class="pro_event_wrap">
			<div class="pro_event">
				<!-- m_promotion -->
				<div class="m_promotion">
					<h4><span>PROMOTION</span><span onclick="javascript:document.location.href='/community/promotion.php';" style="cursor:pointer"><a hef="/community/promotion.php">+ view all</a></span></h4>
					 <div class="f_clear"></div>
					<ul class="promotion_list">
						<li onclick="javascript:document.location.href='/community/promotion.php?mode=VIEW_FORM&b_no=23';" style="cursor:pointer">
							<p><img src="/common/phpThumb/phpThumb.php?src=/pds/editor/201702/1486708983_44265928.jpg&w=270&h=203&iar=1&zc=1" alt=""></p>
							<dl>
								<dt>2017년 2월 호텔행사</dt>
								<dd>2017-01-31</dd>
							</dl>
						</li>
						<li onclick="javascript:document.location.href='/community/promotion.php?mode=VIEW_FORM&b_no=22';" style="cursor:pointer">
							<p><img src="/common/phpThumb/phpThumb.php?src=/img/ev.jpg&w=270&h=203&iar=1&zc=1" alt=""></p>
							<dl>
								<dt>2017년 1월 호텔행사</dt>
								<dd>2017-01-04</dd>
							</dl>
						</li>
						<li onclick="javascript:document.location.href='/community/promotion.php?mode=VIEW_FORM&b_no=21';" style="cursor:pointer">
							<p><img src="/common/phpThumb/phpThumb.php?src=/pds/editor/201612/1480814662_37195213.jpg&w=270&h=203&iar=1&zc=1" alt=""></p>
							<dl>
								<dt>2016년 12월 호텔행사</dt>
								<dd>2016-11-26</dd>
							</dl>
						</li>
					</ul>
				</div>
				<!-- m_event -->
				<div class="m_event"> -->
					<h4><span>EVENT</span><span onclick="javascript:document.location.href='/community/event.php';" style="cursor:pointer"><a href="/community/event.php">+ view all</a></span></h4>
					<div class="f_clear event_img" onclick="javascript:document.location.href='/community/event.php?mode=VIEW_FORM&b_no=25';" style="cursor:pointer">
						<img src="/common/phpThumb/phpThumb.php?src=/pds/editor/201702/1487920239_49628265.gif&w=340&h=255&iar=1&zc=1" alt=""style="margin-top:20px;">
						 <p class="white_bg"></p>
						 <p class="event_txt">
							<span>인스타그램 친구소환 이벤트</span>
							<span>2017-02-24</span>
						 </p>
					</div>
				</div>
			</div>
		</div>
		<div class="f_clear"></div>


		<script>
			$(function() {
				$("#check_in_id").datepicker({
					showOn : "both", // 버튼과 텍스트 필드 모두 캘린더를 보여준다.
					buttonImage : "/img/inc/dote1.gif", // 버튼 이미지
					buttonImageOnly : true, // 버튼에 있는 이미지만 표시한다.
					changeMonth : true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
					changeYear : true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
					minDate : '0y', // 현재날짜로부터 100년이전까지 년을 표시한다.
					nextText : '다음 달', // next 아이콘의 툴팁.
					prevText : '이전 달', // prev 아이콘의 툴팁.
					dateFormat : "yy-mm-dd", // 텍스트 필드에 입력되는 날짜 형식.
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ], // 요일의 한글 형식.
					monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ], // 월의 한글 형식.
					yearRange : 'c-100:c+10' // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가.
				});
		
			});
		</script>
		<script>
			$(function() {
				$("#check_out_id").datepicker({
					showOn : "both", // 버튼과 텍스트 필드 모두 캘린더를 보여준다.
					buttonImage : "/img/inc/dote1.gif", // 버튼 이미지
					buttonImageOnly : true, // 버튼에 있는 이미지만 표시한다.
					changeMonth : true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
					changeYear : true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
					minDate : '0y', // 현재날짜로부터 100년이전까지 년을 표시한다.
					nextText : '다음 달', // next 아이콘의 툴팁.
					prevText : '이전 달', // prev 아이콘의 툴팁.
					dateFormat : "yy-mm-dd", // 텍스트 필드에 입력되는 날짜 형식.
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ], // 요일의 한글 형식.
					monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ], // 월의 한글 형식.
					yearRange : 'c-100:c+10' // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가.
				});
		
			});
		</script>


		<!-- 예약 -->
		<div class="booking_wrap">
			<div class="container">

				<!-- 예약품 -->
				<div class="reservation_wrap">
					<ul class="reser_top_booking">
						<li style="padding-right: 10px; cursor: pointer;"><input
							type="text" id="check_in_id" class="check_in"
							style="width: 176px; color: #fff; font-size: 12px; cursor: pointer;"
							placeholder="Check - In"> <!-- <a href="#"><img src="../img/inc/dote1.gif" class="check_in_bt"></a></li> -->
						<li style="padding-right: 10px; cursor: pointer;"><input
							type="text" id="check_out_id" class="check_out"
							style="width: 176px; color: #fff; font-size: 12px; cursor: pointer;"
							placeholder="Check - OUT"> <!-- <a href="#"><img src="../img/inc/dote1.gif" class="check_out_bt"></a></li> -->
						<li class="reser_rooms"><select id="b_rooms"
							class="selectbox" onchange="roomchange_h(this.value);">
								<option value="0">Room Type</option>
								<option value="Standard Double A">Standard Double A</option>
								<option value="Standard Double B">Standard Double B</option>
								<option value="Standard Double C">Standard Double C</option>
								<option value="Standard Twin A">Standard Twin A</option>
								<option value="Standard Twin B">Standard Twin B</option>
								<option value="Standard Twin C">Standard Twin C</option>
								<option value="Standard Twin D">Standard Twin D</option>
								<option value="Korean Room">Korean Room</option>
						</select></li>
						<li style="padding-right: 10px; cursor: pointer;"><select
							class="selectbox" id="adult">
								<option value="" selected>Adult</option>
						</select>
						<li style="padding-right: 10px;"><select class="selectbox"
							id="child">
								<option selected>Children</option>
						</select><span class="value" id="b_type_txt"></span></li>
						<li class="t_right">
							<button type="button" class="reser_bt"
								onclick="go_reservation();"></button>
							<!-- <input type="button" class="reser_bt" value=""> -->
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="f_clear"></div>

	<div id="footer_wrap">
		<!-- 1단 -->
		<div class="container">
			<ul class="footer_board">
				<!-- 주소 -->
				<li class="f_list">

					<h3>INFORMATION</h3>
					<ul class="copy_right_bg">
						<li><img src="hotel/resources/imges/footer_text3.jpg"></li>
						<!--<li>대표 : 박재희</li>
						<li>사업자번호 : 314-86-31916   </li>
						<li>통신판매업 신고번호 : 제 2015-대전유성-0491호</li>
						<li>대전광역시 유성구 온천서로 30-6</li>
						<li>Tel : (042) 822 3445   |   Fax : (042) 823 3989</li>
						<li>E-Mail : namooys@naver.com</li>-->
					</ul>

				</li>

				<!-- 서비스 -->
				<li class="f_list service_copy">
					<h3>SERVICES</h3>
					<ul class="service_icon">
						<li class="icon_1"></li>
						<li class="icon_2"></li>
						<li class="icon_3"></li>
						<li class="icon_4"></li>
					</ul>
				</li>

				<!-- 패밀리사이트 -->
				<li class="f_list">
					<h3>FAMILY SITE</h3>
					<ul class="family_list">
						<li><a href="http://www.namoohotel.com/main.php"
							target="_blank">베니키아 청주 나무호텔</a></li>
						<li><a href="http://www.namoohotel.co.kr/main.php"
							target="_blank">충북 혁신도시 나무호텔</a></li>
						<!-- <li><a href="">대전 유성 나무호텔</a></li> -->
					</ul>
				</li>

				<!-- 뉴스 -->
				<li class="f_list news_copy">
					<h3>NEWS</h3>
					<ul class="news_list_text">
						<li><a href="/community/news.php?mode=VIEW_FORM&b_no=17"><span>나무호텔
									박재출 대표님 충북도 배드민턴 협회 초대...</span><span>2016-08-29</span></a></li>
						<li><a href="/community/news.php?mode=VIEW_FORM&b_no=13"><span>대전
									어린이날 행사 안내</span><span>2016-05-05</span></a></li>
						<li><a href="/community/news.php?mode=VIEW_FORM&b_no=12"><span>2016년
									5월 대전 공연, 전시 행사 및 축제 안내</span><span>2016-05-05</span></a></li>
						<li><a href="/community/news.php?mode=VIEW_FORM&b_no=1"><span>대전
									나무호텔 홈페이지 GRAND OPEN !!</span><span>2015-12-15</span></a></li>
					</ul>
				</li>
				<ul>
		</div>
	</div>
	<!-- 2단 -->
	<div class="footer_bg">
		<div class="container">
			<address>본 웹사이트는 게시된 이메일 주소가 전자우편 수집 프로그램이나 그 밖의 기술적 장치를
				이용하여 무단 수집되는 것을 거부합니다.</address>
			<address>Copyright ⓒ 2015. NAMOO HOTEL all rights reserved.</address>
			<ul class="right_menu">
				<li><a href="#">TOP</a></li>
			</ul>
		</div>

	</div>

</body>
</html>

