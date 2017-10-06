<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>회원 로그인 페이지</h2>
	
	
		
	  <div class="pagepop_wrap">
        <div class="social_login_cont join_cont">
        	<form name="loginFrm" id="loginFrm">
		        <input type="hidden" name="captchaType" id="captchaType" value="image" />
				<input type="hidden" name="captchaKey" id="captchaKey" value="" />
                <label for="userid" class="id_ipt login_ipt_box">
                	<strong id="userid_blind">아이디</strong>
                    <input type="text" id="userid" name="userid" value="" onkeypress="javascript:fn_submit(event)" title="" class="input_txt" style="outline-style:none;">
                </label>
                <label for="pwd" class="pw_ipt login_ipt_box">
                	<strong id="pwd_blind">비밀번호</strong>
                    <input type="password" name="password" id="pwd" title="" class="input_txt" onkeypress="javascript:fn_submit(event)" autocomplete="off" style="outline-style:none;">
                </label>
                <p id="msgHolder" class="ipt_wrn_msg" style="display:none">아이디 또는 비밀번호가 일치하지 않습니다.</p>

                <!-- capcha -->
                <!-- //capcha -->
                <a href="javascript:fn_submit2();" class="btn_login">로그인</a>
                <div class="chk_choice">
                    <div class="msg_layer" style="top: 23px; left: 0px;display:none">
                    </div>
                </div>

                <div class="bottom_button_box">
                    <a href="/aaa/searchID">아이디 찾기</a>
                    <span class="icon_division"></span>
                    <a href="/aaa/searchPW">비밀번호 찾기</a>
                    <span class="icon_division"></span>
                    <a href="/aaa/registration">회원가입</a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>