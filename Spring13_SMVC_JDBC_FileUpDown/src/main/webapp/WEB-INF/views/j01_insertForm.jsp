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
	<form method="post" enctype="multipart/form-data">
	<table border="1" style="text-align: center;">
		<tr>
			<td colspan="3">
				<a href="/spring13/selectList">목록보기</a>
			</td>
		</tr>
		<tr>
			<td>이 름</td>
			<td><input type="text" name="name"></td>
			<td rowspan="2">
				&nbsp;&nbsp;사진 첨부 &nbsp;
				<input type="file" name="upfile">
			</td>
		</tr>
		<tr>
			<td>나 이</td>
			<td>
				<input type="text" name="age">
			</td>
		</tr>
		<tr>
			<td colspan="3">
				<input type="submit" value="저장하기">
			</td>
		</tr>
	</table>
	</form>
</body>
</html>
