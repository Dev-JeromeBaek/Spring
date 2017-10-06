<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style type="text/css">
		body {
			margin-top: 30px;
		}
		.imgDiv {
			border: solid 1px red;
			width: 400px;
			height: 400px;
			float: left;
		}
		.imgDiv img {
			padding: 10px;
			width: 380px;
			height: 380px;
		}
		.menuInfo {
			margin-top: 30px;
			margin-left: 40px;
			width: 350px;
			height: 400px;
			font-family: '210 다락방';
			font-size: 20px;
			float: left;
		}
		.aa {
			font-family: '배달의민족 주아';
			font-size: 30px;
		}
		 a:link {
			text-decoration: none;
			color: #DF171E;
			}
		a:hover { 
		 	text-decoration: none; 
		 	font-size: large;
			font-family: "배달의민족 주아";
		 	color: #DF171E;
		}
		a:visited {
			text-decoration: none;
			color: #DF171E;
		}
		a:active {
			font-size: large;
			font-family: "Rix토이그레이";
			color: #24A048;
		}
	</style>
</head>
<body>
	<div align="center">
		<div class="imgDiv">
			<img alt="img Loading..." 
				src="/ram/resources/files/${ ram.sysName }">
		</div>
		<div class="menuInfo">
			<hr>
			<p><font class="aa">번호</font> &nbsp;&nbsp;&nbsp;&nbsp; ${ ram.num }</p>
			<hr>
			<p><font class="aa">이름</font> &nbsp;&nbsp;&nbsp;&nbsp; ${ ram.name }</p>
			<hr>
			<p><font class="aa">가격</font> &nbsp;&nbsp;&nbsp;&nbsp; ${ ram.price } 원</p>
			<hr>
			<p><font class="aa">설명</font> &nbsp;&nbsp;&nbsp;&nbsp; ${ ram.expl }</p>
			<hr>
			<p align="center">
<%-- 				<input type="button" value="수정하기" onclick="modMenu(${ ram.num })"> --%>
<!-- 				&nbsp;&nbsp;&nbsp; -->
<%-- 				<input type="button" value="삭제하기" onclick="delMenu(${ ram.num })"> --%>
				<a onclick="modMenu(${ ram.num })">ReWrite</a>
				&nbsp;&nbsp;&nbsp;
				<a onclick="delMenu(${ ram.num })">Delete</a>
				&nbsp;&nbsp;&nbsp;
				<a onclick="downImg(${ ram.num })">DownLoad</a>
			</p>
		</div>
	</div>
	<script type="text/javascript">
		function modMenu(num) {
			alert("메뉴 수정페이지로 이동합니다.");
			opener.location.href="/ram/updateOne?num=" + num;
			self.close();
		}
		function delMenu(num) {
			alert("메뉴 삭제를 진행합니다.")
			opener.location.href="/ram/deleteOne?num=" + num;
			self.close();
		}
		function downImg(num) {
			alert("다운로드를 진행합니다.")
			opener.location.href="/ram/downLoad?num=" + num;
			self.close();
		}
		
	</script>
</body>
</html>
