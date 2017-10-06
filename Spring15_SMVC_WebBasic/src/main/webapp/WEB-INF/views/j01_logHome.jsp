<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	
	<script type="text/javascript">
		var msg = "${msg}";
		if(msg != "") {
			alert(msg);
		}
	</script>
</head>
<body>
	
	<h2>로그인 페이지 - nowLogin : ${ nowLogin }</h2>
	
	<a href="/spring15/">홈 화면가기</a> <br>
	<%-- 참고 : url을 /spring15로 표기하면 에러 --%>
	<%-- 즉 (/)가 없으면 에러!! --%>
	
	<c:choose>
		<c:when test="${ nowLogin == null }">
			<a href="/spring15/regLog">회원가입</a><br><br>
			
			<form action="/spring15/login" method="post">
				<table border="1" style="text-align: center;">
					<tr>
						<td>아이디</td>
						<td>
							<input type="text" name="id">
						</td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td>
							<input type="text" name="pw">
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="저장하기">
						</td>						
					</tr>
				</table>
			</form>
		</c:when>
		<c:otherwise>
			<a href="/spring15/logOut">로그아웃</a>
		</c:otherwise>
	</c:choose>
	
</body>
</html>
