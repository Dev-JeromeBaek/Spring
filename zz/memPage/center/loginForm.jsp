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
					<input type="submit" value="로그인하기"><input type="hidden" name="cart" id="cart" value="">
				</td>
			</tr>
		</table>
	</form>
		<div class="bottom_button_box">
             <a href="/aaa/searchID">아이디 찾기</a>
             <span>&nbsp;&nbsp;&nbsp;&nbsp;</span>
             <a href="/aaa/searchPW">비밀번호 찾기</a>
             <span>&nbsp;&nbsp;&nbsp;&nbsp;</span>
             <a href="/aaa/mem/registration">회원가입</a>
        </div>
<script type="text/javascript">
	$(function() {
		var cookieList = document.cookie.split(";");
		var cartList;
		for(var i = 0; i <cookieList.length; i++) {
	        var c = cookieList[i];
	        var ccc="";
	        while (c.charAt(0) == ' ') {
	            c = c.substring(1);
	        }
	        if (c.indexOf("cart") == 0) {
	            ccc= c.substring(5, c.length);
	        }
	    }
		document.getElementById("cart").value=ccc; 
		alert(ccc);
	});
</script>
</body>
</html>
