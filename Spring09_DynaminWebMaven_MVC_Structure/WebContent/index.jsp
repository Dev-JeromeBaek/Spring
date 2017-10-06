<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	</head>
	<body>
		<%--
			URL -> index.jsp (URL을 통한 직접 접근 가능)
			-> web.xml (컨트롤러의 위치 정보를 가진 servlet.xml 명시)
			-> servlet.xml (빈 객체 생성(@Controller, @Component등..) 
				&& 서로 필요로 하는 빈 객체 주입(@Autowired))
			-> @Controller (요청된 URL에 대한 정보 처리 및 이동 경로 설정
				&& 원하는 페이지로 forward)
			-> intro.jsp
		--%>
		<h2>index.jsp 페이지</h2>
		
<%-- 	url로 이동할때는 항상 web.xml을 거쳐서(통제를 받아서) 이동한다. --%>
		<a href="/spring09/hello.mv">intro 페이지로 이동</a>
		<br>
		<a href="/spring09/selectList.mv">전체보기</a>
		<br>
		
		
	</body>
</html>
