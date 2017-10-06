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
		        <form name="search_form" method="post" action="">
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
<!-- 			<li class="menu1 menu_01"> -->
<!-- 				<div class="link" style="cursor: default;">전체보기</div> -->
<!-- 				<div class="sub_menu1 sub_bg1"> -->
<!-- 					<div class="menu_sub"> -->
<!-- 						<div class="link_sub" style="cursor:default;">패션-뷰티</div> -->
<!-- 						<div class="sub_sub_menu sub_sub_bg1"> -->
<!-- 							<div> -->
<!-- 								<a href="fashon_woman">여성패션</a> -->
<!-- 								<a href="fasion_man_uni">남성·유니섹스패션</a> -->
<!-- 								<a href="fasion_brand_woman">여성브랜드패션</a> -->
<!-- 								<a href="fasion_brand_man">남성브랜드패션</a> -->
<!-- 								<a href="fasion_sports">스포츠패션</a> -->
<!-- 								<a href="fasion_beauty">뷰티</a> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						<a class="link_sub" style="cursor:default;">식품</a> -->
<!-- 						<div class="sub_sub_menu sub_sub_bg2"> -->
<!-- 							<div> -->
<!-- 								<a href="food_fruit_vegetable">과일·채소</a>  -->
<!-- 								<a href="food_sea_meat_egg">수산·정육·계란</a>  -->
<!-- 								<a href="food_instant_processed">즉석·가공식품</a>  -->
<!-- 								<a href="food_kimchi_sidedish_pastes">김치·반찬·장류</a>  -->
<!-- 								<a href="food_snack">스낵</a>  -->
<!-- 								<a href="food_drink">음료</a>  -->
<!-- 								<a href="food_healthy_redginseng">건강·홍삼</a>  -->
<!-- 								<a href="food_diet">다이어트</a> -->
<!-- 								<a href="food_imported">수입식품</a> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						<a class="link_sub" style="cursor:default;">생활-홈-데코</a> -->
<!-- 						<div class="sub_sub_menu sub_sub_bg3"> -->
<!-- 							<div> -->
<!-- 								<a href="life_kitchen_dish">주방용품·식기</a>  -->
<!-- 								<a href="life_detergent_cleanser">세제·세안</a>  -->
<!-- 								<a href="life_storage_clean">수납·정리</a>  -->
<!-- 								<a href="life_cleaning_product">청소용품</a>  -->
<!-- 								<a href="life_wash_bath">세탁·욕실용품</a>  -->
<!-- 								<a href="home_bedroom">침실가구</a>  -->
<!-- 								<a href="home_living_storage">거실·수납가구</a>  -->
<!-- 								<a href="home_kitchen">주방가구</a> -->
<!-- 								<a href="home_library_office">서재·사무용가구</a> -->
<!-- 								<a href="home_bedroom_curtain">침실·커튼</a> -->
<!-- 								<a href="deco_candle_diffuser">캔들·디퓨저</a> -->
<!-- 								<a href="deco_build_diy_landscape">시공·DIY·조경</a> -->
<!-- 								<a href="deco_interior">홈·인테리어소품</a> -->
<!-- 							</div> -->
<!-- 						</div>	 -->
<!-- 						<a class="link_sub" style="cursor:default;">가전-디지털</a> -->
<!-- 						<div class="sub_sub_menu sub_sub_bg4"> -->
<!-- 							<div> -->
<!-- 								<a href="appliance_tv_refrigerator_washing">TV·냉장고·세탁기</a>  -->
<!-- 								<a href="appliance_season">계절가전</a> -->
<!-- 								<a href="appliance_life">생활가전</a> -->
<!-- 								<a href="appliance_kitchen">주방가전</a> -->
<!-- 								<a href="appliance_car">차량용디지털기기</a> -->
<!-- 								<a href="digital_notbook_tablet_pc">노트북·태블릿·PC</a> -->
<!-- 								<a href="digital_game_software">게임·소프트웨어</a> -->
<!-- 								<a href="digital_storage_others">저장장치·주변기기</a> -->
<!-- 								<a href="digital_moniter_printer">모니터·프린터</a> -->
<!-- 								<a href="digital_mobile_acc">모바일·액세서리</a> -->
<!-- 								<a href="digital_camera_video_sound">카메라·영상·음향</a> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						<a class="link_sub" style="cursor:default;">지역</a> -->
<!-- 						<div class="sub_sub_menu sub_sub_bg5"> -->
<!-- 							<div> -->
<!-- 								<a href="loca_Gangnam">강남</a> -->
<!-- 								<a href="loca_HongikUniv_Hapjeong_Sangsu">홍대·합정·상수</a>  -->
<!-- 								<a href="loca_Myeongdong_Cityhall_Junggu">명동·시청·중구</a>  -->
<!-- 								<a href="loca_Jamsill_Sincheon">잠실·신천</a>  -->
<!-- 								<a href="loca_Seocho_Bangbae_Yangjae">서초·방배·양재</a>  -->
<!-- 								<a href="loca_Daehangno_Suyu">대학로·수유</a>  -->
<!-- 								<a href="loca_Apgujeong_Garosugil">압구정·가로수</a>  -->
<!-- 								<a href="loca_Sinchon_EwhaUniv_Gongdeok">신촌·이대·공덕</a>  -->
<!-- 								<a href="loca_Jongno_Gwanghwamun">종로·광화문</a>  -->
<!-- 								<a href="loca_songpa_Bangi_Garak">송파·방이·가락</a>  -->
<!-- 								<a href="loca_Gangseo_Yangcheon">강서·양천</a>  -->
<!-- 								<a href="loca_Nowon_Dobong">노원·도봉</a>  -->
<!-- 								<a href="loca_Cheongdam_Hakdong_Nonhyeon">청담·학동·논현</a>  -->
<!-- 								<a href="loca_Sangam_Eunpyeong">상암·은평</a>  -->
<!-- 								<a href="loca_Itaewon_Hannam">이태원·한남</a>  -->
<!-- 								<a href="loca_Gangdong_Cheonho_Gildong">강동·천호·길동</a>  -->
<!-- 								<a href="loca_Gwanak_Dongjak_Sadang">관악·동작·사당</a>  -->
<!-- 								<a href="loca_Seongdong_Dongdaemun">성동·동대문</a>  -->
<!-- 								<a href="loca_Samseong_Yeoksam_Daechi">삼성·역삼·대치</a> -->
<!-- 								<a href="loca_Guro_Yeongdeungpo">구로·영등포</a> -->
<!-- 								<a href="loca_Konkuk_Guui_Jungnang">건대·구의·중랑</a> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</li> -->
			<li class="menu menu_02">
				<div class="link" style="cursor: default;">패션-뷰티</div>
				<div class="sub_menu sub_bg2">
					<div>
						<a href="fashon_woman">여성패션</a>
						<a href="fasion_man_uni">남성·유니섹스패션</a>
						<a href="fasion_brand_woman">여성브랜드패션</a>
						<a href="fasion_brand_man">남성브랜드패션</a>
						<a href="fasion_sports">스포츠패션</a>
						<a href="fasion_beauty">뷰티</a>
					</div>
				</div>
			</li>
			<li class="menu menu_03">
				<div class="link" style="cursor: default;">식품</div>
				<div class="sub_menu sub_bg3">
					<div>
						<a href="food_fruit_vegetable">과일·채소</a> 
						<a href="food_sea_meat_egg">수산·정육·계란</a> 
						<a href="food_instant_processed">즉석·가공식품</a> 
						<a href="food_kimchi_sidedish_pastes">김치·반찬·장류</a> 
						<a href="food_snack">스낵</a> 
						<a href="food_drink">음료</a> 
						<a href="food_healthy_redginseng">건강·홍삼</a> 
						<a href="food_diet">다이어트</a>
						<a href="food_imported">수입식품</a>
					</div>
				</div>
			</li>

			<li class="menu menu_06">
				<div class="link" style="cursor: default;">생활-홈-데코</div>
				<div class="sub_menu sub_bg4">
<!-- 					<div class="sub_menu sub_bg4 sub1"> -->
					<div>
						<a href="life_kitchen_dish">주방용품·식기</a> 
						<a href="life_detergent_cleanser">세제·세안</a> 
						<a href="life_storage_clean">수납·정리</a> 
						<a href="life_cleaning_product">청소용품</a> 
						<a href="life_wash_bath">세탁·욕실용품</a> 
						<a href="home_bedroom">침실가구</a> 
						<a href="home_living_storage">거실·수납가구</a> 
						<a href="home_kitchen">주방가구</a>
						<a href="home_library_office">서재·사무용가구</a>
						<a href="home_bedroom_curtain">침실·커튼</a>
						<a href="deco_candle_diffuser">캔들·디퓨저</a>
						<a href="deco_build_diy_landscape">시공·DIY·조경</a>
						<a href="deco_interior">홈·인테리어소품</a>
					</div>
				</div>
			</li>

			<li class="menu menu_05">
				<div class="link" style="cursor: default;">가전-디지털</div>
				<div class="sub_menu sub_bg5">
					<div>
						<a href="/aaa/appliance_digital/digitalList?tv_refrigerator_washing=tv_refrigerator_washing">TV·냉장고·세탁기</a> 
						<a href="/aaa/appliance_digital/digitalList?season=season">계절가전</a>
						<a href="/aaa/appliance_digital/digitalList?life=life">생활가전</a>
						<a href="/aaa/appliance_digital/digitalList?kitchen=kitchen">주방가전</a>
						<a href="/aaa/appliance_digital/digitalList?car=car">차량용디지털기기</a>
						<a href="/aaa/appliance_digital/digitalList?notbook_tablet_pc=notbook_tablet_pc">노트북·태블릿·PC</a>
						<a href="/aaa/appliance_digital/digitalList?game_software=game_software">게임·소프트웨어</a>
						<a href="/aaa/appliance_digital/digitalList?storage_others=storage_others">저장장치·주변기기</a>
						<a href="/aaa/appliance_digital/digitalList?moniter_printer=moniter_printer">모니터·프린터</a>
						<a href="/aaa/appliance_digital/digitalList?mobile_acc=mobile_acc">모바일·액세서리</a>
						<a href="/aaa/appliance_digital/digitalList?camera_video_sound=camera_video_sound">카메라·영상·음향</a>
					</div>
				</div>
			</li>
			
			<li class="menu menu_04">
				<div class="link" style="cursor: default;">지역</div>
				<div class="sub_menu sub_bg6">
					<div>
						<a href="loca_Gangnam">강남</a>
						<a href="loca_HongikUniv_Hapjeong_Sangsu">홍대·합정·상수</a> 
						<a href="loca_Myeongdong_Cityhall_Junggu">명동·시청·중구</a> 
						<a href="loca_Jamsill_Sincheon">잠실·신천</a> 
						<a href="loca_Seocho_Bangbae_Yangjae">서초·방배·양재</a> 
						<a href="loca_Daehangno_Suyu">대학로·수유</a> 
						<a href="loca_Apgujeong_Garosugil">압구정·가로수</a> 
						<a href="loca_Sinchon_EwhaUniv_Gongdeok">신촌·이대·공덕</a> 
						<a href="loca_Jongno_Gwanghwamun">종로·광화문</a> 
						<a href="loca_songpa_Bangi_Garak">송파·방이·가락</a> 
						<a href="loca_Gangseo_Yangcheon">강서·양천</a> 
						<a href="loca_Nowon_Dobong">노원·도봉</a> 
						<a href="loca_Cheongdam_Hakdong_Nonhyeon">청담·학동·논현</a> 
						<a href="loca_Sangam_Eunpyeong">상암·은평</a> 
						<a href="loca_Itaewon_Hannam">이태원·한남</a> 
						<a href="loca_Gangdong_Cheonho_Gildong">강동·천호·길동</a> 
						<a href="loca_Gwanak_Dongjak_Sadang">관악·동작·사당</a> 
						<a href="loca_Seongdong_Dongdaemun">성동·동대문</a> 
						<a href="loca_Samseong_Yeoksam_Daechi">삼성·역삼·대치</a>
						<a href="loca_Guro_Yeongdeungpo">구로·영등포</a>
						<a href="loca_Konkuk_Guui_Jungnang">건대·구의·중랑</a>
					</div>
				</div>
			</li>
			
		</ul>
		</div>
	</div>
</div>
	
</body>
</html>
