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
		<table border="1" style="text-align: center; width: 400px;" align="center">
			<tr>
			<td colspan="2" style="text-align: right;">
				<a href="/exdb05/">main</a>&nbsp;&nbsp;&nbsp;
				<a href="/exdb05/selectOne?num=${ bb.num }">back</a>&nbsp;&nbsp;&nbsp;
			</td>
		</tr>
			<tr>
				<td>번 호</td>
				<td>${ bb.num }</td>
			</tr>
			<tr>
				<td>부 위</td>
				<td><input type="text" name="name"
					value="${ bb.name }"></td>
			</tr>
			<tr>
				<td>가 격</td>
				<td><input type="text" name="price"
					value="${ bb.price }"></td>
			</tr>
			<tr>
				<td>용 도</td>
				<td><input type="text" name="used"
					value="${ bb.used }"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="수정완료">
					<input type="hidden" name="num" value="${ bb.num }">
				</td>
			</tr>
		</table>
		</form>
	</div>
</body>
</html>
