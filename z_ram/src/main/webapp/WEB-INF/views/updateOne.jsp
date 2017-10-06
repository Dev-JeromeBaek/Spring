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
		.thisPage{
			border: solid 1px blue;
			width: 1000px;
			height: 500px;
		    padding: 50px;
		    margin-left: 385px;
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
			width: 500px;
			height: 400px;
			font-family: '210 다락방';
			font-size: 20px;
			float: left;
		}
		.aa {
			font-family: '배달의민족 주아';
			font-size: 30px;
			margin-left: 40px;
			padding-right: 70px;
		}
		.inText {
			width: 200px;
			height: 30px;
			font-size: 20px;
			font-family: '210 다락방';
		}
	</style>
</head>
<body>
	<div style="width: 100%; text-align: center; margin-top: 100px;">
		<form method="post" enctype="multipart/form-data">
		<div style="font-size: 50px; 
					color: red; 
					font-family: 'Rix토이그레이';">호우호우 메뉴 정보 수정</div>
					<br><br>
	<div class="thisPage">
		<div style="text-align: left;">
			<div class="imgDiv">
				<img alt="img Loading..." 
					src="/ram/resources/files/${ ram.sysName }">
			</div>
			<div class="menuInfo">
				<hr>
				<p>
					<font class="aa">번 호</font>
					&nbsp;&nbsp;&nbsp;&nbsp; 
					${ ram.num }
					<input type="hidden" name="num" value="${ ram.num }">
				</p>
				<hr>
				<p>
					<font class="aa">이 름</font>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<input class="inText" type="text" 
						name="name" placeholder="${ ram.name }"> 
				</p>
				<hr>
				<p>
					<font class="aa">가 격</font>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<input class="inText" type="text" 
						name="price" placeholder="${ ram.price }"> 
				</p>
				<p>
					<font class="aa">사 진</font>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="file" name="upfile" 
						style="font-family: '210 다락방';"> 
				</p>
				<hr>
				<p>
					<font class="aa">설 명</font>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<input class="inText" type="text" 
						name="expl" placeholder="${ ram.expl }"> 
				</p>
				<hr>
				<input type="hidden" name="sysName" value="${ ram.sysName }">
				<p align="center" style="font-size: 35px;">
					<input type="button" value="수정 취소" onclick="cancelMod()">
<!-- 					<a onclick="cancelMod()">수정 취소</a> -->
					&nbsp;&nbsp;&nbsp;
					<input type="submit" value="수정 완료">
<!-- 					<a onclick="okMod()">수정 완료</a> -->
<%-- 					<a href="/ram/updateOne?num=${ ram.num }">수정 완료</a> --%>
				</p>
			</div>
		</div>
	</div>
		</form>
	</div>
	<script type="text/javascript">
		function cancelMod() {
			location.href="/ram/selectList";
		}
// 		function okMod() {
// 			alert("AA");
// 			var ff = document.upForm;
// 			ff.action = "/ram/insertOne";
// 			ff.method = "post";
// 			ff.submit();
// 		}
	</script>
	 
</body>
</html>
