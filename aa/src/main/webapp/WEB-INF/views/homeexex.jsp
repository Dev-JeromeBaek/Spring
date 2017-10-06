<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="UTF-8"%>
<html>
<head>
	<title>Yoeb's Home</title>
	
	<%-- .js 파일 --%>
	<script type="text/javascript" src="/aa/resources/js/jquery-3.1.1.min.js"></script>
	<script type="text/javascript" src="/aa/resources/js/yeob.js"></script>

	<%-- .css 파일 --%>
	<link rel="stylesheet" href="/aa/resources/css/yeob-whole.css" />
	<link rel="stylesheet" href="/aa/resources/css/yeob-top-menu.css" />
	
	
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
						<a href="/aa/home-center-slide">메뉴 1-1</a>
						<a href="/aa/home-total">메뉴 1-2</a>
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
</div>
	
	
	
	
	
</body>
</html>
