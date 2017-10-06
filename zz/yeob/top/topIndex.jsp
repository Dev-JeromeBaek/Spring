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

<!-- <div class="gnb_area"> -->

    <%-- 로그인 전 --%>
<!--     <div class="global" id="globalgnb"> -->
<!-- 		<div class="login_off"> -->
<!-- 			<a href="" class="login" -->
<!-- 				title="로그인 화면 이동">로그인</a> -->
<!-- 			<a href="" class="join" -->
<!-- 				title="회원가입화면 이동">회원가입<span class="bar">|</span></a> -->
<!-- 		</div> -->
		
	<%-- 로그인 후 --%>
<!-- 	<div class="global" id="globalgnb"> -->
<!-- 		<div class="login_on"> -->
<%-- 			<a href="" class="level silver등급입력">5단계(등급)등급입력</a> --%>
<%-- 			<a href="" class="user">특파원님이름입력</a> --%>
<!-- 			<a href="" class="logout">로그아웃</a> -->
<!-- 		</div>	 -->

<!-- 		<ul> -->
<!--             <li><a href="">마이페이지</a> -->
<!--                 <ul> -->
<!-- 	                <li><a href=""><span>구매&middot;배송 조회</span></a></li> -->
<!-- 	                <li><a href=""><span>취소&middot;환불&middot;교환</span></a></li> -->
<!-- 	                <li><a href=""><span>캐쉬&middot;적립금</span></a></li> -->
<!-- 	                <li><a href=""><span>재판매 알리미</span></a></li> -->
<!-- 					<li><a href=""><span>회원등급&middot;멤버십</span></a></li> -->
<!--                 </ul> -->
<!--             </li> -->
<!--             <li><span class="bar">|</span><a href="">고객센터</a> -->
<!--                 <ul> -->
<!-- 	                <li><a href=""><span>자주묻는질문</span></a></li> -->
<!-- 	                <li><a href=""><span>1:1 문의하기</span></a></li> -->
<!-- 	                <li><a href=""><span>공지사항</span></a></li> -->
<!--                 </ul> -->
<!--             </li> -->
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
<%--             <em class="num_area"><strong>0장바구니 담겨있는 갯수(count)/임시로0넣어놓음</strong> --%>
<!--             <span></span> -->
<!--             </em> -->
<!--             </a> -->
<!--             </li> -->
<!-- 		</ul> -->
<!-- 	</div> -->
<!-- </div> -->
<div class="topMid">
	<div class="bannerArea">
		<a href="/aaa/">
			<img alt="" src="/aaa/resources/img/yeob/logo.png"
				style="height: 100px; margin-top: 5px; margin-left: 25px;"
				title="홈으로 이동하기">
		</a>
	</div>
	<div class="searchArea" >
		<div class="srchbar">
		    <div class="src_area" id="search_form">
		        <form name="search_form" method="post" action="/aaa/deal/search/a">
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
				<div class="link" style="cursor: default;">전체보기</div>
				<div class="sub_menu sub_bg1">
					<div>
<!-- 						<div class="totalDeal">패션-뷰티</div> -->
<!-- 						<div class="totalDeal">식품</div> -->
<!-- 						<div class="totalDeal">생활-홈-데코</div> -->
<!-- 						<div class="totalDeal">가전-디지털</div> -->
<!-- 						<div class="totalDeal">지역</div> -->
						<a style="cursor:default;">패션-뷰티</a>
						<a style="cursor:default;">식품</a>
						<a style="cursor:default;">생활-홈-데코</a>
						<a style="cursor:default;">가전-디지털</a>
						<a style="cursor:default;">지역</a>
					</div>
				</div>
			</li>
			<li class="menu menu_02">
				<div class="link" style="cursor: default;">패션-뷰티</div>
				<div class="sub_menu sub_bg2">
					<div>
						<a href="/aaa/deal/fashon/woman">여성패션</a>
						<a href="/aaa/deal/fashon/man_uni">남성·유니섹스패션</a>
						<a href="/aaa/deal/fashon/brand_woman">여성브랜드패션</a>
						<a href="/aaa/deal/fashon/brand_man">남성브랜드패션</a>
						<a href="/aaa/deal/fashon/sports">스포츠패션</a>
						<a href="/aaa/deal/fashon/beauty">뷰티</a>
					</div>
				</div>
			</li>
			<li class="menu menu_03">
				<div class="link" style="cursor: default;">식품</div>
				<div class="sub_menu sub_bg3">
					<div>
						<a href="/aaa/deal/food/fruit_vegetable">과일·채소</a> 
						<a href="/aaa/deal/food/sea_meat_egg">수산·정육·계란</a> 
						<a href="/aaa/deal/food/instant_processed">즉석·가공식품</a> 
						<a href="/aaa/deal/food/kimchi_sidedish_pastes">김치·반찬·장류</a> 
						<a href="/aaa/deal/food/snack">스낵</a> 
						<a href="/aaa/deal/food/drink">음료</a> 
						<a href="/aaa/deal/food/healthy_redginseng">건강·홍삼</a> 
						<a href="/aaa/deal/food/diet">다이어트</a>
						<a href="/aaa/deal/food/imported">수입식품</a>
					</div>
				</div>
			</li>

			<li class="menu menu_06">
				<div class="link" style="cursor: default;">생활-홈-데코</div>
				<div class="sub_menu sub_bg4">
<!-- 					<div class="sub_menu sub_bg4 sub1"> -->
					<div>
						<a href="/aaa/deal/life/kitchen_dish">주방용품·식기</a> 
						<a href="/aaa/deal/life/detergent_cleanser">세제·세안</a> 
						<a href="/aaa/deal/life/storage_clean">수납·정리</a> 
						<a href="/aaa/deal/life/cleaning_product">청소용품</a> 
						<a href="/aaa/deal/life/wash_bath">세탁·욕실용품</a> 
						<a href="/aaa/deal/home/bedroom">침실가구</a> 
						<a href="/aaa/deal/home/living_storage">거실·수납가구</a> 
						<a href="/aaa/deal/home/kitchen">주방가구</a>
						<a href="/aaa/deal/home/library_office">서재·사무용가구</a>
						<a href="/aaa/deal/home/bedroom_curtain">침실·커튼</a>
						<a href="/aaa/deal/deco/candle_diffuser">캔들·디퓨저</a>
						<a href="/aaa/deal/deco/build_diy_landscape">시공·DIY·조경</a>
						<a href="/aaa/deal/deco/interior">홈·인테리어소품</a>
					</div>
				</div>
			</li>

			<li class="menu menu_05">
				<div class="link" style="cursor: default;">가전-디지털</div>
				<div class="sub_menu sub_bg5">
					<div>
						<a href="/aaa/deal/appliance/tv_refrigerator_washing">TV·냉장고·세탁기</a> 
						<a href="/aaa/deal/appliance/season">계절가전</a>
						<a href="/aaa/deal/appliance/life">생활가전</a>
						<a href="/aaa/deal/appliance/kitchen">주방가전</a>
						<a href="/aaa/deal/appliance/car">차량용디지털기기</a>
						<a href="/aaa/deal/digital/notbook_tablet_pc">노트북·태블릿·PC</a>
						<a href="/aaa/deal/digital/game_software">게임·소프트웨어</a>
						<a href="/aaa/deal/digital/storage_others">저장장치·주변기기</a>
						<a href="/aaa/deal/digital/moniter_printer">모니터·프린터</a>
						<a href="/aaa/deal/digital/mobile_acc">모바일·액세서리</a>
						<a href="/aaa/deal/digital/camera_video_sound">카메라·영상·음향</a>
					</div>
				</div>
			</li>
			
			<li class="menu menu_04">
				<div class="link" style="cursor: default;">지역</div>
				<div class="sub_menu sub_bg6">
					<div>
						<a href="/aaa/deal/loca/Gangnam">강남</a>
						<a href="/aaa/deal/loca/HongikUniv_Hapjeong_Sangsu">홍대·합정·상수</a> 
						<a href="/aaa/deal/loca/Myeongdong_Cityhall_Junggu">명동·시청·중구</a> 
						<a href="/aaa/deal/loca/Jamsill_Sincheon">잠실·신천</a> 
						<a href="/aaa/deal/loca/Seocho_Bangbae_Yangjae">서초·방배·양재</a> 
						<a href="/aaa/deal/loca/Daehangno_Suyu">대학로·수유</a> 
						<a href="/aaa/deal/loca/Apgujeong_Garosugil">압구정·가로수</a> 
						<a href="/aaa/deal/loca/Sinchon_EwhaUniv_Gongdeok">신촌·이대·공덕</a> 
						<a href="/aaa/deal/loca/Jongno_Gwanghwamun">종로·광화문</a> 
						<a href="/aaa/deal/loca/songpa_Bangi_Garak">송파·방이·가락</a> 
						<a href="/aaa/deal/loca/Gangseo_Yangcheon">강서·양천</a> 
						<a href="/aaa/deal/loca/Nowon_Dobong">노원·도봉</a> 
						<a href="/aaa/deal/loca/Cheongdam_Hakdong_Nonhyeon">청담·학동·논현</a> 
						<a href="/aaa/deal/loca/Sangam_Eunpyeong">상암·은평</a> 
						<a href="/aaa/deal/loca/Itaewon_Hannam">이태원·한남</a> 
						<a href="/aaa/deal/loca/Gangdong_Cheonho_Gildong">강동·천호·길동</a> 
						<a href="/aaa/deal/loca/Gwanak_Dongjak_Sadang">관악·동작·사당</a> 
						<a href="/aaa/deal/loca/Seongdong_Dongdaemun">성동·동대문</a> 
						<a href="/aaa/deal/loca/Samseong_Yeoksam_Daechi">삼성·역삼·대치</a>
						<a href="/aaa/deal/loca/Guro_Yeongdeungpo">구로·영등포</a>
						<a href="/aaa/deal/loca/Konkuk_Guui_Jungnang">건대·구의·중랑</a>
					</div>
				</div>
			</li>
			
		</ul>
		</div>
	</div>
</div>
	
</body>
</html>
