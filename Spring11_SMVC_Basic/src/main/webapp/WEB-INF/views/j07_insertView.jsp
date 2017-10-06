<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>

	<h2>j07_insertView 페이지</h2>
	
	<table border="1" style="text-align: center;">
		<tr>
			<td>이 름</td>
			<td>${ info.peo.name }</td>
		</tr>
		<tr>
			<td>나 이</td>
			<td>${ info.getPeo().getAge() }</td>
		</tr>
		<tr>
			<td>국 어</td>
			<td>${ info.stu.kor }</td>
		</tr>
		<tr>
			<td>영 어</td>
			<td>${ info.stu.eng }</td>
		</tr>
		<tr>
			<td>수 학</td>
			<td>${ info.getStu().getMath() }</td>
		</tr>
	</table>
	
</body>
</html>
