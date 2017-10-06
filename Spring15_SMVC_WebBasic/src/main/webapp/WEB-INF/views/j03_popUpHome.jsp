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
	<h2>j03_popUpHome - nopop : ${ nopop }</h2>
	<a href="/spring15/">홈화면으로</a>
	
	
	<%--
		쿠키를 생성해서 보내준다고 해서 팝업화면이 안뜨지 않는다!
		세션의 로그인처리 처럼 쿠키값이 있는지에 대한 조건으로 확인 작업이 필요하다!
		@@@@@@@@@@있는지! 없는지!@@@@@@@@@@
		세션이든 쿠키든 꼭 기억해둘것!!!!!!!!!!
	--%>
	
	<c:if test="${ nopop == null }">
		<script type="text/javascript">
			var url = "/spring15/showpop";	//controller쪽으로 가는 url을 의미!
			var popname = "pop";
			var size = "width=400px, height=250px";
			window.open(url, popname, size);
		</script>
	</c:if>
</body>
</html>
