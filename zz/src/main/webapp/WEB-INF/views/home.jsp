<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Yoeb's Home</title>
	
	<script type="text/javascript">
		var msg = "${msg}";
		if(msg != "") {
			alert(msg);
// 			msg == "";
		}
		var gradeMsg = "${gradeMsg}";
		if(gradeMsg != "") {
			alert(gradeMsg);
		}
		
		
	</script>
	
	<%-- .js 파일 --%>
	<script type="text/javascript" src="/aaa/resources/js/yeob/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="/aaa/resources/js/yeob/yeob.js"></script>
	<script type="text/javascript" src='/aaa/resources/js/yeob/httpRequest.js'></script>

	<%-- .css 파일 --%>
	<link rel="stylesheet" href="/aaa/resources/css/yeob/yeob-whole.css" />
	<link rel="stylesheet" href="/aaa/resources/css/yeob/yeob-top-log.css" />
	<link rel="stylesheet" href="/aaa/resources/css/yeob/yeob-top-mid.css" />
	<link rel="stylesheet" href="/aaa/resources/css/yeob/yeob-top-menu.css" />
	<link rel="stylesheet" href="/aaa/resources/css/yeob/yeob-top-down.css" />
	<link rel="stylesheet" href="/aaa/resources/css/yeob/bottom.css" />
	
	<style type="text/css">
 	.topLogView {width:1450px; height: 28px; position: relative; margin-left: 200px;} 
	.topView {width:1450px;	height: 192px;position: relative;margin-left: 200px;}
	.middleView{width:1914px;/* height: 700px; */height: auto;background-color: #F0F0F0;opacity: 0.5;float: left;z-index: 1;border:3px solid black;}
	.leftView {width:199px;height:inherit;background-color:inherit;float: left;z-index: 2;} 
 	.centerView {width:1499px;border: 1px solid black;height:inherit;float: left;z-index: 2;} 
 	.rightView{width:199px;height:inherit;background-color:inherit;float: left;z-index: 2;} 
	.bottomView{width:1900px;height: auto;background-color: green;float: left;}
	</style>

</head>
<body>
	<div class="topLogView" id="topLogView">
		<c:choose>
		<c:when test="${ memLogin != null }">
			<jsp:include page="/WEB-INF/views/memPage/top/afterLog.jsp"></jsp:include>
		</c:when>
		<c:when test="${ memLogin == null && adminLogin == null}">
			<jsp:include page="/WEB-INF/views/memPage/top/beforeLog.jsp"></jsp:include>
		</c:when>
		<c:when test="${ adminLogin != null }">
			<jsp:include page="/WEB-INF/views/adminPage/top/afterLog.jsp"></jsp:include>
		</c:when>
	</c:choose>
	</div>
	<script>
	function setCookie( name, value, expiredays ) { 
		document.cookie = name + "=" + value;
	} 
	function closeWin() { 
		$("#noticePop").hide();
	}
	function todaycloseWin() { 
		if ( document.getElementById("chbox1").checked ){ 
			setCookie( "noticeCookie", "noticeCookie" , 24 ); 
		}
		$("#noticePop").hide();
	}
	
	var cookiedata = document.cookie.indexOf("noticeCookie"); 

		$(document).ready(function(){
// 			alert(cookiedata);
			if(cookiedata<0){
				$("#noticePop").show();
			}else {
				$("#noticePop").hide();
			}
		});
	

</script>
<div id="noticePop" class="layerpopup" style="position: absolute;left:10px;top:210px;width:400px;z-index:100000000000000">
	<div class="popup" style="background:#ffffff"><p><img alt="팝업창" src="resources/img/스노우어니언.JPG" width="400" height="450"/></p></div>

	<div class="close" style="position:relative;font-size: 13px;background:#999;padding:10px 10px 10px 35px;">
		<form name="pop_form">
			<div id="check"><input type="checkbox" name="chbox" id="chbox1" value="checkbox" onclick="todaycloseWin();" style="position:absolute;left:20px;top:13px;">&nbsp;<span>10초 동안 보지 않기</span>&bnsp;</div>
			<div id="close" style="position:absolute;right:20px;top:10px;"><a onclick="closeWin();" style="color: #111">CLOSE</a></div>
		</form>
	</div>
</div>
	
	<div class="topView" id="topView">
		<jsp:include page="/WEB-INF/views/yeob/top/topIndex.jsp"></jsp:include>
	</div>
	<div class="middleView" style="background-image: url('resources/img/하프앤하프.png')">
		<div class="leftView">
			<c:choose>
			<c:when test="${ left != null }">
				<jsp:include page="${ left }"></jsp:include>
			</c:when>
			<c:otherwise>
				<jsp:include page="/WEB-INF/views/yeob/left/leftIndex.jsp"></jsp:include>
			</c:otherwise>
		</c:choose>
		</div>
		<div class="centerView">
			<c:choose>
			<c:when test="${ center != null }">
				<jsp:include page="${ center }"></jsp:include>
			</c:when>
			<c:otherwise>
				<jsp:include page="/WEB-INF/views/yeob/center/centerIndex.jsp"></jsp:include>
			</c:otherwise>
		</c:choose>
		</div>
		<div class="rightView">
			<c:choose>
			<c:when test="${ right != null }">
				<jsp:include page="${ right }"></jsp:include>
			</c:when>
			<c:otherwise>
				<jsp:include page="/WEB-INF/views/yeob/right/rightIndex.jsp"></jsp:include>
			</c:otherwise>
		</c:choose>
		</div>
	</div>
	<div class="bottomView" id="bottomView">
		<jsp:include page="/WEB-INF/views/yeob/bottom/bottomIndex.jsp"></jsp:include>
	</div>
	
	<div id="page_top_down1" class="page_top_down1">
		<a href="#topLogView" title="페이지 상단으로 가기" class="top">
			<img id="topImg" alt="" src="/aaa/resources/img/yeob/bt_top1.png">
		</a>
		<a href="#bottomView" title="페이지 하단으로 가기" class="down">
			<img id="downImg" alt="" src="/aaa/resources/img/yeob/bt_down1.png">
		</a>
	</div>
	
	
</body>
</html>
