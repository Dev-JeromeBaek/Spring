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
	<h2>선택 인사 정보 상세</h2>
	
	<table border="1" style="text-align: center;">
		<tr>
			<td colspan="2">
				<a href="/spring14/selectList" style="text-decoration: none;">
					전체보기
				</a>
			</td>
		</tr>
		<tr>
			<td>번 호</td>
			<td>${ apb.num }</td>
		</tr>
		<tr>
			<td>이 름</td>
			<td>${ apb.name }</td>
		</tr>
		<tr>
			<td>나 이</td>
			<td>${ apb.age }</td>
		</tr>
	</table>
</body>
</html>
