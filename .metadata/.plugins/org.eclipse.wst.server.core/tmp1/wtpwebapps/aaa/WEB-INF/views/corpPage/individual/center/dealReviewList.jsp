<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

/* Icon set - http://ionicons.com */
@import url(https://fonts.googleapis.com/css?family=Raleway:400,500,700);

@import url(http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css);

.snip1268 {

	font-family: 'Raleway', Arial, sans-serif;
	position: relative;
	float: left;
	overflow: hidden;
	margin: 10px 1%;
	width: 220px;
	max-width: 310px;
	width: 100%;
	height :500px;
	color: #333333;
	text-align: center;
	background-color:#e6e6e6;
	<%--#e6eeff
		#e1e1d0
	 --%>
	line-height: 1.6em;
}

.snip1268 * {
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	-webkit-transition: all 0.6s ease;
	transition: all 0.6s ease;
}

.snip1268 .image {
	position: relative;
}

.snip1268 img {
	width: 100%;
	height:300px;
	vertical-align: top;
	-webkit-transition: opacity 0.35s;
	transition: opacity 0.35s;
}

.snip1268 .icons, .snip1268 .add-to-cart {
	position: absolute;
	left: 20px;
	right: 20px;
	opacity: 0;
}

.snip1268 .icons {
	-webkit-transform: translateY(-100%);
	transform: translateY(-100%);
	top: 20px;
	display: flex;
	justify-content: space-between;
}

.snip1268 .icons a {
	width: 32.5%;
	background: #ffffff;
}

.snip1268 .icons a:hover {
	background: #000000;
}

.snip1268 .icons a:hover i {
	color: #ffffff;
	opacity: 1;
}

.snip1268 .icons i {
	line-height: 46px;
	font-size: 20px;
	color: #000000;
	text-align: center;
	opacity: 0.7;
	margin: 0;
}

.snip1268 .add-to-cart {
	position: absolute;
	bottom: 20px;
	-webkit-transform: translateY(100%);
	transform: translateY(100%);
	font-size: 0.8em;
	color: #000000;
	line-height: 46px;
	letter-spacing: 1.5px;
	background-color: #ffffff;
	font-weight: 500;
	text-decoration: none;
	text-transform: uppercase;
}

.snip1268 .add-to-cart:hover {
	background: #000000;
	color: #ffffff;
}

.snip1268 figcaption {
	padding: 20px 20px 30px;
}

.snip1268 h2, .snip1268 p {
	margin: 0;
	text-align: left;
}

.snip1268 h2 {
	margin-bottom: 10px;
	font-weight: 700;
}

.snip1268 p {
	margin-bottom: 15px;
	font-size: 1em;
	font-weight: 400;
}

.snip1268 .price {
	font-size: 1.5em;
	opacity: 1;
	font-weight: 700;
	text-align: right;
	
}

.snip1268:hover img, .snip1268.hover img {
	opacity: 0.8;
}

.snip1268:hover .icons, .snip1268.hover .icons, .snip1268:hover .add-to-cart,
	.snip1268.hover .add-to-cart {
	-webkit-transform: translateY(0);
	transform: translateY(0);
	opacity: 1;
	
}


/* Demo purposes only */
</style>
<script type="text/javascript">
	/* Demo purposes only */
	$(".hover").mouseleave(function() {
		$(this).removeClass("hover");
	});
</script>
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"60168",secure:"60173"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-39" data-genuitec-path="/aaa/src/main/webapp/WEB-INF/views/corpPage/individual/center/dealReviewList.jsp">

  <c:choose>
	<c:when test="${!diList.isEmpty()}"> 
		<c:forEach var="i" items="${diList}">
		<figure class="snip1268">
		<div class="image">
			<img src="/aaa/resources/files/${i.di_sysName.split(',')[0]}" alt="sq-sample4"/>
			<!-- <script type="text/javascript">
			alert("${i.di_sysName.split(',')[0]}");
			</script> -->
			<div class="icons">
				     <!--  <a href="#"><i class="ion-star"></i></a>
				      <a href="#"> <i class="ion-share"></i></a>
				      <a href="#"> <i class="ion-search"></i></a> -->
			</div>
			<a href="/aaa/idvCorp/dealReviewManagement?num=${i.di_num}" class="add-to-cart">보러가기</a>
		</div>
		<figcaption>
			<h2>${i.di_name}</h2>
			<p>${i.di_exp}</p>
			<div class="price">
			<c:forEach var="cc" items="${DRCountList }">
			<c:if test="${cc.inte1==i.di_num }">
			${cc.inte2}
			</c:if>
			</c:forEach>
			</div>
		</figcaption>
	</figure>
	
		</c:forEach>
 	</c:when>
	<c:otherwise>
		등록된 상품이 없습니다 <br>
		등록후 이용해주십시오
	</c:otherwise>
</c:choose> 
	<script type="text/javascript" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-39" data-genuitec-path="/aaa/src/main/webapp/WEB-INF/views/corpPage/individual/center/dealReviewList.jsp">
	var prices = document.getElementsByClassName("price");
	for(var p=0;p<prices.length;p++){
// 		alert(prices.item(p).innerHTML);
		if(prices.item(p).innerHTML.trim()=="")
			prices.item(p).innerHTML=0;
	}
	</script>
</body>
</html>

