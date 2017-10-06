<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>Insert title here</title>
<style type="text/css">
@import url(http://fonts.googleapis.com/css?family=Raleway);

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
.aaaaa {
background: #3fa46a;
  color: black;
  font-size: 30px;
  text-decoration: none;
  padding: 20px 0;
  margin: 0 20px;
}

/* "con" 애들부터 */


.aa1{
	background-color: red;
	color: white;
}
.con{
 width:1200px;
  margin:auto;
}
.liligg{
  list-style:none;
  float:left;
  padding-right:50px;

}
nav ul li a {
	text-decoration: none;
	color: white;
	background-color: black;
	padding: 4px 5px;
}



.ho{
	background-color: orange;
}
</style>

<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"60168",secure:"60173"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>

<body style="text-align: center;" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-90" data-genuitec-path="/aaa/src/main/webapp/WEB-INF/views/memPage/center/MyAll.jsp">
<c:choose>
<c:when test="${mnum == null}">
<script type="text/javascript">
	alert("로그인을 해주십시오");
	location.href="/aaa/mem/loginForm";
</script>
</c:when>
<c:otherwise>
<nav id="nav-1">
  <a class="aaaaa">구매내역</a>
  <a class="link-1" href="/aaa/mem/MyCancel">취소/환불/교환</a>
    <a class="link-1" href="/aaa/mem/MyPoint">적립금</a>
  <a class="link-1" href="/aaa/cart/memCart">장바구니</a>
  <a class="link-1" href="/aaa/mem/memQnaList">문의/답변</a>
   <a class="link-1" href="/aaa/mem/memInfo">개인정보</a>
</nav>

  <div class="con">
      <nav class="navecation">
       <ul id="navi">
    <li class="liligg"><a class="menu" href="/aaa/mem/Myshipping">배송상품</a></li>
       <li class="liligg"><a class="menu" href="/aaa/mem/MyTicket">티켓상품</a></li>
    <li class="liligg"> <a class="aa1">전체상품</a></li>          
  </ul>
    </nav>
  </div>
<h2 class="h2classOne"><font color="green" size="15" >전체상품</font></h2><hr color="green">
<table  class="w3-table-all">

<thead>
      <tr class="w3-red">
        <td>상품명</td>
			<td>가격</td>
			<td>상태</td>
			<td>구입날짜</td>
			<td>후기쓰러가기</td>
      </tr>
    </thead>
		
		<c:forEach var="each" items="${listc}">
		<tr>
			<td>${each.b_di_name}</td>
			<td>${each.b_price}</td>
			<c:choose>
			<c:when test="${each.b_status == 'WAIT'}">
			<td>결제승인대기</td>
			</c:when>
			
			<c:when test="${each.b_status == 'YES'}">
			<td>구매완료</td>
			</c:when>
			
			<c:when test="${each.b_status == 'NO'}">
			<td>구매취소</td>
			</c:when>
			
			<c:when test="${each.b_status == 'ING'}">
			<td>배송중</td>
			</c:when>
			
			</c:choose>
			<td>${each.b_date_string}</td>
			<td><input type="button" value="후기버튼" onclick="reviewPop('${each.b_di_num}')"></td>
		</tr>
		</c:forEach>
		
	</table>
	</c:otherwise>
	</c:choose>
</body>
<script type="text/javascript">
		
	function reviewPop(dnum) {
		var m_num = "${memLogin.m_num}";
	//		var dealName = document.getElementById("dealName").innerHTML;
	//		alert(dealName);
		var url = "/aaa/review/reviewPop?m_num="+m_num+"&di_num="+dnum;
		
		var popname = "상품구매후기";
		var size = "width=450px, height=710px";
		window.open(url, popname, size);
	}
		
</script>
</html>

