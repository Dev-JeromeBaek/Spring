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
	
	<h2>인사 정보 입력(여러명)</h2>
	
	<form method="post">
		<table>
			<tr>
				<td>이 름</td>
				<td>나 이</td>
			</tr>
			<c:forEach var="i" begin="0" end="2" step="1">
				<tr>
					<td><input type="text" name="listc[${ i }].name"></td>
					<td><input type="text" name="listc[${ i }].age"></td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="2">
					<input type="submit" value="전송하기">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
