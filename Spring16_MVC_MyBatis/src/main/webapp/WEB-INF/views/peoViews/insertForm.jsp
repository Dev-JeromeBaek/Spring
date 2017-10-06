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
	
	<h2>인사 정보 입력</h2>
	
	<form method="post">
		이름 : <input type="text" name="name"> <br>
		나이 : <input type="text" name="age"> <br>
		
		<input type="submit" value="저장하기">
	</form>
</body>
</html>
