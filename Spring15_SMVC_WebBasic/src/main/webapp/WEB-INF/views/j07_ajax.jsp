<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%--@@@@@@@@@@@@@@@@@@@@@@@@이번 수업 핵심!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--%>
    <%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
    <%--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	
	<spring:url value="/resources/files_js/httpRequest.js"
				var="httpRequest_js"></spring:url>
	<spring:url value="/resources/files_js/jquery-3.1.1.min.js"
				var="min_js"></spring:url>
	<script src="${ httpRequest_js }"></script>
	<script src="${ min_js }"></script>
<%-- 지원을 안하나?? --%>
</head>
<body>
	
	<h2>j07_ajax 페이지</h2>
	<%--
	j07_ajax 페이지 이동이 없는 특별한 request 자기혼자 controller로 왔다갔다함..
	--%>
	
	<div id="show"></div>
	<div id="target">클릭하세요</div>
	
	<script type="text/javascript">
		$("#target").click(
			function() {
				sendRequest("/spring15/ajax", null, callback, null);
				alert("aa");
			}
		);
		function callback() {
			if(httpRequest.readyState == 4) {
				if(httpRequest.status == 200) {
					
					var targetNode = document.getElementById("show");
					targetNode.innerHTML += httpRequest.responseText;
					
				} else {
					alert("*** 실패 : " + httpRequest.status);
				}
			}
		}
		
	</script>
	
	
</body>
</html>
