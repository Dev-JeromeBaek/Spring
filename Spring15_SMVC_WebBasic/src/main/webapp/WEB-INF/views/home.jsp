<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
</head>
<body style="text-align: center; font: 20px;">

	<a href="/spring15/j01_logHome">
		1. 로그인과 session</a> <hr>
		
	<a href="/spring15/j02_cookieHome">
		2. 초코칩 쿠기 Cookie</a> <hr>
	
	<a href="/spring15/j03_popUpHome">
		3. 롤리팝업과 초코쿠키</a> <hr>	
		
	<a href="/spring15/j04_exception">
		4. 예외 처리</a> <hr>
		
	<a href="/spring15/j05_initBinder">
		5. 파라미터에 대한 사전 처리하기(예: Date클래스)
			- @RequestMapping 이전에 작업(예: Date클래스)</a> <hr>
	
	<%--
		인터셉터란!?
			: MVC구조는 JSP와 Controller를 왔다갔다하는 작업이있는데,
				그 사이에서 작업을 사전적으로 처리를 진행하게 된다.
				initbinder보다 큰 개념
				ex) login에 대한 처리! controller에서 로그인 조건을 안따져도되밋!
	--%>
	<a href="/spring15/j06_interceptor">
		6. 인터셉터와 로그인 검사</a> <hr>
		
	<a href="/spring15/j07_ajax">
		7. Ajax 이용하기</a> <hr>
		
	<a href="/spring15/j08_json">
		8. JSON 이용하기</a> <hr>
	
	<a href="/spring15/path/peo/selectList/12">
		9. PathVariable을 이용한 url 활용</a>
	
	<%--
	[에러] : url 갯수가 다른경우 --- 정해준 형식에 맞는 방식에 따라 해야한다!
	<a href="/spring15/path/peo/selectList">
		9-1. PathVariable을 이용한 url 활용</a>
	--%>
	
	
</body>
</html>
