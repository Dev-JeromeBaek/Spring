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
					font-family: 'Rix토이그레이';">인사 정보 목록</div>
					<br><br>
	<table border="1" style="text-align: center;">
		<tr>
			<td colspan="2">
				<a href="/spring13/insertOne">정보입력</a>
			</td>
		</tr>
		<tr>
			<td>번 호</td>
			<td>이 름</td>
		</tr>
		
		<c:if test="${ !listc.isEmpty() }">
			<c:forEach var="each" items="${ listc }">
				<tr>
					<td>${ each.num }</td>
					<td>
						<a href="/spring13/selectOne?num=${ each.num }">
							${ each.name }
						</a>
					</td>
					<td>
						<img alt="그림 없음" src="/spring13/resources/files/${ each.sysName }"
								style="width: 100px; height: 100px;">
					</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
	</div>
</body>
</html>
