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
			WEB-INF에 파일은 URL로 접근할 수 없다
			보안상의 이유로 프로그램의 흐름에 따라 접근할 수 있다.
			index.jsp -> controller -> forwarding -> intro.jsp
			@@web.xml이 controller어노테이션을 인식할 수 있다.
			그동안 했던 mainCla의 역할을 web.xml이 한다!
			
		 --%>
	<h2>intro 페이지</h2>	 
	msg : ${ msg } <br>
	
	listc : ${ listc } <br>
	
	</body>
</html>
