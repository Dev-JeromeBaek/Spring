<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Insert title here</title>

	<%-- .js 파일 --%>
	<script type="text/javascript" src="/aa/resources/js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="/aa/resources/js/jcarousellite_1.0.1.pack.js"></script>
<!-- 	<script type="text/javascript" src="/aa/resources/js/yeob.js"></script> -->
	<%-- .css 파일 --%>
	<link rel="stylesheet" href="/aa/resources/css/yeob-whole.css" />
	<link rel="stylesheet" href="/aa/resources/css/yeob-list-slide-click.css" type="text/css" media="screen" />
	
	
</head>
<body>
	<div id="top_wrap">
	
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
	
	</div>
</body>
</html>
