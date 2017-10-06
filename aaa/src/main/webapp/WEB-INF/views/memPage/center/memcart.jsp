<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
<style type="text/css">
/*  @import url(http://fonts.googleapis.com/css?family=Lato:300,400,900);  */
/*  @import url(https://i.icomoon.io/public/c88de6d4a5/CartIcons/style.css);  */
html { box-sizing: border-box; overflow-y: scroll; }
*, *:before, *:after { box-sizing: inherit; }
body{ font-family:'Lato', 'helvetica', arial, sans-serif!important;font-size:100%;font-weight:400;color:#424242;line-height:1.3;}
.wrap{ width:100%; max-width:1400px; margin:0 auto; padding:100px 0;}
.btn{ display:inline-block; font-size:.9em; padding:12px 30px; background:#ffc21d; color:#232323; font-weight:900; cursor:pointer; text-transform:uppercase; font-weight:700;letter-spacing:2px; opacity:1; transition:opacity .3s;
  &:hover{ opacity:.8}
}
.cart-header{ border-bottom:1px solid #ccc; padding-bottom:20px; position: relative; 
strong{font-size:1.8em;position: relative;//top:14px;font-weight:400;line-height:1;}
  .btn{ position:absolute; bottom:10px;right:0;}
}
.bonus-products{ border:1px solid #ccc; border-top:none; padding:18px; background:rgba(0,0,0,.05);
  strong{font-weight:400;color:#888;font-size:.8em;.bp-toggle{font-size:.7em;// color:blue;cursor:default;}}
}
.item{border-bottom:1px solid #ccc;// padding-bottom:10px;margin-bottom:10px;
  &:last-child{border-bottom:none;padding-bottom:0;margin-bottom:0;}
  .item-block{float:left;
    &.ib-info{ width:100%;img.product-img{float:left;width:100px;}
      .ib-info-meta{float:left;}
      span{display:block;margin-bottom:3px;
        &.title{font-size:1em;}
        &.itemno{color:#888;font-size:.8em;}
        &.styles{border-left:3px solid rgba(0,0,0,.1);padding-left:5px;font-size:.8em;strong{display:inline-block; min-width:70px;}.blue-link{font-size:.8em;}}
      }
    }
    &.ib-qty{width:20%;text-align:right;
      input{ text-align:center;font-size:16px;border-radius:0;outline:none;border:1px solid #ccc;// padding:12px;width:50px;height:40px;color:#555;&:focus{border-color:#7BCDE8;}}
      span.price{display:inline-block;color:#777;>span{margin:0 5px;}}
    }
    &.ib-total-price{width:20%;text-align:right;padding-top:6px;position: relative;
      span{color:#555;
        &.tp-price{font-size:1.4em;font-weight:900; }
        &.tp-remove{font-size:14px;margin-left:10px;position: relative;top:-2px;// position:absolute;// right:-35px;// top:12px;cursor:pointer;
          &:hover{color:red;}
        }
      }
    }
  }
}
.item .bundle-block{ padding:0 0 10px 50px; position: relative; // width:60%;// border-top:1px dotted #ccc;
  ul{
    li{position: relative;display:block;width:100%;margin-top:10px;padding-top:5px;
      i.i-down-right-arrow{display:block;position:absolute;left:-30px;font-size:12px;top:50%;margin-top:-6px;color:#999;}     
      img{ width:100%;  display:block;  float:left; margin-right:15px;}
      span{display:block;
        &.bundle-title{font-size:.85em;}
        &.bundle-itemno{color:#888; font-size:.7em;sss}
      }
    }
  }
}
.prod_header{height:65px;border-top:2px solid #959da6;border-bottom:1px solid #d6dadd}
.prod_header .title{overflow:hidden}
.prod_header .title li{float:left;font-weight:700;font-size:14px;font-family:'Nanum Gothic bold';line-height:15px;color:#000;letter-spacing:-.4px;text-align:center}
.prod_header .title li.info{width:65%}
.prod_header .title li.order{width:20%}
.prod_header .title li.delivery{width:15%}



.mmodal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 245435353453; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    left: 30%;
    top: 0;
    width: 40%; /* Full width */
    height: 90%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(255,187,0,0.7); /* Black w/ opacity */
    
}
</style>

</head>
<body>

<!-- The Modal -->
<div id="corpModal" class="mmodal">

  <!-- Modal content -->
  <div class="modal-content" > 
	<h3>기업회원 정보</h3>
	<div id="corpInfoM"></div>
    <p class="closeM" style="font-size: 50px;">닫기</p>
  </div>

</div>


	<h2>장바구니 페이지</h2>
<div class="wrap">

  <header class="cart-header cf">
    <strong><h1>Cart Page</h1></strong>
<!--     <span class="btn">Checkout</span> -->
    <strong><h2 id="total"><span >총 구매 가격 : </span><span></span></h2></strong>
    <strong><h3 align="right">
   	 <span class="btn" onclick="seleBuy(0)">선택 구매</span>
   	 <span class="btn" style="margin-left:10px;" onclick="seleBuy(1)">전체 구매</span>
   	</h3></strong>
<div style="width: 100px; height: 100%; background-color: gray;float: none; float: left;">
<button onclick="cartdelete()"><h3>선택 삭제</h3></button>
</div>
</div>
  </header>
  <div class="bonus-products prod_header">
     <label style="float: left;">
                <input type="checkbox" checked="checked" class="chch" onclick="allCheck()">
            </label>
            <ul class="title">
                <li class="info">상품정보</li>
                <li class="order">상품금액</li>
                <li class="delivery">배송비</li>
            </ul>
  </div>
  <div class="cart-table">
<!--     <ul id="cList"> -->

<!-- begin bundle product -->
<!--       <li class="item"> -->
      <c:forEach var="di" items="${diList }">
        <div class="item-main cf dealI" style="width: 1300px; float:left;">
<!--           <div class="item-block ib-info cf"> -->
          	<div style="float:left;"><input type="checkbox" class="chch" id="di${di.di_num }"></div>
            <img src="/aaa/resources/files/${di.di_sysName.split(',')[0] }"  style="padding-left:70px; width: 300px; height:200px;float:left;"/>
            <div class="ib-info-meta"style="float: left;width:550px;">
              <div>
              	<p>
              		<c:forEach var="corp" items="${corpList }">
              			<c:if test="${corp.c_num==di.di_c_num }">
		              		<p style="width:50%;text-align: right;font-size: 20px;" onclick="momomo(${corp.c_num})" class="cn${corp.c_num }"
		              			id="${corp.c_name },${corp.c_ceo},${corp.c_tel},${corp.c_addr}">[${corp.c_name }]</p>
              			</c:if>
              		</c:forEach>
              	<p style="width:50%;font-size: 20px;text-align: left;" onclick="javascript:location.href='/aaa/deal/detail/${di.di_num}'">${di.di_name }</p>
              	</p>
              </div>
	           <div>
		          	<ul>
              <c:forEach var="dd" items="${ddList }">
              <c:if test="${dd.dd_di_num==di.di_num }">
		          	<li class="dealD">
		          	 <span style="float:left;">${dd.dd_kind } - ${dd.dd_name }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
		          		<button onclick="amountA(${dd.dd_num},0)" style="float:left; border: 1px solid gray;">--</button>
		          		<c:forEach var="cart" items="${cartList }">
		          		<c:if test="${dd.dd_num==cart.cart_dd_num }">
		          		<input type="text" id="d${dd.dd_num }" value="${cart.cart_amount }" style="float:left;width:50px;" readonly="readonly">
		          		</c:if>
		          		</c:forEach>
		          		<button onclick="amountA(${dd.dd_num},1)" style="border: 1px solid gray;float:left;">++</button>
		          		<span id="${dd.dd_price }">0</span>
		          		<br><br>
		          	</li>
		          	
              </c:if>
              </c:forEach>
		          	</ul>
	            </div>
            </div>
              <div style="float:left; width:200px;" align="center" class="diprice">0</div>
              <div style="float:left; width:120px;" align="right">2500</div>
                
        </div>
        
      </c:forEach>
</div>

<script type="text/javascript">
		var modal = document.getElementById('corpModal');
	function momomo(c_num) {
// 		window.open("/aaa/cart/popup?c_num="+c_num,"CorpInfoPopup","width=400px,height=400px");
		var cInfos = document.getElementsByClassName("cn"+c_num).item(0).id.split(",");
		document.getElementById("corpInfoM").innerHTML="<table align='center' style='font-size: 30px;'><tr><th>회사명</th><td>"+cInfos[0]+"</td></tr><tr><th>대표자 명</th><td>"+cInfos[1]+"</td></tr>"+
			"<tr><th>회사 전화번호</th><td>"+cInfos[2]+"</td></tr><tr><th>회사 주소</th><td>"+cInfos[3]+"</td></tr></table>";
		modal.style.display="block";
	}
	
	function allCheck() {
		var ac = document.getElementsByClassName("chch");
		if(ac.item(0).checked){
			for(var i=1;i<ac.length;i++)
				ac.item(i).checked=true;
		}else{
			for(var i=1;i<ac.length;i++)
					ac.item(i).checked=false;
		}
	}
	
	function amountA(ddd,zzz) {
		var dddd = parseInt(document.getElementById("d"+ddd).value);
		if("${memLogin}"==""){
			if(zzz==0){
				if(dddd==1){
					if(!confirm("최소 구매수량보다 작습니다.<br>해당 항목을 삭제하시겠습니까?"))	return;
				}			
					dddd=dddd-1;
			}else if(zzz==1)
				dddd=dddd+1;
			updateCart(ddd,dddd);
			ddtotal();
		}else{	//회원일때 수량 수정
			if(zzz==0){
				if(dddd==1){
					if(confirm("최소 구매수량보다 작습니다.\n해당 항목을 삭제하시겠습니까?"))
						location.href="/aaa/cart/deleteA?dd_num="+ddd;
					return;
				}
				location.href="/aaa/cart/updateA?dd_num="+ddd+"&amou="+(dddd-1);
			}else if(zzz==1){
				location.href="/aaa/cart/updateA?dd_num="+ddd+"&amou="+(dddd+1);
			}
		}
	}
	
	
	allCheck();
	
	function ddtotal() {
		var dChilds = document.getElementsByClassName("dealD");
		var dtotal=0;
		for(var i=0;i<dChilds.length;i++){
			dChilds.item(i).getElementsByTagName("span").item(1).innerHTML=parseInt(dChilds.item(i).getElementsByTagName("input").item(0).value)*parseInt(dChilds.item(i).getElementsByTagName("span").item(1).id);
		}
		ditotal();
	}
	function ditotal(){
		var diChilds = document.getElementsByClassName("dealI");
		for(var j=0;j<diChilds.length;j++){
			var ddChilds = diChilds.item(j).getElementsByClassName("dealD");
			var toto = 0;
			for(var k=0;k<ddChilds.length;k++){
				toto += parseInt(ddChilds.item(k).getElementsByTagName("span").item(1).innerHTML);
			}
			diChilds.item(j).getElementsByClassName("diprice").item(0).innerHTML=toto;
		}
		document.getElementById("total").childNodes.item(1).innerHTML=total();
	}
		
	function total() {
		var dealChilds = document.getElementsByClassName("dealI");
		var ttotal = 0;
		for(var w=0;w<dealChilds.length;w++){
			if(dealChilds.item(w).getElementsByClassName("chch").item(0).checked)
			ttotal+=parseInt(dealChilds.item(w).getElementsByClassName("diprice").item(0).innerHTML)+2500;
		}
		return ttotal;
	}
	
	ddtotal();
	
	function getCart() {
		var cookieList = document.cookie.split(";");
		var cartList;
		for(var i = 0; i <cookieList.length; i++) {
	        var c = cookieList[i];
	        while (c.charAt(0) == ' ') {
	            c = c.substring(1);
	        }
	        if (c.indexOf("cart") == 0) {
	            return c.substring(5, c.length);
	        }
	    }
		return "";
	}
	function getCoco() {
		var cookieList = document.cookie.split(";");
		var cartList;
		for(var i = 0; i <cookieList.length; i++) {
	        var c = cookieList[i];
//	         alert(c);
	        while (c.charAt(0) == ' ') {
	            c = c.substring(1);
	        }
	        if (c.indexOf("coco") == 0) {
	            return c.substring(5, c.length);
	        }
	    }
		return "";
	}
	
	
	
	
	function cartdelete() {
		var chList = document.getElementsByClassName("chch");
		var nums="";
		for(var q=1;q<chList.length;q++){
			if(chList.item(q).checked){
				nums += chList.item(q).id + ",";
			}
		}
		if(nums==""){
			alert("선택된 상품이 없습니다.");
			return;
		}
		if("${memLogin}"==""){
			var gcart = getCart();
			gCartList = gcart.split("-");
			var scList="";
			for(var f=0;f<gCartList.length-1;f++){
				var bb=true;
				for(var a=0;a<nums.split(",").length-1;a++){
					if(gCartList[f].split(",")[0]==nums.split(",")[a].substring(2)){
						bb=false;
					}
				}
				if(bb)	scList += gCartList[f]+"-";
			}
			document.cookie="cart="+scList+";path=/";
			location.href="/aaa/cart/page?c_info="+scList;
		}else {
			location.href="/aaa/cart/delete?nums="+nums;
		}
	}
	
	function updateCart(ddd,dddd) {
		var gCart = getCart();
		gCartList = gCart.split("-");
		var upCart = "";
		for(var i=0;i<gCartList.length-1;i++){
			var cartNums = gCartList[i].split(",");
			if(cartNums[1]==ddd){
				if(dddd!=0){
					upCart += cartNums[0]+","+cartNums[1]+","+dddd+","+cartNums[3]+"-";
				}
				continue;
			}
			upCart += gCartList[i] + "-";
		}
		document.cookie = "cart="+upCart+";path=/";
		
		location.href="/aaa/cart/page?c_info="+getCart();
	}
	
	
	function seleBuy(ghgh) {
		var chList = document.getElementsByClassName("chch");
		var nums="";
		var totoprice = parseInt(document.getElementById("total").childNodes.item(1).innerHTML);
		if(ghgh==0){
			for(var q=1;q<chList.length;q++){
				if(chList.item(q).checked){
					nums += chList.item(q).id.substring(2) + ",";
					totoprice = totoprice-2500;
				}
			}
		}else{
			for(var q=1;q<chList.length;q++){
				nums += chList.item(q).id.substring(2) + ",";
				totoprice = totoprice-2500;
			}
		}
		
		if(nums==""){
			alert("선택된 상품이 없습니다.");
			return;
		}
		if("${memLogin}"==""){
			alert("로그인이 필요합니다.");
			location.href="/aaa/mem/loginForm";
		}else {
			location.href="/aaa/mem/cartBuyPage?totalprice="+totoprice+"&di_nums="+nums;
		}
	}
	
	
	$(".chch").click(function() {
		ddtotal();
	});
	
	
	// Get the <span> element that closes the modal
	var closeB = document.getElementsByClassName("closeM")[0];

	// When the user clicks the button, open the modal 
// 	btn.onclick = function() {
// 	    modal.style.display = "block";
// 	}
	

	// When the user clicks on <span> (x), close the modal
	closeB.onclick = function() {
	    modal.style.display = "none";
	}
	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
	    if (event.target == modal) {
	        modal.style.display = "none";
	    }
	}
	
</script>


</body>
</html>
