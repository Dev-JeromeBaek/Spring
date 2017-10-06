<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">

.seRow1 div{
	float:left ;
	width: 1500px;
}
.row div{
	float:left;
/* 	div{float:left;} */
}
.row1 div {   
	float:left;  
}   
.row2{
	width: 1400px;
}
.col-sm-3{
	float:left;
/*  	padding-left: 55px; */
 	width: 1500px;
}
.detailBtns{
	float:left;
	input{width : 300px; border: 1px solid red;}
}
.smImg{
	width:150px;
	height: 150px;
	padding: 10px;
}

body {margin:0;}

.topnav {
  overflow: hidden;
  padding-left: 2%;
  background-color: yello;/*#333 검정 */
/*   width:1500px; */
  width:100%;
  bottom: 15px;
}

#menununu{
  position:fixed;
  z-index: 213435465625465365656;
}
.topnav a {
  float: left;
  display: block;
  color: blue;/*#f2f2f2 불투명흰색 */
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
/*   width: 343px; */
  width: 22.5%;
  background-color: red;
}

.topnav a:hover {
  background-color: orange;/*#ddd 밝은회색 */
  color: black;
}

.topnav a.active {
    background-color: #4CAF50;/*#4CAF50 초록색 */
    color: white;
}





.rereTitle{
	padding-left: 17%;
    width: 67%;
}
.rereTitle div{
	float:left;
	text-align: center;
}
button.accordion {
    background-color: #eee;
    color: #444;
    cursor: pointer;
    padding: 10px;
    width: 67%;
    text-align: left;
    border: none;
    outline: none;
    transition	: 0.4s;
}

button.accordion.active, button.accordion:hover {
    background-color: #ddd;
}

div.panel {
    padding: 0 55px;
    background-color: white;
/*     display: none; */
/*     float:left; */
     height:100px; 
}

button.accordion:after {
    content: '\02795'; /* Unicode character for "plus" sign (+) */
    font-size: 13px;
    color: #777;
    float: right;
    padding-left: 50px;
}

button.accordion.active:after {
    content: "\2796"; /* Unicode character for "minus" sign (-) */
}

button.accordion div{float:left;}

section{
 div{
	width: 1500px;
	float:left;
	}
}


.reviewNum{
	width: 100px;
}
.reviewTitle{
	width: 500px;
}
.reviewDate{
	width: 200px;
}
.reviewMemId{
	width: 100px;
}


</style>
<title>Insert title here</title>
</head>
<body>
<div id="menununu">
	<div class="topnav">
	  <a href="#seTop">seTop</a>
	  <a href="#seDetail">seRow1</a>
	  <a href="#seQnA">seQnA</a>
	  <a href="#seReview">seReview</a>
	</div>
</div>
<section id="seTop">
      <!-- Page Content -->
    <div class="container" style="padding-left: 30px; padding-right: 30px;height: 700px;">
        <div class="row">

			<div class="row1">
	            <div class="col-md-4">
	                <img class="img-responsive" style="width: 700px; height:500px;" id="mainPhoto"
	                	src="/aaa/resources/files/${(di.di_sysName).split(',')[0]}" 
	                	alt="${(di.di_sysName).split(',')[0]}" />
	            </div>
	            <div class="col-md-4" style="width: 500px; height: 500px;">
              	  <h1 class="page-header">${di.di_name } </h1>
	                <h1>대표가격 : ${di.di_price }</h1>
	                <p>${di.di_exp }</p>
	                <c:if test="${!ddList.isEmpty() }">
	                <select name="dd_kind" id="dd_kind" onchange="seleItem()">
	                <option value="0" >품목을 선택하세요.</option>
	                <c:forEach var="each" items="${ddList }">
	                <option id="c${each.dd_num }" value="${each.dd_num },${each.dd_kind },${each.dd_name },${each.dd_price},${each.dd_amount}">${each.dd_kind } - ${each.dd_name }</option>
	                </c:forEach>
	                </select>
	                </c:if>
	                <ul id="cartList"></ul>
					<ul id="totalprice"><span>총 구매 가격 : </span><span>0</span><span>원</span></ul>
	            <div id="detailBtns">
	            <input type="button" value="바로결제" onclick="cartP('${di.di_num}')" style="margin-left: 150px; background-color: yellow;" />
	            <input type="button" value="장바구니 담기" onclick="cart()"style="background-color: orange;"/>
	            </div>
	            </div>
			</div>

			<div class="row2">
				<c:forEach var="i" items="${(di.di_sysName).split(',') }">
					<div>
						<a onclick="expendImg('${i}')"> 
							<img class="smImg" src="/aaa/resources/files/${i}" alt="${i}">
						</a>
					</div>
				</c:forEach>
			</div>
			
        </div>
        <!-- /.row -->
	</div>
</section>






<section id="seDetail">
	<div class="seRow1" style="">
		<c:forEach var="i" items="${(di.di_sysName).split(',') }">
            <div class="col-sm-3 col-xs-6">
				<img src="/aaa/resources/files/${i}" alt="${i}" style="width: 1000px; height: 800px;">
            </div>
		</c:forEach>
	</div>
</section>
			
	
	
	
	
			
<section id="seQnA" style="">
	<div>
		<p style="font-size: 40px; text-align: left; padding-left: 17%;">상품 문의</p>
	</div>
	<div>
		<textarea id="qnaContents" style="width: 870px;height:50px;"></textarea>
		<input type="button" value="문의하기" onclick="dealQna()">
	</div>	
	<div>
		<c:if test="${dqList!=null }">
			<c:forEach var="dq" items="${dqList }">
				<div>
					<p><c:forEach var="dqMem" items="${dqMemList }"><c:if test="${dqMem.m_num==dq.dq_m_num }">${dqMem.m_id }</c:if></c:forEach>------------------------${dq.dq_date }</p>
					<p>${dq.dq_content }</p>
				</div>
 				<c:if test="${dq.dq_ans!=null }"> 
 				<div><p>관리자---${dq.dq_ans_date }</p> 
 					<p>${dq.dq_ans }</p></div> 
 				</c:if> 
			</c:forEach>
		</c:if>
	</div>
</section>
		
		
		<hr>
		
			
<section id="seReview">
	<div>
		<p style="font-size: 40px; text-align: left; padding-left: 17%; ">상품 Review</p>
	</div>
	<div>
		<c:if test="${reviewList!=null }">
		<div class="rereTitle"><div class="reviewNum">번호</div><div class="reviewTitle">제목</div><div class="reviewMemId">아이디</div><div class="reviewDate">날짜</div></div>
		<c:choose>
			<c:when test="${!reviewList.isEmpty() }">
				<c:forEach var="rr" items="${reviewList }" begin="0" end="${reviewList.size()-1 }" step="1" varStatus="status">
					<button class="accordion">
						<div class="reviewNum">${status.count }</div>
						<div class="reviewTitle">${rr.dr_title }</div>
						<c:forEach var="remem" items="${reMemList }">
							<div class="reviewMemId">
								<c:if test="${remem.m_num==rr.dr_m_num }">
									${remem.m_id }
								</c:if>
							</div>
						</c:forEach>
						<div class="reviewDate">${rr.dr_date }</div></button>
					<div class="panel">
						<div></div>
						<div>${rr.dr_content }</div>
					</div>
				</c:forEach>
<%-- 				<c:if test="${reviewList.size()>=11 }"> --%>
					
<%-- 				</c:if> --%>
			</c:when>
			<c:otherwise>
				<div style="width:800px; "><p>등록된 리뷰가 없습니다.</p></div>
			</c:otherwise>
		</c:choose>
		</c:if>
	</div>		
</section>
			
			
			
			

<script type="text/javascript">

$(function() {
	if(screen.top>600){
		document.getElementsByClassName("topnav").item(0).style.position="fixed";
	}else{
		document.getElementsByClassName("topnav").item(0).style.position="relative";
	}
});

function expendImg(i) {
	document.getElementById("mainPhoto").src = "/aaa/resources/files/"+i;
}

function seleItem() {
	if(document.getElementById("dd_kind").value==0) return;
	var ppList = document.getElementById("dd_kind").value.split(",");
	for(var q=0;q<document.getElementById("cartList").childNodes.length;q++){
		if(document.getElementById(ppList[0]) || !document.getElementById("dd_kind").value){
			alert("이미 선택된 상품입니다.");
			return;
		}
	}
	var xx=document.createElement("li");////////////////////////////////////////////////////////////////
	xx.innerHTML=ppList[1]+" - "+ppList[2]+
		"<input type='button' value='-' onclick='amountA("+ppList[0]+",0,"+ppList[4]+")'> <input type='text' id='"+ppList[0]+"' value='"+${1}+"' readonly='readonly'style='width:30px;' />"+
		"<input type='button' value='+' onclick='amountA("+ppList[0]+",1,"+ppList[4]+")'> | "+ppList[3];
	document.getElementById("cartList").appendChild(xx);
	$("#totalprice").show();
	priceCal();
}

function amountA(ddd,zzz,amou) {
	if(zzz==0){
		if(parseInt(document.getElementById(ddd).value)==1){//////////////////////////////////////////////////
			alert("최소 구매수량보다 작습니다.");
			if(confirm("선택 항목을 삭제하시겠습니까??")){
				$(document.getElementById(ddd).parentNode).remove();
				priceCal();
			}
			return;
		}			
		document.getElementById(ddd).value=parseInt(document.getElementById(ddd).value)-1;
	}else if(zzz==1){
		if(parseInt(document.getElementById(ddd).value)>=parseInt(amou)){
			alert("최대 구매 수량보다 많습니다.");
			return;
		}
		document.getElementById(ddd).value=parseInt(document.getElementById(ddd).value)+1;
	}
	priceCal();
	
}

function priceCal() {/////////////////////////////////////////////
	var cList = document.getElementById("cartList").childNodes;
	var mmm = document.getElementById("totalprice").getElementsByTagName("span").item(1).nodeValue;
	for(var hh=0;hh<cList.length;hh++){
		mmm += (cList.item(hh).getElementsByTagName("input").item(1).value)*document.getElementById("c"+(cList.item(hh).getElementsByTagName("input").item(1).id)).value.split(",")[3];
//			alert(mmm); 
	}
	document.getElementById("totalprice").getElementsByTagName("span").item(1).innerHTML=mmm;
}

function cartP(num) {
	if(!document.getElementById("cartList").hasChildNodes()){
		alert("상세 품목을 선택해 주세요");
		document.getElementById("dd_kind").focus();
		return;
	}
	if("${memLogin}"==""){
		alert("로그인이 필요합니다.");
		location.href="/aaa/mem/loginForm";
		return;
	}
	var cartNodesList = document.getElementById("cartList").childNodes;
	for(var rr=0;rr<cartNodesList.length;rr++){
		if(cartNodesList.item(rr).getElementsByTagName("input").item(1).value==0){
			alert("수량을 입력해주세요");
			cartNodesList.item(rr).getElementsByTagName("input").item(1).focus();
			return;
		}
	}
	setCoco();
	location.href="/aaa/mem/directBuyPage?num="+num+"&totalprice="+document.getElementById("totalprice").getElementsByTagName("span").item(1).innerHTML+"&coco="+getCoco();
}

function setCoco() {
	var nn = "";
	var ccList=document.getElementById("cartList").childNodes;
	for(var b=0;b<ccList.length;b++){
		var cNode = "c"+ccList.item(b).getElementsByTagName("input").item(1).id;
		var ppList = document.getElementById(cNode).value.split(",");
		nn+= ppList[0]+","+ccList.item(b).getElementsByTagName("input").item(1).value+","+ppList[3]+"-";
	}
	if(getCoco()!=""){
		nn+= getCoco();
	}
	document.cookie="coco="+nn+";path=/";
}
function getCoco() {
	var cookieList = document.cookie.split(";");
	var cartList;
	for(var i = 0; i <cookieList.length; i++) {
        var c = cookieList[i];
//         alert(c);
        while (c.charAt(0) == ' ') {
            c = c.substring(1);
        }
        if (c.indexOf("coco") == 0) {
            return c.substring(5, c.length);
        }
    }
	return "";
}

function cart() {
	if(!document.getElementById("cartList").hasChildNodes()){
		alert("상세 품목을 선택해 주세요");
		document.getElementById("dd_kind").focus();
		return;
	}
	var cartNodesList = document.getElementById("cartList").childNodes;
	for(var rr=0;rr<cartNodesList.length;rr++){
//			alert(rr+" - "+cartNodesList.item(rr).getElementsByTagName("input").item(0).value);
		if(cartNodesList.item(rr).getElementsByTagName("input").item(1).value==0){
			alert("수량을 입력해주세요");
			cartNodesList.item(rr).getElementsByTagName("input").item(1).focus();
			return;
		}
	}
	setCart();
	if(confirm("장바구니 페이지로 이동하겠습니까?")==true){
		if("${memLogin}"!="")
			location.href="/aaa/cart/insert?c_info="+getCart()+"&move=y";
		else
			location.href="/aaa/cart/page?c_info="+getCart();
	}else{
		if("${memLogin}"!="")
			location.href="/aaa/cart/insert?c_info="+getCart()+"&move=n&di_num="+${di.di_num};
	}
}

function setCart() {
	var nn = "";
	var ccList=document.getElementById("cartList").childNodes;
	var getList = getCart().split("-");
	aa : for(var b=0;b<ccList.length;b++){
		var cNode = "c"+ccList.item(b).getElementsByTagName("input").item(1).id;
		var ppList = document.getElementById(cNode).value.split(",");
		for(var qq=0;qq<getList.length;qq++){
			var ddInfos = getList[qq].split(",");
			if(parseInt(ddInfos[1])==parseInt(ppList[0])){
				nn+=${di.di_num}+","+ppList[0]+","+(parseInt(ccList.item(b).getElementsByTagName("input").item(1).value)+parseInt(ddInfos[2]))+","+ppList[3]+"-";
				continue aa;
			}
		}
		nn+=${di.di_num}+","+ppList[0]+","+ccList.item(b).getElementsByTagName("input").item(1).value+","+ppList[3]+"-";
	}
	bb : for(var q=0;q<getList.length;q++){
		if(getList[q]!=""){
			
		var ddInfos = getList[q].split(",");
		for(var b=0;b<ccList.length;b++){
			var cNode = "c"+ccList.item(b).getElementsByTagName("input").item(1).id;
			var ppList = document.getElementById(cNode).value.split(",");
			if(ddInfos[1]==ppList[0])
				continue bb;
		}
		nn += getList[q] + "-";
		}
	}
	document.cookie="cart="+nn+";path=/";
}
function getCart() {
	var cookieList = document.cookie.split(";");
	var cartList;
	for(var i = 0; i <cookieList.length; i++) {
        var c = cookieList[i];
//         alert(c);
        while (c.charAt(0) == ' ') {
            c = c.substring(1);
        }
        if (c.indexOf("cart") == 0) {
            return c.substring(5, c.length);
        }
    }
	return "";
}

function dealQna() {
	if("${memLogin}"==""){
		alert("로그인이 필요합니다.");
		if(confirm("로그인 페이지로 이동하시겠습니까?"))
			location.href="/aaa/mem/loginForm";
		return;
	}
	var qnaCon = document.getElementById("qnaContents").value;
	if(qnaCon==""){
		alert("문의 내용을 입력해주세요.");
		document.getElementById("qnaContents").focus();
		return;
	}
	var qwer = qnaCon.replace(/\n/g, "<br>");
// 	alert(qnaCon);
	location.href="/aaa/deal/insertQna/${di.di_num}?qnaCont="+qwer;
}




$("#totalprice").hide();
$(".panel").hide();
document.cookie="coco=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/";
document.getElementsByClassName("seRow1").item(0).style.height=(parseInt("${di.di_sysName}".split(',').length-1)*800)+"px";
// document.getElementsByClassName("seRow1").item(0).st
document.getElementById("menununu").style.top=((window.innerHeight)*0.95)+"px";
document.getElementById("menununu").style.height = ((window.innerHeight)*0.05)+"px";
document.getElementById("menununu").style.width=(window.innerWidth*0.67)+"px";


var acc = document.getElementsByClassName("accordion");
for (var i = 0; i < acc.length; i++) {
  $(acc[i]).click( function() {
    this.classList.toggle("active");
// 	alert("ghghgghh");
     $(this.nextElementSibling).toggle();
//     alert("ERererewrer");
  });
}

</script>

</body>
</html>