<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>${ corpLogin.getC_name() }</title>
	
	<%-- .js --%>
	<script type="text/javascript" src="/aaa/resources/js/yeob/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="/aaa/resources/js/yeob/aa/jquery.rollingCounter.min.js"></script>
	<script type="text/javascript" src="/aaa/resources/js/yeob/httpRequest.js"></script>
	
	
	<%-- .css --%>
	<link rel="stylesheet" href="/aaa/resources/css/yeob/admin-show-list.css" />
	<link rel="stylesheet" href="/aaa/resources/css/yeob/yeob-top-down.css" />
	<style type="text/css">
	
	a:link {
		text-decoration: none;
	}
	a:hover {
		text-decoration: none; 
		font-family: "배달의민족 주아";
		font-size: large;
	}
	a:visited {
		text-decoration: none;
		color: black;
	}
	a:active {
		font-size: x-large;
		font-family: "Rix토이그레이";
	}
	
	#page_top_down, .page_top_down { 
		width:60px; 
		height:60px; 
		position: fixed; 
		right: 150px; 
		bottom: 100px; 
		z-index: 100000; 
	}
	
	#topImg {
		width:40px; 
		height:40px; 
		right: 90px; 
		bottom: 80px; 
		position: fixed;
		z-index: 10000;
	}
	
	body {
		width: inherit;
		height: auto;
		overflow-y: scroll;
/* 		overflow-x: hidden;  */
		text-align: center;
	}
	
	#corpTopView {
		border: 2px solid green;
		width: 1765px;
		height: 300px;
		margin: 0px;
		background-color: #ffdf32;
		overflow: hidden;
		
	}
	
	
	#corpLeftView {
		border-right: 2px solid blue;
		width: 300px;
/* 		height: inherit; */
/* 		height: 600px; */
		height: auto;
		float: left;
		margin: 0px;
	}
	
	#corpCenterView {
		width: 1459px;
/* 		height: inherit; */
		height: auto;
		float: left;
		margin: 0px;
		margin-top: 15px;
	}
	</style>
	<script type="text/javascript">
		var msg = "${msg}";
		if(msg != "") {
			alert(msg);
			msg == "";
		}
	</script>
	
	<%-- JavaScript & jQuery--%>
<!-- 	<script type="text/javascript" src="/aaa/resources/js/yeob/jquery-1.8.3.min.js"></script> -->
<!-- 	<script type="text/javascript" src="/aaa/resources/js/yeob/yeob.js"></script> -->
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"60168",secure:"60173"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-52" data-genuitec-path="/aaa/src/main/webapp/WEB-INF/views/corpPage/individual/corpHome.jsp">
	
<%-- 	<h1 style="position: fixed; left: 600px; top: 120px;">[${ corpLogin.getC_name() }] 개인 페이지</h1> --%>
	
	<div class="corpTopView" id="corpTopView" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-52" data-genuitec-path="/aaa/src/main/webapp/WEB-INF/views/corpPage/individual/corpHome.jsp">
		<jsp:include page="/WEB-INF/views/corpPage/individual/top/corpTopIndex.jsp"></jsp:include>
	</div>
	
	<div class="corpLeftView" id="corpLeftView">
	<c:choose>
		<c:when test="${ corpLeft != null }">
			<jsp:include page="${ corpLeft }"></jsp:include>
		</c:when>
		<c:otherwise>
			<jsp:include page="/WEB-INF/views/corpPage/individual/left/corpLeftIndex.jsp"></jsp:include>
		</c:otherwise>
	</c:choose>
	</div>
	
	<div class="corpCenterView" id="corpCenterView">
	<c:choose>
		<c:when test="${ corpCenter != null }">
			<jsp:include page="${ corpCenter }"></jsp:include>
		</c:when>
		<c:otherwise>
			<jsp:include page="/WEB-INF/views/corpPage/individual/center/corpCenterIndex.jsp"></jsp:include>
		</c:otherwise>
	</c:choose>
	</div>
	
	
	<%-- 기업메인페이지에 적용된 부가기능..! --%>
	
	<div id="page_top_down1" class="page_top_down1">
		<a href="#corpTopView" title="페이지 상단으로 가기" class="top">
			<img id="topImg" alt="" src="/aaa/resources/img/yeob/bt_top1.png">
		</a>
	</div>
	<script type="text/javascript">
	$("#topImg").hover(
		function() { $(this).attr("src", "/aaa/resources/img/yeob/bt_top2.png") }, 
		function() { $(this).attr("src", "/aaa/resources/img/yeob/bt_top1.png") }
	);
	</script>
</body>
</html>
