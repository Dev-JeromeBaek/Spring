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
	<form method="post">
		<table border="1" style="text-align: center;">
			<tr>
				<td>부위 입력</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>가격 입력</td>
				<td><input type="text" name="price"></td>
			</tr>
			<tr>
				<td>용도 입력</td>
				<td><input type="text" name="used"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="전송하기">
				</td>
			</tr>
		</table>
	</form>
	
</body>
</html>
