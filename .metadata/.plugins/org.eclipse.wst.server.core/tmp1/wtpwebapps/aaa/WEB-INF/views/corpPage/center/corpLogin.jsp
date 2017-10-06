<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업회원 로그인</title>
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


<script type="text/javascript">
	var nowLogin = "${corpLogin}";
	if(nowLogin != ""){
		location.href="/aaa/corpJoin/Home";
	}
</script>

<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"60168",secure:"60173"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-22" data-genuitec-path="/aaa/src/main/webapp/WEB-INF/views/corpPage/center/corpLogin.jsp">
	<br data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-22" data-genuitec-path="/aaa/src/main/webapp/WEB-INF/views/corpPage/center/corpLogin.jsp">
	<br>
	<h1>기업회원 로그인 페이지 입니다.</h1>
	<br>
	<form name="frm">
	<div class="imgcontainer">
		<img alt="" src="/aaa/resources/files/환영.jpg"
				style="width:200px; height:200px" class="avatar" >
  	</div>
  	<div class="container">
    <label><b>Business Number</b></label>
    <input class="aa" type="text" id="c_bn" name="c_bn" value="${corp.getC_bn()}" style = "text-align:center;"  required
    	placeholder="사업자 번호를 입력해주세요.">

    <label><b>Password</b></label>
    <input class="aa" type="password" id="c_pw" name="c_pw" value="${corp.getC_pw()}"style = "text-align:center;" required
    	placeholder="비밀번호를 입력해주세요.">
        
<!--     <button type="submit">Login</button> -->
    <button class="bb" onclick="javascript:goLogin()">Login</button>
    	<input class="aa" type="button" value="회원가입" onclick="javascript:goJoin()"> 
		<input class="aa" type="button" value="홈으로" onclick="javascript:goHome()"> 
   </div>

	</form>
	
	<script type="text/javascript">
		function goLogin(){
			var c_bn = document.getElementById("c_bn").value;
			var c_pw = document.getElementById("c_pw").value;
			var frm = document.frm;
			frm.action="/aaa/corpJoin/corpLoginn?c_bn="+c_bn+"&c_pw="+c_pw;
			frm.submit();
		}
		function goJoin(){
			var frm = document.frm;
			frm.method = "get";
			frm.action="/aaa/corpJoin/corpJoin"
			frm.submit();
		}
		function goHome(){
			var frm = document.frm;
			frm.method = "get";
			frm.action="/aaa/corpJoin/Home";
			frm.submit();
		}
		function goDel(){
			var frm = document.frm;
			frm.method = "get";
			frm.action="/aaa/corpJoin/del";
			frm.submit();
		}
		
	
	</script>
</body>
</html>


