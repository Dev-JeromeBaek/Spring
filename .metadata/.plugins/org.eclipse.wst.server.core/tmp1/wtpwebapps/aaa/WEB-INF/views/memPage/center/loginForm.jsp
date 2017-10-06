<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>

.aa {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
}

.bb {
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 100%;
}

.bb:hover {
    opacity: 0.8;
}

.cancelbtn {
    width: auto;
    padding: 10px 18px;
    background-color: #f44336;
}

.imgcontainer {
    text-align: center;
    margin: 24px 0 12px 0;
}

.avatar.avatar {
    width: 40%;
    border-radius: 50%;
}

.container {
    padding: 16px;
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
    .cancelbtn {
       width: 100%;
    }
}
</style>
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"60168",secure:"60173"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-110" data-genuitec-path="/aaa/src/main/webapp/WEB-INF/views/memPage/center/loginForm.jsp">

	<form name="frm" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-110" data-genuitec-path="/aaa/src/main/webapp/WEB-INF/views/memPage/center/loginForm.jsp">
	<div class="imgcontainer">
		<img alt="" src="/aaa/resources/files/환영.jpg"
				style="width:200px; height:200px" class="avatar" >
  	</div>
  	<div class="container">
    <label><b>아이디</b></label>
    <input class="aa" type="text" id="m_id" name="m_id" style = "text-align:center;"
    	placeholder="아이디를 입력해주세요.">

    <label><b>비밀번호</b></label>
    <input class="aa" type="password" id="m_pw" name="m_pw"style = "text-align:center;"
    	placeholder="비밀번호를 입력해주세요.">
        
<!--     <button type="submit">Login</button> -->
    <button type="button" class="bb" onclick="javascript:goLogin()">Login</button>
    	<input type="hidden" name="cart" id="cart" value="">
   </div>

	</form>
		<div class="bottom_button_box">
             <a href="/aaa/mem/id_Find">아이디 찾기</a>
             <span>&nbsp;&nbsp;&nbsp;&nbsp;</span>
             <a href="/aaa/mem/pw_Find">비밀번호 찾기</a>
             <span>&nbsp;&nbsp;&nbsp;&nbsp;</span>
             <a href="/aaa/mem/registration">회원가입</a>
        </div>
<script type="text/javascript">
function goLogin(){
			var frm = document.frm;
			var m_id = document.getElementById("m_id").value;
			var m_pw = document.getElementById("m_pw").value;
			if(m_id == "admin") {
				frm.action="/aaa/admin/adminLogin";
				frm.submit();
			} else if(m_id == "") {
				alert("아이디를 입력해주세요.");
				document.getElementById("m_id").valeu = "";
				document.getElementById("m_id").focus();
				return;
			} else if(m_pw == "") {
				alert("비밀번호를 입력해주세요.");
				document.getElementById("m_pw").valeu = "";
				document.getElementById("m_pw").focus();
				return;
			} else {
				frm.action="/aaa/mem/loginFormm?m_id="+m_id+"&m_pw="+m_pw+"&cart="+getCart();
				frm.submit();
			}
		}
	function getCart() {
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
// 		return ccc;
	}
</script>
</body>
</html>
