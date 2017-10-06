<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
		<style type="text/css">
			.preViewList a:hover {
				opacity : 0.5;
				border : solid 2px;
			}
		</style>

	<meta charset="UTF-8">
	<title>Yoeb's Home</title>
	<spring:url value="/resources/js/yeob/httpRequest.js" var="httpRequest_js"/>
	<spring:url value="/resources/js/yeob/jquery-1.8.3.min.js" var="min_js"/>
	<script src="${ httpRequest_js }"></script>
	<script src="${ min_js }"></script>
	
	
	<script type="text/javascript">
		function searchWord() {
			var target = document.getElementById("search_keyword");
			var searchParams = target.value.trim();
			var nowKeyLength = searchParams.length;
			var preView = document.getElementById("preView");
				preView.style.display="";
			if( searchParams == "" || nowKeyLength == 0) {
				
				if(nowKeyLength ==0) {
					preView.style.display = "none";
				}
				return;
			}
			var params = "key="+searchParams;
			sendRequest("/aaa/searchKeyWord/KeyWord", params, callback03, "post");
		}
		
		function callback03() {
			if(httpRequest.readyState ==4) {
				if(httpRequest.status ==200) {
					
					var rcvData = httpRequest.responseText;
					var preViewList = document.getElementById("preViewList")
					preViewList.innerHTML = rcvData;
					preViewList.style.border= "1px solid red";
				} else {
					alert("*** 실패 : " + httpRequest.status);
				}
			}
			
		}
	</script>
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"60168",secure:"60173"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-138" data-genuitec-path="/aaa/src/main/webapp/WEB-INF/views/yeob/top/topIndex.jsp">
<div style="background-color: white; opacity: 0.9; width: 1500px; height: 230px; left: 200px; top: 50px; position: relative; z-index: 1" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-138" data-genuitec-path="/aaa/src/main/webapp/WEB-INF/views/yeob/top/topIndex.jsp">
<div class="topMid" style="position: relative; z-index: 999999 ;">
	<div class="bannerArea" style="width:550px; height: 300px; top: 24px; left: -245px; position: absolute; z-index: 300">
		<a href="/aaa/">
			<img alt="" src=" /aaa/resources/img/yeob/5_White_logo_on_black_264x66.png"
				style="width:380px; height: 110px; background: ; position: absolute; z-index: 302;"
				title="홈으로 이동하기">
		</a>
	</div>  
<!-- 	<div class="searchArea" style="margin-left: 0px; top: -20px; position: inherit; z-index: 305"> -->
	<div class="searchArea" style="margin-left: 550px; top: 23px; position: inherit; z-index: 305 border:none;width:128px;height:25px;padding:6px 15px 4px 15px;background:#fff;" >
		<div class="srchbar" style="background-color: white;">
		    <div class="src_area" id="search_form">
		        <form name="search_form" method="post" action="/aaa/searchKeyWord/SearchClick">
		                <label for="top_srch">
		                    <input type="text" name="keyword"
		                    	id="search_keyword" style="height: 34px; width: 460px; margin:1px;border: 0px solid white; outline-color: none;" 
		                    	placeholder="검색어 입력"
		                    	maxlength="30" value="" autocomplete="off" 
		                    	title="검색어 입력" onkeyup="searchWord()"/>
		                </label>
		                <button type="submit" id="search_submit" 
		                		class="btn_search" title="검색하기">
		                <img alt="" src="/aaa/resources/img/yeob/bt_search.png"
		                	style="margin-left: 10px; width: 28px; height: 28px;">
		                		</button>
		                		<br><br><br>
		                <div id="preView" style="background-color: white; display: ;">
			                 <div id="preViewList" style="font-size: 1.5em;"></div>
			            </div>
		        </form>
		    </div>
        </div>
	</div>
</div>


<!-- uio_auto_keyword -->
<div id="top_wrap" style="position: relative; z-index: 99999 ; margin-left: 0px; margin-top: 45px;">
	<div class="bg_top" style="background-color: rgba(78,68,48,0.75);"></div>
	<!-- 탑메뉴 -->
		<div class="top_menu" style="color: black;">
		<ul id="gnb" class="gnb">
			<li class="menu menu_01">
				<div class="link" style="cursor: default;"><a href="/aaa/">전체보기</a></div>
				<div class="sub_menu sub_bg1">
				</div>
			</li>
			<li class="menu menu_02">
				<div class="link" style="cursor: default;">패션-뷰티</div>
				<div class="sub_menu sub_bg2">
					<div>
						<a href="/aaa/fashion/fashion_beauty?fashion_woman=fashion_woman">여성패션</a>
						<a href="/aaa/fashion/fashion_beauty?fashion_man_uni=fashion_man_uni">남성·유니섹스패션</a>
						<a href="/aaa/fashion/fashion_beauty?fashion_brand_woman=fashion_brand_woman">여성브랜드패션</a>
						<a href="/aaa/fashion/fashion_beauty?fashion_brand_man=fashion_brand_man">남성브랜드패션</a>
						<a href="/aaa/fashion/fashion_beauty?fashion_sports=fashion_sports">스포츠패션</a>
						<a href="/aaa/fashion/fashion_beauty?fashion_beauty=fashion_beauty">뷰티</a>
					</div>
				</div>
			</li>
			<li class="menu menu_03">
				<div class="link" style="cursor: default;">식품</div>
				<div class="sub_menu sub_bg3">
					<div style="z-index: 999999999999;">
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
						<a href="/aaa/local/Gangnam">강남</a>
						<a href="/aaa/local/HongikUniv_Hapjeong_Sangsu">홍대·합정·상수</a> 
						<a href="/aaa/local/Myeongdong_Cityhall_Junggu">명동·시청·중구</a> 
						<a href="/aaa/local/Jamsill_Sincheon">잠실·신천</a> 
						<a href="/aaa/local/Seocho_Bangbae_Yangjae">서초·방배·양재</a> 
						<a href="/aaa/local/Daehangno_Suyu">대학로·수유</a> 
						<a href="/aaa/local/Apgujeong_Garosugil">압구정·가로수</a> 
						<a href="/aaa/local/Sinchon_EwhaUniv_Gongdeok">신촌·이대·공덕</a> 
						<a href="/aaa/local/Jongno_Gwanghwamun">종로·광화문</a> 
						<a href="/aaa/local/songpa_Bangi_Garak">송파·방이·가락</a> 
						<a href="/aaa/local/Gangseo_Yangcheon">강서·양천</a> 
						<a href="/aaa/local/Nowon_Dobong">노원·도봉</a> 
						<a href="/aaa/local/Cheongdam_Hakdong_Nonhyeon">청담·학동·논현</a> 
						<a href="/aaa/local/Sangam_Eunpyeong">상암·은평</a> 
						<a href="/aaa/local/Itaewon_Hannam">이태원·한남</a> 
						<a href="/aaa/local/Gangdong_Cheonho_Gildong">강동·천호·길동</a> 
						<a href="/aaa/local/Gwanak_Dongjak_Sadang">관악·동작·사당</a> 
						<a href="/aaa/local/Seongdong_Dongdaemun">성동·동대문</a> 
						<a href="/aaa/local/Samseong_Yeoksam_Daechi">삼성·역삼·대치</a>
						<a href="/aaa/local/Guro_Yeongdeungpo">구로·영등포</a>
						<a href="/aaa/local/Konkuk_Guui_Jungnang">건대·구의·중랑</a>
					</div>
				</div>
			</li>
			
		</ul>
		</div>
</div>
</div>
</body>
</html>
