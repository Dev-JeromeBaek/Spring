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
	
    <%-- spring:url 이라고 하면 /resources앞에 자동으로 프로젝트 명이 붙는다.--%>
	<spring:url value="/resources/files_js/httpRequest.js"
				var="httpRequest_js"></spring:url>
	<spring:url value="/resources/files_js/jquery-3.1.1.min.js"
				var="min_js"></spring:url>
	<script src="${ httpRequest_js }"></script>
	<script src="${ min_js }"></script>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	
	<h2>1. 객체 1개 정보를 Json 형식으로 가져오기</h2>
	
	<div id="target1">클릭하세요</div>
	<div id="show1"></div>
	<script type="text/javascript">
		$('#target1').click(
				function() {
					sendRequest(
							"/spring15/json01", null, callback01, null);
					alert("aa");
				});
		function callback01() {
			
			if(httpRequest.readyState == 4) {
				if(httpRequest.status == 200) {
					
					var rcvText = httpRequest.responseText;
					alert("rcvText : " + rcvText);
					
					var res = JSON.parse(rcvText);
					var peoName = res.name;
					var peoAge = res.age;
					
					var targerNode = document.getElementById("show1");
					
					targerNode.innerHTML = "이름 : " + peoName + ", 나이 : " + peoAge;
					
				} else {
					alert("*** 실패 : " + httpRequest.status);
				}
			}
		}
	</script>
	
	<h2>2. 객체 여러개를 가진 컬렉션 정보를
			Json 형식으로 가져오기</h2>
	<div id="target2">클릭하세요</div>
	<div id="show2"></div>
	<script type="text/javascript">
		$("#target2").click(
				function() {
					sendRequest(
							"/spring15/json02", null, callback02, null);
				});
		
		function callback02() {
			if(httpRequest.readyState == 4) {
				if(httpRequest.status == 200) {
					var rcvText = httpRequest.responseText;
					alert("rcvText : " + rcvText);
					
					var res = JSON.parse(rcvText);
					var peoList = res.listc;
					
					var targetNode = document.getElementById("show2");
					
					for(var i=0; i<peoList.length; i++) {
						var peoName = peoList[i].name;
						var peoAge = peoList[i].age;
						
						targetNode.innerHTML = "이름 : " + peoName 
											+ ", 나이 : " + peoAge + "<br>";
					}
					
				} else {
					alert("*** 실패 : " + httpRequest.status);
				}
			}
			
		}
	</script>
	
	
</body>
</html>
