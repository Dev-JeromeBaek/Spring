<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript">
		function home() {
			location.href="/aaa/";
		}
		function login() {
			location.href="/aaa/mem/loginForm";
		}
	</script>
</head>
<body>
	<c:choose>
			<c:when test="${!m_id.isEmpty() }">
				<table border="1" style="text-align: center; width:500px; heigth: 400px;" align="center">
				<tr>
					<td>이름 </td>
					<td>${ m_name }</td>
				</tr>
				<tr>
					<td>아이디</td>
					<td>${ m_id }</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="button" value="로그인" onclick="javascript:login()">
						<input type="button" value="홈" onclick="javascript:home()">
					</td>				
				</tr>
			</table>
			</c:when>
			
			<c:otherwise>
				<div>정보가 없습니다.</div>
			</c:otherwise>
	</c:choose>
</body>
</html>