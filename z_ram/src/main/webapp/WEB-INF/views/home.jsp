<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
	<style type="text/css">
	a:link {
		text-decoration: none;
		color: #24A048;
	}
	a:hover {
	 	text-decoration: none; 
	 	font-size: xx-large;
		font-family: "배달의민족 주아";
	 	color: #24A048;
	}
	a:visited {
		text-decoration: none;
		color: #24A048;
	}
	a:active {
		font-size: xx-large;
		font-family: "Rix토이그레이";
		color: #DF171E;
	}
	</style>
	<script type="text/javascript">
		var msg = "${msg}";
		if(msg != "") {
			alert(msg);
		}
	</script>
</head>
<body>
	<div style="width: 100%; text-align: center; margin-top: 150px;">
		<div style="font-size: 70px; 
					color: red; 
					font-family: 'Rix토이그레이';">안녕하세요 호우호우 입니다.</div>
		
		<br><br>
		<img alt="그림 없음" src="/ram/resources/imges/양1.jpg"
				style="width: 500px; height: 300px;">
		
		<br><br>
		
		<a href="/ram/insertOne">호우호우 메뉴입력</a> <br><br>
		<a href="/ram/selectList">호우호우 메뉴 전체보기</a> <br><br>
		
		<br><br><br><br><br>
		
		<div style="font-size: 25px; color: maroon;">
			<a href="/ram/yeobInfo">by.특파원</a>
		</div>
	</div>
</body>
</html>
