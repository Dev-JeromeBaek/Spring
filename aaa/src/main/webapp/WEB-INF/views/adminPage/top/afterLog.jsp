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
		<div class="login_on">
			<%-- 관리자 마이페이지 에선 관리자가 볼수 있는 여러 정보 확인. --%>
			<a href="<%-- 마이페이지 이동 --%>" class="user">${ adminLogin }님<%-- 이름입력 --%></a>
			<a href="/aaa/admin/adminLogout" class="logout" title="로그아웃">로그아웃</a>
		</div>
		<ul>
            <li><a href="<%-- 마이페이지로 이동 --%>">일반회원관리</a>
                <ul>
	                <li><a href="/aaa/admin/showMemList"><span>회원전체보기</span></a></li>
	                <li><a href="/aaa/admin/adminQnaList"><span>1:1 문의관리</span></a></li>
					<li><a onclick="gradePop()" style="cursor: pointer;"><span>회원등급 &middot; 멤버십</span></a></li>
                </ul>
            </li>
            <li><span class="bar">|</span><a href="">기업회원관리</a>
                <ul>
	                <li><a href="/aaa/admin/corpManagement"><span>기업회원관리</span></a></li>
	                <li><a href="/aaa/admin/dealManagement" ><span>입점 &middot; 제휴관리</span></a></li>
                </ul>
            </li>
            <li><span class="bar">|</span><a href="">DASAM관리</a>
                <ul>
	                <li><a href="/aaa/admin/adminMemo"><span>고객센터</span></a></li>
	                <li><a href="/aaa/admin/noticeList"><span>공지사항작성</span></a></li>
	                <li><a href="/aaa/admin/adminSalesManagement"><span>매출관리</span></a></li>
                </ul>
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
</script>
</body>
</html>
