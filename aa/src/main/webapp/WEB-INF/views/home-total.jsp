<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="UTF-8"%>
<html>
<head>
	<title>Yoeb's Home</title>
	
	<%-- .js 파일 --%>
	<script type="text/javascript" src="/aa/resources/js/jquery-3.1.1.min.js"></script>
	<script type="text/javascript" src="/aa/resources/js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="/aa/resources/js/jcarousellite_1.0.1.pack.js"></script>
	<script type="text/javascript" src="/aa/resources/js/yeob.js"></script>
	<script type="text/javascript" src="/aa/resources/js/jquery.cycle.all.js"></script>

	<%-- .css 파일 --%>
	<link rel="stylesheet" href="/aa/resources/css/yeob-whole.css" />
	<link rel="stylesheet" href="/aa/resources/css/yeob-top-menu.css" />
	<link rel="stylesheet" href="/aa/resources/css/yeob-list-slide-click.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="/aa/resources/css/yeob-main-slide.css" />
	<link rel="stylesheet" href="/aa/resources/css/yeob-expand-action.css" />
	


	<%-- jquery.ui (.css) --%>
	
	<%-- jquery.ui (.js) --%>
	

</head>
<body>

<div id="top_wrap">
	<div class="bg_top"></div>
	<div class="container">
	<!-- 탑메뉴 -->
		<div class="top_menu">
			<h1><a href="/aa/"><img src="/aa/resources/img/logo3.png" alt=""></a></h1>
			<!-- gnb -->
		<ul id="gnb" class="gnb">
			<li class="menu menu_01">
				<a href="/aa/" class="link">HOME </a>
				
			</li>
			<li class="menu menu_02">
				<a href="" class="link">메뉴 1</a>
				<div class="sub_menu sub_bg2">
					<div>
						<a href="">메뉴 1-1</a>
						<a href="">메뉴 1-2</a>
						<a href="">메뉴 1-3</a>
						<a href="">메뉴 1-4</a>
						<a href="">메뉴 1-5</a>
						<a href="">메뉴 1-6</a>
					</div>
				</div>
			</li>
			<li class="menu menu_03">
				<a href="" class="link">메뉴 2</a>
				<div class="sub_menu sub_bg3">
					<div>
						<a href="">메뉴 2-1</a> 
						<a href="">메뉴 2-2</a> 
						<a href="">메뉴 2-3</a> 
					</div>
				</div>
			</li>

			<li class="menu menu_06">
				<a href="" class="link">메뉴 3</a>
				<div class="sub_menu sub_bg6">
					<div>
						<a href="">메뉴 3-1</a> 
						<a href="">메뉴 3-2</a> 
					</div>
				</div>
			</li>

			<li class="menu menu_05">
				<a href="" class="link">메뉴 4</a>
				<div class="sub_menu sub_bg5">
					<div>
						<a href="">메뉴 4-1</a> 
						<a href="">메뉴 4-2</a>
						<a href="">메뉴 4-3</a>
						<a href="">메뉴 4-4</a>
						<a href="">메뉴 4-5</a>
					</div>
				</div>
			</li>
			
			<li class="menu menu_04">
				<a href="" class="link">메뉴 5</a>
				<div class="sub_menu sub_bg4">
					<div>
						<a href="">메뉴 5-1</a> 
					</div>
				</div>
			</li>
			
		</ul>
		</div>
	</div>
	
	<script type="text/javascript">
			$(function() {
				$(".slider").jCarouselLite({
					speed : 1000,
					timeout : 120000,
// 					auto:true,
					pauseOnPagerHover : true,
					btnNext : ".btn_next",
					btnPrev : ".btn_prev",
					visible : 4
				});
			});
		</script>
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
	
	
</div>
	
	
	
	
	
</body>
</html>
