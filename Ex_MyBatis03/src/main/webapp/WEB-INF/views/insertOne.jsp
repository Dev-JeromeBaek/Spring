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
		<form method="post" enctype="multipart/form-data">
		<div style="font-size: 50px; 
					color: red; 
					font-family: 'Rix토이그레이';">호우호우 메뉴 정보 입력</div>
					<br><br>
		
		<table border="1" style="text-align: center; width: 400px;" align="center">
			<tr>
				<td colspan="2" style="text-align: right;">
					<a href="/exmybatis03/">main</a>&nbsp;&nbsp;&nbsp;
				</td>
			</tr>
			<tr>
				<td>메 뉴</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>가 격</td>
				<td><input type="text" name="price"></td>
			</tr>
			<tr>
				<td>설 명</td>
				<td><input type="text" name="expl"></td>
			</tr>
			<tr>
				<td colspan="2">
					&nbsp;&nbsp;
					사진 첨부&nbsp;&nbsp;
					<input type="file" name="upfile">
				</td>
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
