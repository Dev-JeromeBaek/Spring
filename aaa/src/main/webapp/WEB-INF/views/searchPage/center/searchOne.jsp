<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
		.thumbs img {
		   width: 80px;
		   height: 80px;
		   border: solid 1px #ccc;
		   padding: 5px;
		   margin-bottom: 5px;
		   opacity: 0.5;
		  } 
		  
		.thumbs img:hover {
		  border-color: red;
		  opacity: 1;
		/*    border => 테두리     */
		 }
		  
		#large {
		  width: 400px;
		  height: 300px;
		  border: solid 1px #ccc;
		  padding: 5px;
		  margin-left: 0px;
		  overflow: hidden;
		}
		
		#largeImg {
		  width: 400px;
		  height: 300px; 
		 }
		.thumbs a img{
		  width: 100px;
		  margin-left: 20px;
		}
		
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
		 	padding-left: 55px;
		 	width: 1500px;
		/* 		img{ */
		/* 			width:1000px; */
		/* 			height: 800px; */
		/* 		} */
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
		  background-color: yello;/*#333 검정 */
		  width:1500px;
		/*   padding-left: 55px; */
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
		  width: 343px;
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
		
		
		
		
		
		/* Style the buttons that are used to open and close the accordion panel */
		button.accordion {
		    background-color: #eee;
		    color: #444;
		    cursor: pointer;
		    padding: 60px;
		    width: 67%;
		    text-align: left;
		    border: none;
		    outline: none;
		    transition: 0.4s;
		}
		
		/* Add a background color to the button if it is clicked on (add the .active class with JS), and when you move the mouse over it (hover) */
		button.accordion.active, button.accordion:hover {
		    background-color: #ddd;
		}
		
		/* Style the accordion panel. Note: hidden by default */
		div.panel {
		    padding: 0 55px;
		    background-color: white;
		    display: none;
		    float:left;
		/*     height:100px; */
		}
		
		button.accordion:after {
		    content: '\02795'; /* Unicode character for "plus" sign (+) */
		    font-size: 13px;
		    color: #777;
		    float: right;
		    margin-left: 5px;
		}
		
		button.accordion.active:after {
		    content: "\2796"; /* Unicode character for "minus" sign (-) */
		}
		
		
		
		section{
		 div{
			width: 1500px;
			float:left;
			}
		}
</style>
</head>
<body>

<section id="seTop">
      <!-- Page Content -->
    <div class="container" style="padding-left: 30px; padding-right: 30px;height: 450px; margin-left: 300px;">
        <div class="row">

			<div class="row1">
	            <div id="large" class="col-md-4" >
						<img id="largeImg" class="img-responsive"
							src="/aaa/resources/files/${ (dealInfo.di_sysName).split(',')[0] }">
				</div>
	            <div class="col-md-4" style="width: 500px; height: 300px;">
              	 	<h1 class="page-header">${dealInfo.di_name } </h1><br>
	                <h1>대표가격 : ${dealInfo.di_price }</h1><br>
	                <p>${dealInfo.di_exp }</p><br>
	                <c:if test="${!dealDetail.isEmpty() }">
	                <select name="dd_kind" id="dd_kind" onchange="seleItem()">
	                <option value="0">품목을 선택하세요.</option>
	                <c:forEach var="each" items="${dealDetail }">
	                <option id="c${each.dd_num }" value="${each.dd_num },${each.dd_kind },${each.dd_name },${each.dd_price}">${each.dd_kind } - ${each.dd_name }</option><br>
	                </c:forEach>
	                </select>
	                </c:if>
	                <ul id="cartList"></ul><br>
					<ul id="totalprice"><span>총 구매 가격 : </span>
										<span>0</span>
										<span>원</span>
					</ul><br>
		            <div id="detailBtns">
			            <input type="button" value="바로결제" onclick="cartP('${dealInfo.di_num}')" style="margin-left: 150px; background-color: yellow;" />
			            <input type="button" value="장바구니 담기" onclick="cart()" style="background-color: orange;"/>
		            </div>
	            </div>
			</div>
			<div>
			&nbsp;<br>&nbsp;<br>&nbsp;<br>
			</div>
			<div class="row2">
				<c:forEach var="i" items="${ (dealInfo.di_sysName).split(',')}">
						<div class="thumbs">
							<a href="/aaa/resources/files/${i}">
								<img src="/aaa/resources/files/${i}">
							</a>
						</div>
				</c:forEach>
			</div>
			
        </div>
        <!-- /.row -->
	</div>
</section>



<section id="seDetail">
	<div class="seRow1" style="margin-left: -50px;">
		
		<c:forEach var="i" items="${(dealInfo.di_sysName).split(',') }">
            <div class="col-sm-3 col-xs-6">
				<img src="/aaa/resources/files/${i}" alt="${i}" style="width: 500px; height: 500px; border: solid 1px #ccc">
            </div>
		</c:forEach>
		<div>
			<br>
			<br>
		</div>
	</div>
</section>


<section id="seQnA" style="">
	<div>
		<br>
		<br>
		<p style="font-size: 40px; text-align: left; padding-left: 17%; font: italic bold 3.0em/1em Georgia, serif;">*** 상품 문의 ***</p>
		<br>
		<br>
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
		<br>
		<br>
	</div>
</section>


<section id="review">
	<div>
		<p style="font-size: 40px; text-align: left; padding-left: 17%; font: italic bold 3.0em/1em Georgia, serif;">*** 구매 후기 ***</p>
	</div>
	<div class="reviewRow1" style="text-align: center; margin-left: 150px;" align="center">
		<c:if test="${ !reviewList.isEmpty() }">
		<div class="showTopTop2">
			<div class="leftList1">
			<div class="leftList_sub1">
			<table class="listTable1">
				<thead>
					<tr>
						<th style="width: 100px;">번 호</th>
						<th style="width: 250px;">&nbsp;&nbsp;&nbsp;&nbsp;제 목</th>
						<th style="width: 250px;">&nbsp;&nbsp;&nbsp;&nbsp;내 용</th>
						<th style="width: 100px;">조회수</th>
						<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;등록일자</th>
					</tr>
				</thead>
				<tbody class="View">
				<c:forEach items="${ reviewList }" var="i" begin="0" end="${ reviewList.size()<10 ? reviewList.size() : 9 }" step="1" varStatus="status">
					<tr>
						<td style="width: 100px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${ status.count }</td>
						<td style="width: 250px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a onclick="ShowReviewDetail(${ i.getDr_num() },${i.getDr_score() })">${ i.getDr_title_sub() }</a></td>
						<td style="width: 250px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a onclick="ShowReviewDetail(${ i.getDr_num() },${i.getDr_score() })">${ i.getDr_content_sub() }</a></td>
						<td style="width: 100px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${ i.getDr_score() }</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${ i.getDr_date_string() }</td>
					</tr>
				</c:forEach>
				</tbody>
				<c:if test="${ reviewList.size() >= 11}">
				<tbody class="hideView">
				<c:forEach items="${ reviewList }" var="i" begin="10" end="${ reviewList.size() }" step="1" varStatus="status">
					<tr>
						<td style="width: 100px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${ status.count+10 }</td>
						<td style="width: 250px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a onclick="ShowReviewDetail(${ i.getDr_num() },${i.getDr_score() })">${ i.getDr_title_sub() }</a></td>
						<td style="width: 250px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a onclick="ShowReviewDetail(${ i.getDr_num() },${i.getDr_score() })">${ i.getDr_content_sub() }</a></td>
						<td style="width: 100px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${ i.getDr_score() }</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${ i.getDr_date_string() }</td>
					</tr>
				</c:forEach>
				</tbody>
				</c:if>
			</table>
			</div>
			<div id="moreList" class="moreDiv"><span>▼ 더보기</span><span>▲ 접어두기</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
			</div>
		</div>
	
	</c:if>
	</div>
</section>

	<script type="text/javascript">
		//	$(function() {
		//	if(screen.top>600){
		//		document.getElementsByClassName("topnav").item(0).style.position="fixed";
		//alert("dddd");
		//	}else{
		//		document.getElementsByClassName("topnav").item(0).style.position="relative";
		//	}
		//});
		
		//function expendImg(i) {
		//	document.getElementById("mainPhoto").src = "/aaa/resources/files/"+i;
		//}
		
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
			var xx=document.createElement("li");
			xx.innerHTML=ppList[1]+" - "+ppList
			[2]+"<button onclick='amountA("+ppList[0]+",0)'>-</button> <input type='text' id='"+ppList[0]+"' value='"+${1}+"' readonly='readonly'style='width:30px;' />"+
				"<button onclick='amountA("+ppList[0]+",1)'>+</button> | "+ppList[3];
			document.getElementById("cartList").appendChild(xx);
			$("#totalprice").show();
			priceCal();
			}
			
			function amountA(ddd,zzz) {
			if(zzz==0){
				if(parseInt(document.getElementById(ddd).value)==1){//////////////////////////////////////////////////
					alert("최소 구매수량보다 작습니다.");
					return;
				}			
				document.getElementById(ddd).value=parseInt(document.getElementById(ddd).value)-1;
			}else if(zzz==1)
				document.getElementById(ddd).value=parseInt(document.getElementById(ddd).value)+1;
			priceCal();
			
		}
		
		function priceCal() {
			var cList = document.getElementById("cartList").childNodes;
			var mmm = document.getElementById("totalprice").getElementsByTagName("span").item(1).nodeValue;
			for(var hh=0;hh<cList.length;hh++){
				mmm += (cList.item(hh).getElementsByTagName("input").item(0).value)*document.getElementById("c"+(cList.item(hh).getElementsByTagName("input").item(0).id)).value.split(",")[3];
			//			alert(mmm); 
			}
			document.getElementById("totalprice").getElementsByTagName("span").item(1).innerHTML=mmm;
			}
			function cartP(num) {
			if("${memLogin}"==""){
				alert("로그인이 필요합니다.");
				location.href="/aaa/mem/loginForm";
				return;
			}
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
			location.href="/aaa/mem/buyPage?&totalprice="+document.getElementById("totalprice").getElementsByTagName("span").item(1).innerHTML+"&coco="+getCoco();
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
				if(cartNodesList.item(rr).getElementsByTagName("input").item(0).value==0){
					alert("수량을 입력해주세요");
					cartNodesList.item(rr).getElementsByTagName("input").item(0).focus();
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
					location.href="/aaa/cart/insert?c_info="+getCart()+"&move=n&di_num="+${dealInfo.di_num};
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
						nn+=${dealInfo.di_num}+","+ppList[0]+","+(parseInt(ccList.item(b).getElementsByTagName("input").item(0).value)+parseInt(ddInfos[2]))+","+ppList[3]+"-";
						continue aa;
					}
				}
				nn+=${dealInfo.di_num}+","+ppList[0]+","+ccList.item(b).getElementsByTagName("input").item(0).value+","+ppList[3]+"-";
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
			//	alert(qnaCon);
			location.href="/aaa/searchKeyWord/insertQna?di_num=${dealInfo.di_num}&qnaCont="+qwer;
		}
		
		$("#totalprice").hide();
		document.cookie="coco=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/";
		
		
		//  ".thumbs a" => class="thumbs"의 내부에 있는 a태크
		$(".thumbs a").hover(
		function(){
		$(this).find("img").css("opacity","1");
		var thisSrc = $(this).attr("href");
		$("#largeImg").attr("src", thisSrc);
		},  
		function(){
		$(this).find("img").css("opacity","0.5");
		
		}  
		);
		//[ 후기 테이블 ] - [ 10개 이상이면 10개만 보였다가 선택 수 총 후기 List 보여주기]
		
		$('.hideView').hide();
		$(document.getElementById("moreList").getElementsByTagName("span").item(1)).hide();
		$("#moreList").click(
		function() {
		//			alert("안녕 나야..");
		$(".hideView").slideToggle();
		
		var lll = document.getElementById("moreList").getElementsByTagName("span");
		$(lll.item(0)).slideToggle();
		$(lll.item(1)).slideToggle();
		//			alert("들어간다");
		}
		);
		
		function ShowReviewDetail(num01, num02) {
		alert(num01 +", "+num02);
		var url = "/aaa/review/ShowReviewDetail?dr_num="+num01+"&dr_score="+num02;
		var popname = num01 + "구매후기 상세페이지";
		var size = "width=870px, height=455px";
		window.open(url, popname, size);
		
		}
	</script>

</body>
</html>