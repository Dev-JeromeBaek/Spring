<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript">
		window.onload = function() { // 이 화면이 시작(로딩)될때 이 함수를 실행시켜라!
			var msg = "${ closer }";
			if(msg == "ckComp") {
				self.close();
			}
		}
		window.on
		
		function nopopCK() {
			location.href="/spring15/nopopCK";
// 			self.close();
// 			-> 이 명령이 존재하면 쿠키 생성하는 메소드 호출 불가
		}
	</script>
</head>
<body>
	<h2>j03_popUp 페이지</h2>
	
	
	Sleep more!
	
	<input type="button" value="팝업창 그만보기(5초)"
		onclick="nopopCK()">
	
	
</body>
</html>
