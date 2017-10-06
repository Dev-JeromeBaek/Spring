<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import url(http://fonts.googleapis.com/css?family=Raleway);
body {
  margin: 0px;
}
nav {
  margin-top: 30px;
  padding: 20px;
  text-align: center;
  font-family: Raleway;
  box-shadow: 2px 2px 8px rgba(0, 0, 0, 0.5);
}
#nav-1 {
  background: #3fa46a;
}
.link-1 {
  transition: 0.3s ease;
  background: #3fa46a;
  color: #ffffff;
  font-size: 20px;
  text-decoration: none;
  border-top: 4px solid #3fa46a;
  border-bottom: 4px solid #3fa46a;
  padding: 20px 0;
  margin: 0 20px;
}
.pww{
background-color: red;
}
.link-1:hover {
  border-top: 4px solid #ffffff;
  border-bottom: 4px solid #ffffff;
  padding: 6px 0; 
}
.fff {
background: #3fa46a;
  color: black;
  font-size: 30px;
  text-decoration: none;
  padding: 20px 0;
  margin: 0 20px;
}
</style>
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"60168",secure:"60173"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-111" data-genuitec-path="/aaa/src/main/webapp/WEB-INF/views/memPage/center/memInfo.jsp">

<nav id="nav-1" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-111" data-genuitec-path="/aaa/src/main/webapp/WEB-INF/views/memPage/center/memInfo.jsp">
  <a class="link-1" href="/aaa/mem/Myshipping">구매내역</a>
  <a class="link-1" href="/aaa/mem/MyCancel">취소/환불/교환</a>
     <a class="link-1" href="/aaa/mem/MyPoint">적립금</a>
  <a class="link-1" href="/aaa/mem/memcart">장바구니</a>
  <a class="link-1" href="/aaa/mem/memQnaList">문의/답변</a>
   <a class="fff">개인정보</a>
</nav>
<br><br><br><br>
<form name="frm">
아이디 ${ memLogin.getM_id() }<br><br>

비밀번호 <input type="password" name="pw" class="pww"><br><br>

<input type="button" value="수정페이지로" onclick="javascript:gomodi('${memLogin.m_num}')">

</form><br><br><br><br>

<%--넘어온이름 => --%> <h2><font color="orange">**</font>님의 개인정보 보호를 위해서 <font color="red">비밀번호 , 자동입력 방지문자</font>를 입력해주세요.</h2>
<h2>회원님의 비밀번호가 타인에게 노출되지 않도록 주의해 주세요.</h2>

<script type="text/javascript">
	function gomodi(m_num){
		var frm = document.frm;
		frm.action = "/aaa/mem/memPerModi?m_num="+m_num;
		frm.method = "post";
		frm.submit();
	}
</script>
</body>
</html>
