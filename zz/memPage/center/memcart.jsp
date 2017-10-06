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
/* .blue-link{ */
/*   color:#659BAF; */
/*   cursor:pointer; */
/*   &:hover{ */
/*     color:#223840;         */
/*   } */
/* } */
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
    &.ib-info{ width:100%;img.product-img{float:left;width:100px;margin-right:15px;}
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
/* .bundle-img{ */
/* 	float:left; */
/* } */
.prod_header{height:65px;border-top:2px solid #959da6;border-bottom:1px solid #d6dadd}
.prod_header .title{overflow:hidden}
.prod_header .title li{float:left;font-weight:700;font-size:14px;font-family:'Nanum Gothic bold';line-height:15px;color:#000;letter-spacing:-.4px;text-align:center}
.prod_header .title li.info{width:65%}
.prod_header .title li.order{width:20%}
.prod_header .title li.delivery{width:15%}
</style>

</head>
<body>
	<h2>장바구니 페이지</h2>
<div class="wrap">

  <header class="cart-header cf">
    <strong><h1>Cart Page</h1></strong>
<!--     <span class="btn">Checkout</span> -->
    <strong><h2 id="total"><span>총 구매 가격 : </span><span></span></h2>
    </strong>
<div style="width: 100px; height: 100%; background-color: gray;float: none; float: left;">
<button onclick="cartdelete()"><h3>선택 삭제</h3></button>
</div>
</div>
  </header>
  <div class="bonus-products prod_header">
<!--     <strong>Bonus Products Block <span class="bp-toggle">(hide this block)</span></strong> -->
     <label style="float: left;">
                <input type="checkbox" checked="checked" name="chch" onclick="allCheck()">
<!--                 <span class="clicked_deal"><i class="blind">상품 전체 선택</i></span> -->
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
          	<div style="float:left;"><input type="checkbox" name="chch" id="di${di.di_num }"></div>
            <img src="/aaa/resources/files/${di.di_sysName.split(',')[0] }"  style="padding-left:70px; width: 300px; height:200px;float:left;"/>
            <div class="ib-info-meta"style="float: left;width:550px;">
              <div>
              	<p><span style="width:50%; text-align: center;">${di.di_name }</span>
              		<c:forEach var="corp" items="${corpList }">
              			<c:if test="${corp.c_num==di.di_c_num }">
		              		<span style="width:50%;text-align: right;" onclick="momomo()" >${corp.c_name }</span>
              			</c:if>
              		</c:forEach>
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
<!--           </div> -->
                
        </div>
        
      </c:forEach>
<!--       </li> -->
<!-- end bundle product -->
<!--     </ul> -->
</div>

<script type="text/javascript">
	function momomo() {
		window.open("/aaa/WEB-INF/views/dealPage/popup.jsp","CorpInfo","width=400;height=400;");
	}
	function allCheck() {
		var ac = document.getElementsByName("chch");
		if(ac.item(0).checked)
			for(var i=1;i<ac.length;i++)
				ac.item(i).setAttribute("checked",true);
		else
			for(var i=1;i<ac.length;i++)
				ac.item(i).removeAttribute("checked");
	}
	
	function amountA(ddd,zzz) {
		if(zzz==0){
			if(parseInt(document.getElementById("d"+ddd).value)==1){
				alert("최소 구매수량보다 작습니다.");
				return;
			}			
			document.getElementById("d"+ddd).value=parseInt(document.getElementById("d"+ddd).value)-1;
		}else if(zzz==1)
			document.getElementById("d"+ddd).value=parseInt(document.getElementById("d"+ddd).value)+1;
		ddtotal();
		
	}
	$(ddtotal());
	$(allCheck());
	function ddtotal() {
// 		alert("alal");
		var dChilds = document.getElementsByClassName("dealD");
		var dtotal=0;
// 		alert("size"+dChilds.length);
		for(var i=0;i<dChilds.length;i++){
// 			alert(dChilds.item(i).getElementsByTagName("span").item(1).id);
			dChilds.item(i).getElementsByTagName("span").item(1).innerHTML=parseInt(dChilds.item(i).getElementsByTagName("input").item(0).value)*parseInt(dChilds.item(i).getElementsByTagName("span").item(1).id);
// 			dtotal += parseInt(dChilds.item(i).getElementsByTagName("span").item(1).nodeValue);
		}
		ditotal();
	}
	function ditotal(){
		var diChilds = document.getElementsByClassName("dealI");
		for(var j=0;j<diChilds.length;j++){
			var ddChilds = diChilds.item(j).getElementsByClassName("dealD");
// 			alert("agagaga : " + ddChilds.innerHTML);
			var toto = 0;
			for(var k=0;k<ddChilds.length;k++){
// 				alert(ddChilds.item(k).getElementsByTagName("span").item(1).innerHTML);
				toto += parseInt(ddChilds.item(k).getElementsByTagName("span").item(1).innerHTML);
			}
// 			alert(toto);
			diChilds.item(j).getElementsByClassName("diprice").item(0).innerHTML=toto;
		}
		total();
	}
	function total() {
		var dealChilds = document.getElementsByClassName("dealI");
		var ttotal = 0;
		for(var w=0;w<dealChilds.length;w++){
// 		alert("total : "+ttotal);
			ttotal+=parseInt(dealChilds.item(w).getElementsByClassName("diprice").item(0).innerHTML)+2500;
		}
		document.getElementById("total").childNodes.item(1).innerHTML=ttotal;
	}
	function cartdelete() {
		var chList = document.getElementsByName("chch");
		var nums="";
		for(var q=1;q<chList.length;q++){
			if(chList.item(q).checked){
				nums += chList.item(q).id + ",";
				alert("nums : "+nums);
			}
		}
		if(nums==""){
			alert("선택된 상품이 없습니다.");
			return;
		}
		if("${memLogin}"==""){
			var gcart = getCart();
			alert("getCart() : "+gcart);
			gCartList = gcart.split("-");
			var scList="";
			for(var f=0;f<gCartList.length-1;f++){
				for(var a=0;a<nums.split(",").length-1;a++){
					alert("num : "+nums.split(",")[a].substring(2));
					if(gCartList[f].split(",")[0]!=nums.split(",")[a].substring(2)){
						alert("GGGGG");
						scList += gCartList[f]+"-";
					}}
			}
			alert("scList : " + scList);
			document.cookie="cart="+scList+";path=/";
			location.href="/aaa/cart/page?c_info="+scList;
		}else {
			location.href="/aaa/cart/delete?nums="+nums;
		}
	}
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
// 	function setCart() {
// // 		var nn = "";
// // 		var ccList=document.getElementById("cartList").childNodes;
// // 		for(var b=0;b<ccList.length;b++){
// // 			var cNode = "c"+ccList.item(b).getElementsByTagName("input").item(0).id;
// // 			var ppList = document.getElementById(cNode).value.split(",");
// // 			nn+=${di.di_num}+","+ppList[0]+","+ccList.item(b).getElementsByTagName("input").item(0).value+","+ppList[3]+"-";
// // 		}
// // 		if(getCart()!=""){
// // 			nn+= getCart();
// // 		}
// 		document.cookie="cart="+nn+";path=/";
// 	}
</script>


</body>
</html>
