<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript">
		var msg = "${msg}";
		if(msg != "") {
			alert(msg);
		}
	</script>
	<style type="text/css">
		.menuList {
			width: 1200px;
			margin-left: 400px;
		}
		
		.menuOne {
			border: solid 1px red;
			width: 310px;
			height: 480px;
			margin: 10px;
			padding: 10px;
			float: left;
			font-family: '210 다락방';
			font-size: 25px;
		}
		
		.menuList img {
			width: 300px;
			height: 300px;
			padding: 5px;
			padding-top: 10px;
			padding-bottom: 0px;'
		}
		.aa:link {
			text-decoration: none;
			font-size: large;
			color: #24A048;
		}
		.aa:hover { 
		 	text-decoration: none; 
		 	font-size: xx-large;
			font-family: "배달의민족 주아";
		 	color: #24A048;
		}
		.aa:visited {
			text-decoration: none;
			color: #24A048;
		}
		.aa:active {
			font-size: xx-large;
			font-family: "Rix토이그레이";
			color: #DF171E;
		}
	</style>
</head>
<body>
	<div style="width: 100%; text-align: center; margin-top: 50px;">
		<div style="font-size: 50px; 
					color: red; 
					font-family: 'Rix토이그레이';">호우호우 메뉴 List보기
		</div>
		<br>
		<br>
	</div>
	<div style="text-align: center;">
		<a class="aa" href="/ram/insertOne">메뉴 등록</a>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a class="aa" href="/ram/">main</a>
	</div>
	<br>
	<br>
	<div class="menuList">
		<c:choose>
		<c:when test="${ listc != null }">
			<c:forEach var="each" items="${ listc }">
				<div class="menuOne">
				&nbsp;&nbsp;${ each.num } &nbsp;&nbsp;&nbsp; ${ each.name }
				<a onclick="showOne(${ each.num })">
					<img alt="img Loading..." 
						src="/ram/resources/files/${ each.sysName }">
				</a>
				<hr>
				<ul type="circle" 
					style="text-align: left; 
						font-size: 15px;">
					<li>메뉴 가격 - ${ each.price } 원</li>
					<hr>
					<li>메뉴 설명 - ${ each.expl }</li>
				</ul>
				<hr>
				</div>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<div style="font-size: 50px; 
						color: red; 
						font-family: 'Rix토이그레이';">입력된 호우호우 메뉴가 없습니다.
				<br>
				<br>
				<br>
				<a href="/ram/insertOne" style="font-size: 70px;">메뉴 등록하기</a>
			</div>
		</c:otherwise>
		</c:choose>
	</div>
	<script type="text/javascript">
		function showOne(num) {
			var url = "/ram/selectOne?num=" + num;	//controller쪽으로 가는 url을 의미!
			var popname = "selectOne";
			var size = "width=850px, height=500px, left=500px, top=200px";
			window.open(url, popname, size);
		}
		</script>
	
</body>
</html>
