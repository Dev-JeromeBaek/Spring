<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style type="text/css">
	.aa {
		cursor: wait;
	}
	</style>
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"60168",secure:"60173"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-56" data-genuitec-path="/aaa/src/main/webapp/WEB-INF/views/corpPage/top/afterLog.jsp">

<div class="gnb_area" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-56" data-genuitec-path="/aaa/src/main/webapp/WEB-INF/views/corpPage/top/afterLog.jsp">
	<div class="global" id="globalgnb">
		<div class="login_on">
			<a href="<%-- 등급안내페이지이동 --%>" class="level${ corpLogin.getC_grade() }"
				title="[ <%--[ ${ corpGrade } ] 등급입력 --%> ] 등급입니다."><%--[ ${ corpGrade } ] 등급입력 --%></a>
			<a class="aa"  onclick="individual('corpHome')" class="user" title="마이페이지로 이동합니다.">${ corpLogin.getC_name() } </a>
			<a href="/aaa/corp/corpLogout?deleteCorp=NO" class="logout">로그아웃</a>
		</div>
		<ul>
            <li><a class="aa"  onclick="individual('corpHome')">마이페이지</a>
                <ul>
	                <li><a class="aa" onclick="individual('corpHome')"><span>딜(상품) 관리</span></a></li>
	                <li><a class="aa" onclick="individual('memCare')"><span>구매자 현황 관리</span></a></li>
	                <li><a class="aa" onclick="individual('dealQnA')"><span>딜 1:1 문의관리</span></a></li>
	                <li><a class="aa" onclick="individual('dealNotice')"><span>딜 공지사항</span></a></li>
                </ul>
            </li>
             <li><a class="aa"  onclick="individual('chooseAboutDeal')">입점 &middot; 제휴문의</a>
             	<ul>
	                <li><a class="aa" onclick="individual('dealInsert')"><span>딜 판매 신청</span></a></li>
	                <li><a class="aa" onclick="individual('showDealListAll')"><span>판매 리스트 모아보기</span></a></li>
	                <li><a class="aa" onclick="individual('showApproveDealList')"><span>딜 승인 리스트 보기</span></a></li>
	                <li><a class="aa" onclick="individual('showApproveDealList')"><span>딜 취소 리스트 보기</span></a></li>
	                <li><a class="aa" onclick="individual('proposeToAdmin')"><span>관리자에게 질문&middot;건의하기</span></a></li>
                </ul>
             </li>
		</ul>
	</div>
</div>
<script type="text/javascript">
	function individual(urlName) {
		var coName = "${ corpLogin.getC_name() }";
		alert(coName + "개인 페이지로 이동합니다.");
		var url = "/aaa/idvCorp/" + urlName;	//controller쪽으로 가는 url을 의미!
		var popname = "${ corpLogin.getC_name() } Page";
		var size = "width=1800px, height=900px, left=50px, top=50px";
		window.open(url, popname, size);
	}
</script>
</body>
</html>
