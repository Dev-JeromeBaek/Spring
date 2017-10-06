<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Yoeb's Home</title>
</head>
<body>

<div class="gnb_area">
    <div class="global" id="globalgnb">
		<div class="login_off">
			<a href="/aaa/yeob/adminLogout" class="login"
				title="로그아웃 후 메인">로그아웃</a>
<!-- 			<a href="" class="join" -->
<!-- 				title="회원가입화면 이동">회원가입<span class="bar">|</span></a> -->
		</div>
		<ul>
<!--             <li><a href="">마이페이지</a> -->
<!--                 <ul> -->
<!-- 	                <li><a href=""><span>구매&middot;배송 조회</span></a></li> -->
<!-- 	                <li><a href=""><span>취소&middot;환불&middot;교환</span></a></li> -->
<!-- 	                <li><a href=""><span>캐쉬&middot;적립금</span></a></li> -->
<!-- 	                <li><a href=""><span>재판매 알리미</span></a></li> -->
<!-- 					<li><a href=""><span>회원등급&middot;멤버십</span></a></li> -->
<!--                 </ul> -->
<!--             </li> -->
            <li><span class="bar">|</span><a href="">고객센터</a>
                <ul>
	                <li><a href=""><span>자주묻는질문</span></a></li>
	                <li><a href="/aaa/yeob/adminQnaList"><span>1:1 문의하기</span></a></li>
	                <li><a href=""><span>공지사항</span></a></li>
                </ul>
            </li>
<!--             <li><span class="bar">|</span><a href="">더보기</a> -->
<!--                 <ul> -->
<!-- 	                <li><a href="" ><span>이벤트</span></a></li> -->
<!-- 	                <li><a href="" ><span>모바일</span></a></li> -->
<!-- 	                <li><a href="" ><span>입점&middot;제휴문의</span></a></li> -->
<!--                 </ul> -->
<!--             </li> -->
<!--             <li> -->
<!--             <span class="bar">|</span> -->
<!--             <a style="cursor:pointer" class="redirect_cart"> -->
<!--             <span class="ico_cart"><img style="margin-bottom: 3px;" alt="" src="/aaa/resources/img/yeob/ico_cart.png"> -->
<!--             </span> -->
<!--             <strong>장바구니</strong>  -->
<%--             <em class="num_area"><strong>0: 장바구니 담겨있는 갯수(count)/임시로0넣어놓음</strong> --%>
<!--             <span></span> -->
<!--             </em> -->
<!--             </a> -->
<!--             </li> -->
		</ul>
	</div>
</div>
<div class="topMid">
	<div class="bannerArea">
		<a href="/aaa/">
			<img alt="로고이미지" src="/aaa/resources/img/yeob/logo1.png"
				style="height: 100px; margin-top: 5px;"
				title="홈으로 이동하기">
		</a>
	</div>
	<div class="searchArea">
		<div class="srchbar">
		    <div class="src_area" id="search_form">
		        <form name="search_form" method="GET" action="" onsubmit="return goSearch()">
		                <label for="top_srch">
		                    <input type="text" name="keyword" 
		                    	id="search_keyword" style="outline:none" 
		                    	placeholder="검색어 입력"
		                    	maxlength="30" value="" autocomplete="off" 
		                    	title="검색어 입력"/>
		                    	
		                </label>
		                <button type="submit" id="search_submit" 
		                		class="btn_search" title="검색하기">
		                <img alt="" src="/aaa/resources/img/yeob/bt_search.png">
		                		</button>
		        </form>
		    </div>
        </div>
	</div>
</div>


<!-- uio_auto_keyword -->
<div id="top_wrap">
	<div class="bg_top"></div>
	<div class="container">
	
	<!-- 탑메뉴 -->
		<div class="top_menu">
<!-- 			<h1><a href="/aaa/"><img src="/aaa/resources/img/yeob/logo3.png" alt="메인프로젝트 로고"></a></h1> -->
			<!-- gnb -->
		<ul id="gnb" class="gnb">
			<li class="menu menu_01">
				<a href="/aaa/" class="link">전체보기</a>
				<div class="sub_menu sub_bg1">
					<div>
						<a href="">패션-뷰티</a>
						<a href="">식품</a>
						<a href="">생활-홈-데코</a>
						<a href="">가전-디지털</a>
						<a href="">지역</a>
					</div>
				</div>
			</li>
			<li class="menu menu_02">
				<a href="" class="link">패션-뷰티</a>
				<div class="sub_menu sub_bg2">
					<div>
						<a href="">여성패션</a>
						<a href="">남성·유니섹스패션</a>
						<a href="">여성브랜드패션</a>
						<a href="">남성브랜드패션</a>
						<a href="">스포츠패션</a>
						<a href="">뷰티</a>
					</div>
				</div>
			</li>
			<li class="menu menu_03">
				<a href="" class="link">식품</a>
				<div class="sub_menu sub_bg3">
					<div>
						<a href="">과일·채소·쌀</a> 
						<a href="">수산·정육·계란</a> 
						<a href="">즉석·가공식품</a> 
						<a href="">김치·반찬·장류</a> 
						<a href="">스낵</a> 
						<a href="">음료</a> 
						<a href="">건강·홍삼</a> 
						<a href="">다이어트</a>
						<a href="">수입식품</a>
					</div>
				</div>
			</li>

			<li class="menu menu_06">
				<a href="" class="link">생활-홈-데코</a>
				<div class="sub_menu sub_bg4">
<!-- 					<div class="sub_menu sub_bg4 sub1"> -->
					<div>
						<a href="">과일·채소·쌀</a> 
						<a href="">수산·정육·계란</a> 
						<a href="">즉석·가공식품</a> 
						<a href="">김치·반찬·장류</a> 
						<a href="">스낵</a> 
						<a href="">음료</a> 
						<a href="">건강·홍삼</a> 
						<a href="">다이어트</a>
						<a href="">수입식품</a>
					</div>
				</div>
			</li>

			<li class="menu menu_05">
				<a href="" class="link">가전-디지털</a>
				<div class="sub_menu sub_bg5">
					<div>
						<a href="">TV·냉장고·세탁기</a> 
						<a href="">계절가전</a>
						<a href="">생활가전</a>
						<a href="">주방가전</a>
						<a href="">차량용디지털기기</a>
						<a href="">노트북·태블릿·PC</a>
						<a href="">게임·소프트웨어</a>
						<a href="">저장장치·주변기기</a>
						<a href="">모니터·프린터</a>
						<a href="">모바일·액세서리</a>
						<a href="">카메라·영상·음향</a>
						
					</div>
				</div>
			</li>
			
			<li class="menu menu_04">
				<a href="" class="link">지역</a>
				<div class="sub_menu sub_bg6">
					<div>
						<a href="">강남</a>
						<a href="">홍대·합정·상수</a> 
						<a href="">명동·시청·중구</a> 
						<a href="">잠실·신천</a> 
						<a href="">서초·방배·양재</a> 
						<a href="">대학로·수유</a> 
						<a href="">압구정·가로수</a> 
						<a href="">신촌·이대·공덕</a> 
						<a href="">종로·광화문</a> 
						<a href="">송파·방이·가락</a> 
						<a href="">강서·양천</a> 
						<a href="">노원·도봉</a> 
						<a href="">청담·학동·논현</a> 
						<a href="">상암·은평</a> 
						<a href="">이태원·한남</a> 
						<a href="">강동·천호·길동</a> 
						<a href="">관악·동작·사당</a> 
						<a href="">성동·동대문</a> 
						<a href="">삼성·역삼·대치</a>
						<a href="">구로·영등포</a>
						<a href="">건대·구의·중랑</a>
						
						
					</div>
				</div>
			</li>
			
		</ul>
		</div>
	</div>
</div>
	
	
</body>
</html>
