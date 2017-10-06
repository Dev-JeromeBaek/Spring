<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	
	<h2>j05_initBinder 페이지</h2>
	
	<h3>1. Get방식</h3>
	<form action="/spring15/initBinder" method="get">
		생일 입력(형식: 년-월-일) <br>
		<input type="text" name="birthDay">
		<input type="submit" value="전송하기">
	</form>
	
	
	<h3>2. Post방식</h3>
	<form action="/spring15/initBinder" method="post">
		생일 입력(형식: 년-월-일) <br>
		<input type="text" name="birthDay">
		<input type="submit" value="전송하기">
	</form>
	
</body>
</html>
