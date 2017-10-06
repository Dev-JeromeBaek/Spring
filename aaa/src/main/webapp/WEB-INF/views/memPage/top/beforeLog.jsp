<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<div class="gnb_area">
    <div class="global" id="globalgnb">
		<div class="login_off">
			<a href="/aaa/mem/loginForm" class="login"
				title="로그인 화면 이동">로그인</a>
			<a href="/aaa/mem/registration" class="join"
				title="회원가입화면 이동">회원가입<span class="bar">|</span></a>
		</div>
		<ul>
            <li><a href="/aaa/mem/loginForm">마이페이지</a>
                <ul>
	                <li><a href="/aaa/mem/loginForm"><span>구매&middot;배송 조회</span></a></li>
	                <li><a href="/aaa/mem/loginForm"><span>취소&middot;환불&middot;교환</span></a></li>
	                <li><a href="/aaa/mem/loginForm"><span>캐쉬&middot;적립금</span></a></li>
					<li><a onclick="gradePop()" style="cursor: pointer;"><span>회원등급&middot;멤버십</span></a></li>
                </ul>
            </li>
            <li><span class="bar">|</span><a href="/aaa/mem/everyQnA">고객센터</a>
                <ul>
	                <li><a href="/aaa/mem/everyQnA"><span>자주묻는질문</span></a></li>
	                <li><a href="/aaa/mem/loginForm"><span>1:1 문의하기</span></a></li>
	                <li><a href="/aaa/admin/noticeList"><span>공지사항</span></a></li>
                </ul>
            </li>
            <li><span class="bar">|</span><a href="/aaa/corpJoin/corpLogin">더보기</a>
                <ul>
	                <li><a href="/aaa/corpJoin/corpLogin"><span>입점&middot;제휴문의</span></a></li>
	                <%-- 기업회원  --%>
                </ul>
            </li>
             <li>
            <span class="bar">|</span>
            <a style="cursor:pointer" class="redirect_cart" onclick="goCart()">
            <span class="ico_cart"><img style="margin-bottom: 3px;" alt="" src="/aaa/resources/img/yeob/ico_cart.png">
            </span>
            <strong><a onclick="goCart()" style="cursor: pointer;" >장바구니</a></strong> 
            <em class="num_area" onclick="goCart()"><strong id="cartcc">0</strong>
            <span></span>
            </em>
            </a>
            </li>
		</ul>
	</div>
</div>
<script type="text/javascript">
	function gradePop() {
		var url = "/aaa/main/gradePop";	
		var popname = "등급안내페이지";
		var size = "width=745px, height=510px, left=500px, top=200px";
		window.open(url, popname, size);
	}

function goLogin() {
	location.href="/aaa/mem/login";
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
function goCart() {
	location.href="/aaa/cart/page?c_info="+getCart();
}
// $(function(){
	var cart = getCart();
	var cc=0;
	if(cart!=""){
		var listt = cart.split("-");
		ff : for(var ww=0;ww<listt.length-1;ww++){
			if(listt[ww]!=""){
				for(var ee=0;ee<ww;ee++){
					if(listt[ee]!=""){
						if(listt[ww].split(",")[0]==listt[ee].split(",")[0])
							continue ff;
					}
				}
				cc=cc+1;
			}
		}
	}
	document.getElementById("cartcc").innerHTML=cc;
// });
</script>
</body>
</html>
