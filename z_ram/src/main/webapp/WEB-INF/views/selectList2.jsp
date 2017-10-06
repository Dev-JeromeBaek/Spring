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
					font-family: 'Rix토이그레이';">호우호우 메뉴 List보기</div>
					<br><br>
	<table border="1" style="text-align: center; width: 400px;" align="center">
		<tr>
			<td colspan="5" style="text-align: right;">
				<a href="/ram/">main</a>&nbsp;&nbsp;&nbsp;
			</td>
		</tr>
		<tr>
			<td>번 호</td>
			<td>이 름</td>
			<td>가 격</td>
			<td>사 진</td>
			<td>설 명</td>
		</tr>
		<c:choose>
		<c:when test="${ listc != null }">
			<c:forEach var="each" items="${ listc }">
				<tr>
					<td>${ each.num }</td>
					<td>
						<a href="/ram/selectOne?num=${ each.num }">${ each.name }</a>
					</td>
					<td>${ each.price }</td>
					<td>
						<img alt="img Loading..." 
								src="/ram/resources/files/${ each.sysName }"
									style="width: 150px; height: 150px;">
					</td>
					<td>${ each.expl }</td>
					
				</tr>
			</c:forEach>	
		</c:when>
		</c:choose>
	</table>
	</div>
</body>
</html>
