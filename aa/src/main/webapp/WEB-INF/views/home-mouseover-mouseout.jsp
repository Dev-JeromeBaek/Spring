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
	<script type="text/javascript" src="/aa/resources/js/yeob.js"></script>

	<%-- .css 파일 --%>
	<link rel="stylesheet" href="/aa/resources/css/yeob-whole.css" />
	<link rel="stylesheet" href="/aa/resources/css/yeob-expand-action.css" />
	
	
</head>
<body>
	<div id="top_wrap">
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
	</div>
</body>
</html>
