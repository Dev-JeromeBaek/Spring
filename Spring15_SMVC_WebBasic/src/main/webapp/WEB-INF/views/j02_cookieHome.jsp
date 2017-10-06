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
</head>
<body>
	<h2>Cookie Home</h2>
	
	<a href="/spring15/makeCookie">1. 쿠키 생성</a> <hr>
	
	<a href="/spring15/showCK">2. 쿠키 확인 - myCookie : ${ myCookie }</a> <hr>
	
	<a href="/spring15/delCK">3. 쿠키 삭제</a> <hr>
	
	<a href="/">홈 화면으로 가기</a>
	<a href="/spring15/">홈 화면으로 가기</a>
</body>
</html>
