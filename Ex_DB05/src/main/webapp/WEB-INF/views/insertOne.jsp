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
		<form method="post">
		<div style="font-size: 50px; 
					color: red; 
					font-family: 'Rix토이그레이';">소고기 부위별 정보 입력</div>
					<br><br>
		
		<table border="1" style="text-align: center; width: 400px;" align="center">
			<tr>
				<td colspan="2" style="text-align: right;">
					<a href="/exdb05/">main</a>&nbsp;&nbsp;&nbsp;
				</td>
			</tr>
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
	</div>
	
</body>
</html>
