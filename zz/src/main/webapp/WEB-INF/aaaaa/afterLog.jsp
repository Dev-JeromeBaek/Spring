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
			<a href="<%-- 등급안내페이지이동 --%>" class="level${ memLogin.getM_grade() }<%-- 등급입력 --%>"
				title="[ ${ showGrade } ] 등급입니다.">[ ${ showGrade } ]<%-- 등급입력 --%></a>
			<a href="<%-- 마이페이지 이동 --%>" class="user"
				title="마이페이지로 이동합니다.">${ memLogin.getM_name() }님<%-- 이름입력 --%></a>
			<a href="/aaa/mem/logOut" class="logout">로그아웃</a>
		</div>
		<ul>
            <li><a href="/aaa/mem/memMyPage<%-- 마이페이지로 이동 --%>">마이페이지</a>
                <ul>
	                <li><a href=""><span>구매&middot;배송 조회</span></a></li>
	                <li><a href=""><span>취소&middot;환불&middot;교환</span></a></li>
	                <li><a href=""><span>캐쉬&middot;적립금</span></a></li>
	                <li><a href=""><span>재판매 알리미</span></a></li>
					<li><a href=""><span>회원등급&middot;멤버십</span></a></li>
                </ul>
            </li>
            <li><span class="bar">|</span><a href="">고객센터</a>
                <ul>
	                <li><a href=""><span>자주묻는질문</span></a></li>
	                <li><a href="/aaa/mem/memQnaList"><span>1:1 문의하기</span></a></li>
	                <li><a href=""><span>공지사항</span></a></li>
                </ul>
            </li>
            <li>
            <span class="bar">|</span>
            <a style="cursor:pointer" class="redirect_cart">
            <span class="ico_cart"><img style="margin-bottom: 3px;" alt="" src="/aaa/resources/img/yeob/ico_cart.png">
            </span>
            <strong>장바구니</strong> 
            <em class="num_area"><strong>0<%-- : 장바구니 담겨있는 갯수(count)/임시로0넣어놓음 --%></strong>
            <span></span>
            </em>
            </a>
            </li>
		</ul>
	</div>
</div>
</body>
</html>
