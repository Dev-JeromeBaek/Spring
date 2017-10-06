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
  margin-top: 40px;
  padding: 24px;
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
.link-1:hover {
  border-top: 4px solid #ffffff;
  border-bottom: 4px solid #ffffff;
  padding: 6px 0; 
}
.aaa {
background: #3fa46a;
  color: black;
  font-size: 30px;
  text-decoration: none;
  padding: 20px 0;
  margin: 0 20px;
}

/* "con" 애들부터 */
body{
  font-size:25px;
}

.aa1{
	background-color: red;
	color: white;
}
.con{
 width:1200px;
  margin:auto;
}
nav ul li{
  list-style:none;
  float:left;
  padding-right:30px;
}
nav ul li a {
	text-decoration: none;
	color: white;
	background-color: black;
	padding: 4px 5px;
}


table { 
  color: #333;
  font-family: Helvetica, Arial, sans-serif;
  width: 1000px;
  border-collapse: collapse; border-spacing: 0; 
  margin: auto;
}
		
td { background: #FAFAFA; text-align: center; }

tr:nth-child(even) td { background: #EEE; } 
tr:nth-child(odd) td { background: #FDFDFD; }

tr:first-child th:nth-child(2) { 
  border-radius: 8px 0 0 0; 
} 

.h2{
	text-align: center;
}
tr:first-child th:last-child { 
  border-radius: 0 8px 0 0; 
}
.ho{
	background-color: orange;
}
</style>

<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"60168",secure:"60173"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>

<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-119" data-genuitec-path="/aaa/src/main/webapp/WEB-INF/views/memPage/center/reviewDeal.jsp">

<nav id="nav-1" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-119" data-genuitec-path="/aaa/src/main/webapp/WEB-INF/views/memPage/center/reviewDeal.jsp">
  <a class="aaa">구매내역</a>
  <a class="link-1" href="/aaa/mem/memAs">취소/환불/교환</a>
    <a class="link-1" href="/aaa/mem/memPoint">적립금</a>
  <a class="link-1" href="#">장바구니</a>
  <a class="link-1" href="/aaa/mem/memQnaList">문의/답변</a>
   <a class="link-1" href="/aaa/mem/memInfo">개인정보</a>
</nav>
<nav id="nav-1">
		<a class="aaa">구매내역</a>
		<a class="link-1" href="/aaa/mem/memAs">취소/환불/교환</a>
		<a class="link-1" href="/aaa/mem/memPoint">적립금</a>
		<a class="link-1" href="/aaa/mem/memCart">장바구니</a>
		<a class="link-1" href="/aaa/mem/memQnaList">문의/답변</a>
		<a class="link-1" href="/aaa/mem/memInfo">개인정보</a>
	</nav>

  <div class="con">
      <nav class="navecation">
       <ul id="navi">
    <li><a class="menu" href="/aaa/mem/memMyPage">배송상품</a></li>
       <li><a class="menu" href="/aaa/mem/ticketDeal">티켓상품</a></li>
    <li><a class="aa1">후기상품</a></li>          
  </ul>
    </nav>
  </div>
<h2><font color="green">전체</font></h2><hr color="green">
<table>
		<tr>
			<td>상품내역</td>
			<td>후기제목</td>
			<td>올린날짜</td>
		</tr>
		<tr>
			<td>ㅋ</td>
			<td>ㅋ</td>
			<td>ㅋ</td>
		</tr>
		<tr>
			<td>ㅁ</td>
			<td>ㅁ</td>
			<td>ㅁ</td>
		</tr>
	</table>
</body>
</html>

