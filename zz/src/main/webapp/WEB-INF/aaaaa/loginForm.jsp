<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style type="text/css">
	body {
		font-size: xx-large;
	}
	</style>
</head>
<body>

	<form method="post">
		<table align="center" style="text-align: center;" border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="m_id" style="ime-mode:disabled;"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="m_pw" style="ime-mode:disabled;"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="로그인하기">
				</td>
			</tr>
		</table>
	</form>
		<div class="bottom_button_box">
             <a href="/aaa/mem/id_Find">아이디 찾기</a>
             <span>&nbsp;&nbsp;&nbsp;&nbsp;</span>
             <a href="/aaa/mem/pw_Find">비밀번호 찾기</a>
             <span>&nbsp;&nbsp;&nbsp;&nbsp;</span>
             <a href="/aaa/mem/registration">회원가입</a>
        </div>
</body>
</html>
