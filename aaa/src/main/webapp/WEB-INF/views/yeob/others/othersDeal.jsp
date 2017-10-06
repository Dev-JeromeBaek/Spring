<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib tagdir="/WEB-INF/tags" prefix="ct"%>
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
	width: 220px;
	max-width: 310px;
	width: 320px;
	height :420px;
	color: #333333;
	text-align: center;
	background-color:#E6E6E6;
	line-height: 1.6em;
	margin: 13px;
	margin-left: 14px;
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

</style>

</head>
<body>
	<div id="postsLoader" style="position: fixed; 
								width: 300px; 
								height: 300px; 
								top: 400px; 
								left: 800px; 
								z-index: 21654984531861651685165" ></div>
	<br>
	<p style="text-align: left; 
			width: 1350px; 
			font-size: xx-large; 
			font-family: '배달의민족 한나는 열한살'; 
			margin-left: 50px; 
			color: #771B1B">Other's Deal</p>
	<div id="main_content">
	<c:forEach var="ii" items="${ othersDealList }" begin="0" end="3" step="1" >
			<figure class="snip1268">
				<div class="image">
					<img src="/aaa/resources/files/${ii.di_sysName.split(',')[0]}" alt=""/>
						<div class="icons">
						</div>
					<a href="/aaa/local/AllLocal?num=${ii.di_num}" 
						class="add-to-cart">보러가기</a>
				</div>
				<figcaption>
					<h2>${ii.di_name	}</h2>
					<p>${ii.di_exp}</p>
					<div class="price">${ii.di_price} 원</div>
				</figcaption>
			</figure>
	</c:forEach>
</div>

</body>
<script type="text/javascript">
	/* Demo purposes only */
	$(".hover").mouseleave(function() {
		$(this).removeClass("hover");
	});
	var pageLoaded = 4;
	var asdf = true;
	$(window).scroll( function() {
		if(!asdf) return;
		if ($(window).scrollTop() == $(document).height() - $(window).height()) {
			// ajax를 추가해서 목록을 받아온다
			$('div#postsLoader').html('<img src="/aaa/resources/img/yeob/ajax-loader.gif">');
			$('div#postsLoader').show();
// 			alert("before sendRequest  : pageLoaded - " + pageLoaded);
			var params = "dealNum="+pageLoaded;
// 			alert("send before");
			sendRequest("/aaa/main/scrollPaging", params, scrollCallBack, "post");
// 			alert("send after");
			
			$("#postsLoader").fadeOut(900);
		}
	});
	
	function scrollCallBack(){
		if(httpRequest.readyState==4){
			if(httpRequest.status==200){
				var infos = httpRequest.responseText;
				var deals = infos.split("-");
				
				for(var i=0;i<4;i++){
 					if(i<(deals.length)-1){
		 				var xx=document.createElement("figure");
						var diInfos = deals[i].split(",");//di_sysName,di_num,di_name,di_exp,di_price
		 				var nn =
			 			"<div class='image'>"
			 			+"<img src='/aaa/resources/files/"+diInfos[0]+"' alt=''/>"
			 			+"<div class='icons'>"
			 			+"</div>"
			 			+"<a href='/aaa/local/AllLocal?num="+diInfos[1]+"' class='add-to-cart'>보러가기</a>"
			 			+"</div>"
			 			+"<figcaption>"
			 			+"<h2>"+diInfos[2]+"</h2>"
			 			+"<p>"+diInfos[3]+"</p>"
			 			+"<div class='price' aaa='test'>"+diInfos[4]+" 원</div>"
			 			+"</figcaption>";
		 				xx.innerHTML=nn;
		 				document.getElementById("main_content").appendChild(xx);
						xx.className="snip1268";
 					}else{
 						alert("딜이 더이상 존재하지 않습니다.");
 						asdf=false;
 						break;
 					}
 				}
 				pageLoaded = pageLoaded+4;
				
			}else{
				alert(" *** 실패 : "+ httpRequest.status + " 관리자에게 문의하세요.");
			}
		}
	}
	
</script>

</html>

