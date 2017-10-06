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
</head>
<body>

<div class="gnb_area">
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
