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
	<h2>인사 정보 보기</h2>
	
	<table border="1" style="text-align: center;">
		<tr>
			<td>번 호</td>
			<td>이 름</td>
			<td>나 이</td>
		</tr>
		<c:choose>
			<c:when test="${ listc != null }">
				<c:forEach var="each" items="${ listc }"> 
					<tr>
						<td>${ each.num }</td>
						<td>${ each.name }</td>
						<td>${ each.age }</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="3">
						정보가 없습니다.
					</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>
</body>
</html>
