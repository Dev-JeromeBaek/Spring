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
	
	<div style="width: 100%; text-align: center; margin-top: 150px;">
		<div style="font-size: 50px; 
					color: red; 
					font-family: 'Rix토이그레이';">소고기 부위별 List보기</div>
					<br><br>
	<table border="1" style="text-align: center; width: 400px;" align="center">
		<tr>
			<td colspan="2" style="text-align: right;">
				<a href="/exdb05/">main</a>&nbsp;&nbsp;&nbsp;
			</td>
		</tr>
		<tr>
			<td>번 호</td>
			<td>이 름</td>
		</tr>
		<c:choose>
			<c:when test="${ listc != null }">
				<c:forEach var="each" items="${ listc }">
					<tr>
						<td>
				<a href="/exdb05/selectOne?num=${ each.num }">${ each.num }</a></td>
						<td>${ each.name }</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="2">입력된 소고기 정보가 없습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>
	</div>
</body>
</html>
