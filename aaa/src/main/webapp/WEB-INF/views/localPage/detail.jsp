<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">


.row2 div {
	float: left !important;
}

.row div {
	float: none;
}

.row1 div {
	float: left;
}

.col-sm-3 a img {
	width: 150px;
	height: 100px;
	padding: 10px;
}
</style>
</head>
<body>

	<!-- Page Content -->
	<div class="container" style="padding-left: 30px; padding-right: 30px;">

		<!-- Portfolio Item Heading -->
		<div class="row">
			<h1 class="page-header">${info.di_name}</h1>

			<div class="row1">
				<div class="col-md-4">
					<img class="img-responsive" style="width: 700px; height: 500px;"
						id="mainPhoto"
						src="/aaa/resources/files/${(info.di_sysName).split(',')[0]}"
						alt="${(info.di_sysName).split(',')[0]}" />
				</div>
				<div class="col-md-4" style="width: 600px; height: 500px;">
					<h1>${info.di_exp }</h1>
					<h1>대표가격 : </h1>
					<c:if test="${!detail.isEmpty()}">
						<h3><select name="dd_kind" id="dd_kind" onchange="seleItem()">
							<option value="0">품목을 선택하세요.</option>
							<c:forEach var="each" items="${detail}">
								<option  id="c${each.dd_num}" value="${each.dd_num},${each.dd_kind },${each.dd_name },${each.dd_price}">
									${each.dd_kind } - ${each.dd_name }</option>
							</c:forEach>
						</select></h3>
					</c:if>
					<ul id="cartList"></ul>
					<ul id="totalprice"><span>총 구매 가격 : </span><span>0</span><span>원</span></ul>
				</div>
				<input type="button" value="바로결제" onclick="cartP('${info.di_num}')" />
				<input type="button" value="장바구니" onclick="cart()" />
			</div>

			<div class="row2">
				<c:forEach var="i" items="${(info.di_sysName).split(',') }">
					<div class="col-sm-3 col-xs-6">
						<a onclick="expendImg('${i}')"> <img
							class="img-responsive portfolio-item"
							src="/aaa/resources/files/${i}" alt="${i}">
						</a>
					</div>
				</c:forEach>
			</div>
		</div>
		<!-- /.row -->
		<hr>
	</div>

	<script type="text/javascript">
	function expendImg(i) {
		document.getElementById("mainPhoto").src = "/aaa/resources/files/"+i;
	}
	
	function seleItem() {
		if(document.getElementById("dd_kind").value==0) return;
		var ppList = document.getElementById("dd_kind").value.split(",");
		for(var q=0;q<document.getElementById("cartList").childNodes.length;q++){
// 			alert(document.getElementById("dd_kind").value);
			if(document.getElementById(ppList[0]) || !document.getElementById("dd_kind").value){
				alert("이미 선택된 상품입니다.");
				return;
			}
		}
		var xx=document.createElement("li");
		xx.innerHTML=ppList[1]+" - "+ppList[2]+"<button onclick='amountA("+ppList[0]+",0)'>-</button> <input type='text' id='"+ppList[0]+"' value='"+${1}+"' readonly='readonly' style='width:30px;' />"+
			"<button onclick='amountA("+ppList[0]+",1)'>+</button> | "+ppList[3];
		document.getElementById("cartList").appendChild(xx);
		$("#totalprice").show();
		priceCal();
	}
	
	function amountA(ddd,zzz) {
		if(zzz==0){
			if(parseInt(document.getElementById(ddd).value)==1){
				alert("최소 구매수량보다 작습니다.");
				return;
			}			
			document.getElementById(ddd).value=parseInt(document.getElementById(ddd).value)-1;
		}else if(zzz==1){
			document.getElementById(ddd).value=parseInt(document.getElementById(ddd).value)+1;
		}
		priceCal();
		
	}
	
	function priceCal() {
		var cList = document.getElementById("cartList").childNodes;
		var mmm = document.getElementById("totalprice").getElementsByTagName("span").item(1).nodeValue;
		for(var hh=0;hh<cList.length;hh++){
			mmm += (cList.item(hh).getElementsByTagName("input").item(0).value)*document.getElementById("c"+(cList.item(hh).getElementsByTagName("input").item(0).id)).value.split(",")[3];
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
		var cartNodesList = document.getElementById("cartList").childNodes;
		for(var rr=0;rr<cartNodesList.length;rr++){
			if(cartNodesList.item(rr).getElementsByTagName("input").item(0).value==0){
				alert("수량을 입력해주세요");
				cartNodesList.item(rr).getElementsByTagName("input").item(0).focus();
				return;
			}
		}
		setCoco();
		location.href="/aaa/mem/buyPage?num="+num+"&mnum="+mnum+"&totalprice="+document.getElementById("totalprice").getElementsByTagName("span").item(1).innerHTML+"&coco="+getCoco();
	}
	
	function setCoco() {
		var nn = "";
		var ccList=document.getElementById("cartList").childNodes;
		for(var b=0;b<ccList.length;b++){
			var cNode = "c"+ccList.item(b).getElementsByTagName("input").item(0).id;
			var ppList = document.getElementById(cNode).value.split(",");
			nn+= ppList[0]+","+ccList.item(b).getElementsByTagName("input").item(0).value+","+ppList[3]+"-";
		}
		if(getCoco()!=""){
			nn+= getCoco();
		}
		document.cookie="coco="+nn+";path=/;";
	}
	function getCoco() {
		var cookieList = document.cookie.split(";");
		var cartList;
		for(var i = 0; i <cookieList.length; i++) {
	        var c = cookieList[i];
	        alert(c);
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
// 			alert(rr+" - "+cartNodesList.item(rr).getElementsByTagName("input").item(0).value);
			if(cartNodesList.item(rr).getElementsByTagName("input").item(0).value==0){
				alert("수량을 입력해주세요");
				cartNodesList.item(rr).getElementsByTagName("input").item(0).focus();
				return;
			}
		}
		alert("AAAAAAAA");
		setCart();
		if(confirm("장바구니 페이지로 이동하겠습니까?")==true){
			if("${memLogin}"!="")
				location.href="/aaa/cart/insert?c_info="+getCart()+"&move=y";
			else
				location.href="/aaa/cart/page?c_info="+getCart();
		}else{
			if("${memLogin}"!="")
				location.href="/aaa/cart/insert?c_info="+getCart()+"&move=n&di_num="+${info.di_num};
		}
	}
	
	function setCart() {
		var nn = "";
		var ccList=document.getElementById("cartList").childNodes;
		var getList = getCart().split("-");
		aa : for(var b=0;b<ccList.length;b++){
			var cNode = "c"+ccList.item(b).getElementsByTagName("input").item(0).id;
			var ppList = document.getElementById(cNode).value.split(",");
			for(var qq=0;qq<getList.length;qq++){
				var ddInfos = getList[qq].split(",");
				if(parseInt(ddInfos[1])==parseInt(ppList[0])){
					nn+=${di.di_num}+","+ppList[0]+","+(parseInt(ccList.item(b).getElementsByTagName("input").item(0).value)+parseInt(ddInfos[2]))+","+ppList[3]+"-";
					continue aa;
				}
			}
			nn+=${info.di_num}+","+ppList[0]+","+ccList.item(b).getElementsByTagName("input").item(0).value+","+ppList[3]+"-";
		}
		bb : for(var q=0;q<getList.length;q++){
			if(getList[q]!=""){
				
			var ddInfos = getList[q].split(",");
			for(var b=0;b<ccList.length;b++){
				var cNode = "c"+ccList.item(b).getElementsByTagName("input").item(0).id;
				var ppList = document.getElementById(cNode).value.split(",");
				if(ddInfos[1]==ppList[0])
					continue bb;
			}
			nn += getList[q] + "-";
			}
		}

		document.cookie="cart="+nn+";path=/;";
	}
	function getCart() {
		var cookieList = document.cookie.split(";");
		var cartList;
		for(var i = 0; i <cookieList.length; i++) {
	        var c = cookieList[i];
	        alert(c);
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
// 	$(function() {
// 		document.cookie="cart=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
		document.cookie="coco=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
		
// 	});
</script>

</body>
</html>