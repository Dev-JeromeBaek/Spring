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
					font-family: 'Rix토이그레이';">소고기 부위별 상세 정보</div>
					<br><br>
	<table border="1" style="text-align: center; width: 400px;" align="center">
		<tr>
			<td colspan="2" style="text-align: right;">
				<a href="/exdb05/">main</a>&nbsp;&nbsp;&nbsp;
				<a href="/exdb05/selectList">back</a>&nbsp;&nbsp;&nbsp;
			</td>
		</tr>
		<tr>
			<td>번 호</td>
			<td>${ bb.num }</td>
		</tr>
		<tr>
			<td>부 위</td>
			<td>${ bb.name }</td>
		</tr>
		<tr>
			<td>가 격</td>
			<td>${ bb.price }</td>
		</tr>
		<tr>
			<td>용 도</td>
			<td>${ bb.used }</td>
		</tr>
		<tr>
			<td colspan="2">
				<a href="/exdb05/updateOne?num=${ bb.num }">edit</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="/exdb05/deleteOne?num=${ bb.num }">delete</a>
			</td>
		</tr>
	</table>
	</div>
</body>
</html>
