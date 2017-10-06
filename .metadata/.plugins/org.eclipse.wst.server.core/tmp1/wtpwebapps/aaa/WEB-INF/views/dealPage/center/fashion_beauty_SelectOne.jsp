<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

<style type="text/css">
body { margin-left: 0px; margin-top: 0px; margin-right: 0px; margin-bottom: 0px; }
.d2 {
/*      border: 4px solid red; */
	width: 1200px;
	margin :0 auto;
	height: 850px;
 	overflow: auto;
}

.d3 {
	float: left;
	width: 700px;
	height: 500px;
	line-height: 60px;
/*   	border: 1px solid red;  */
}

.d4 {
	margin: 2px 2px;
/*   	 border: 1px solid red; */
	float: left;
	line-height: 30px;
	width : 340px;
	height: 500px;
	
}
.d44 {
	margin: 2px 2px;
/*  	border: 1px solid red;   */
	float: left;
	line-height: 30px;
	width : 320px;
	height: 340px;
	
}
.d5 {
/*     border: 1px solid red;  */
	width: 700px;
	margin :0 auto;
	height: 280px;
	float: left;
	line-height: 30px;

}

.d6{
	margin: 2px 2px;
/* 	  	border: 1px solid red;  */
		float: left;
		line-height: 10px;
		width : 400px;
		height: 800px;
.seRow1 div{
	float:left !important;
}
.row div{
	float:left;
	div{float:left;}
}
/* .row1 div {  */
/*  	 float:left; */
/*  }  */
.col-sm-3 a img{
	width:1000px;
	height: 800px;
 	padding-left: 225px; 
}
.detailBtns{
/* 	left:700px;  */
	float:left;
	input{width : 300px; border: 1px solid red;}
}

</style>
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"60168",secure:"60173"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-60" data-genuitec-path="/aaa/src/main/webapp/WEB-INF/views/dealPage/center/fashion_beauty_SelectOne.jsp">

      <!-- Page Content -->
    <div class="d2" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-60" data-genuitec-path="/aaa/src/main/webapp/WEB-INF/views/dealPage/center/fashion_beauty_SelectOne.jsp">

        <!-- Portfolio Item Heading -->
<!--         <div class="row"> -->

<!-- 			<div class="row1"> -->
	            <div class="d3">
						
					<img id="my_image" alt="Image Loading..." src="/aaa/resources/files/${di.getDi_sysName().split(',')[0]}"
												style="width:450px; height:450px;">
				</div>
				<div class="d4">
				
				<span style=" font: italic bold 2.0em/1em Georgia, serif; "><label id="my_exp">${di.getDi_exp() }</label></span><br>
				<span style=" font: italic bold 1.5em/1em Georgia, serif ;"><input type='text' id='detailName' name="detailName" value=''></span><br>
				<span style=" font: italic bold 1.5em/1em Georgia, serif ;"><input type='text' id='detailKind' value=''></span><br>
				
				<span style=" font: italic bold 1.3em/1em Georgia, serif; ">dasam 가</span> &nbsp;
				<span style=" font-size:2.0em;  color: red;" ><input readonly="readonly" name="detailPrice" type='text' id='detailPrice' value=''></span><br>
				<c:choose>
				<c:when  test="${detail.getDd_amount() < 1}">
					<span style=" font-size:1.5em;  color: red;" >품 절</span><br>
				</c:when>
				<c:otherwise>
					<span style=" font: italic bold 1.3em/1em Georgia, serif; ">수량  </span> &nbsp;
					<span style=" font-size:1.5em;  color: red;" ><input readonly="readonly" name="detailAmount" type='text' id='detailAmount' value=''></span><br>
				</c:otherwise>
				</c:choose>
				
				
				<c:if test="${!ddList.isEmpty() }">
	                <select name="dd_kind" id="dd_kind" onchange="seleItem()">
	                <option value="0">품목을 선택하세요.</option>
	                <c:forEach var="each" items="${ddList}">
	                <option id="c${each.dd_num }" value="${each.dd_num },${each.dd_kind },${each.dd_name },${each.dd_price}">${each.dd_kind } - ${each.dd_name }</option>
	                </c:forEach>
	                </select>
	                </c:if>
	                <ul id="cartList"></ul>
					<ul id="totalprice"><span>총 구매 가격 : </span><span>0</span><span>원</span></ul>
					
		            <div id="detailBtns">
		            <input style="width:75; font-family:돋움; background-color:#E9237A; border:1 solid #A0DBE4"   type="button" value="바로결제" onclick="cartP('${di.di_num}')" style="margin-left: 50px;" />
		            <input style="width:75; font-family:돋움; background-color:#E9967A; border:1 solid #A0DBE4"   type="button" value="장바구니 담기" onclick="cart()"/>
		            </div>
<!-- 				<span style=" font: italic bold 1.3em/1em Georgia, serif;">수량 선택 : </span> -->
<!-- 				<input id="detailAmount2"  type="number" name="amount" value="" min="1" max=""><br>  -->

				</div>
			
			<div class="d5">
			<c:forEach var="i" items="${di.getDi_sysName().split(',')}">
				<a onclick="goImage('${i}')">
					<img  alt="Image Loading..." src="/aaa/resources/files/${i}"
												style="width:150px; height:140px">
				</a>
			</c:forEach>
			</div>


	</div>
	<hr><hr>	
	
		<c:forEach var="i" items="${di.getDi_sysName().split(',')}">
			<img  alt="Image Loading..." src="/aaa/resources/files/${i}"
												style="width:500px; height:500px"><br><br><br>
		</c:forEach>


<script type="text/javascript">
function expendImg(i) {
	document.getElementById("mainPhoto").src = "/aaa/resources/files/"+i;
}

function seleItem() {
	if(document.getElementById("dd_kind").value==0) return;
	var ppList = document.getElementById("dd_kind").value.split(",");
	for(var q=0;q<document.getElementById("cartList").childNodes.length;q++){
// 		alert(document.getElementById("dd_kind").value);
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

var mnum=1;

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

$("#totalprice").hide();
// $(function() {
//		document.cookie="cart=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
	document.cookie="coco=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/";
	
// });



//////////////////////////////////////////////////////////////////////////////////////


function goImage(usingName){
//		document.getElementById("#my_image").src = "/aaa/resources/files/Fashion"+usingName;
	$("#my_image").attr("src","/aaa/resources/files/"+usingName);
	
				var di_num = ${di.di_num};
	    		var goUsingName = usingName;
	            $.ajax({
	                type : 'POST',
	                url : '/aaa/fashion/fashion_SelectData?di_num='+di_num,
	                data:
	                {
	                	goUsingName : goUsingName
	                },
	                success : function(result) {
	                  	detail = result.detail;
	                	di = result.di;
//		                var detailName = decodeURIComponent(result.detailName);  //한글 깨짐 현상....
//		                  		alert(detailName);
//		                var Ca = /\+/g;
//		                decodeURIComponent( con.replace(Ca, " ") );
							
	                  		$("#detailPrice").attr("value",detail.dd_price+" 원");
	                  		$("#detailName").attr("value",detail.dd_name);
	                  		$("#detailAmount").attr("value",detail.dd_amount+" 개");
	                  		$("#detailAmount2").attr("max",detail.dd_amount);
	                  		$("#detailAmount2").attr("value",1);
//		                  	$("#detailAmount3").attr("",detail.dd_amount);
							
	                  		$("#detailKind").attr("value",detail.dd_kind);
// 	                  		alert(detail.dd_kind);
												
	                  		$("#dd_num").attr("value",detail.dd_num);
	                  		$("#di_num").attr("value",di.di_num);
	                  		$("#dd_price").attr("value",detail.dd_num);
	                  		$("#dd_amount").attr("value",detail.dd_num);
	                }
	            }); 
}




</script>

</body>
</html>





















