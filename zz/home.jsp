<%@page import="java.util.ArrayList"%>
<%@page import="spring.mvc.aaa.bean.MemberBean"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 	<meta http-equiv="refresh" content="5" url="/aaa/"> -->
	<title>Yoeb's Home</title>
<!-- 	<style type="text/css"> -->
<!-- /* 		body { */ -->
<!-- /* 			margin: 0px; */ -->
<!-- /* 			background-image: url("resources/img/yeob/arrow.png"); */ -->
<!-- /* 			background-attachment: fixed; */ -->
<!-- /* 		} */ -->
<!-- 	</style> -->
	
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

	<%-- .css 파일 --%>
	<link rel="stylesheet" href="/aaa/resources/css/yeob/yeob-whole.css" />
	<link rel="stylesheet" href="/aaa/resources/css/yeob/yeob-top-log.css" />
	<link rel="stylesheet" href="/aaa/resources/css/yeob/yeob-top-mid.css" />
	<link rel="stylesheet" href="/aaa/resources/css/yeob/yeob-top-menu.css" />
	<link rel="stylesheet" href="/aaa/resources/css/yeob/yeob-top-down.css" />
	<link rel="stylesheet" href="/aaa/resources/css/yeob/yeob-mypage.css" />
	<link rel="stylesheet" href="/aaa/resources/css/yeob/bottom.css" />
	<style type="text/css">
	body {
		text-align: center;
	}
 	.topLogView {width:1450px; height: 28px; position: relative; margin-left: 200px;} 
	.topView {width:1450px;	height: 192px;position: relative;margin-left: 200px;}
 	.slideView{width:100%;/* height: 700px; height: 524px;*/ height: auto; overflow:hidden; display:block; background-color: #F0F0F0;opacity: 0.5;float: left; border:1px solid black;}
 	.centerView {width:1500px;border: 1px solid black;height:auto !important;float: left; margin-left: 200px !important;} 
	.bottomView{width:1900px;height: auto !important;background-color: green;float: left;}
	</style>

</head>
<body>
<%-- 	<c:set var="memListc" value="<%= new ArrayList<MemberBean>() %>"></c:set> --%>
<%-- 	<c:choose> --%>
<%-- 	<c:if test="${ memListc.isEmpty() }"> --%>
<%-- 		<c:set var="memListc" value="<%= new ArrayList<MemberBean>() %>"></c:set> --%>
<%-- 		${ memListc.add(memLogin) } --%>
<%-- 	</c:if> --%>
<%-- 		<c:forEach var="each" items="${ memListc }"> --%>
			
<%-- 		</c:forEach> --%>
<%-- 	</c:choose> --%>

	<script>
	function setCookie( name, value, exdays ) { 
		var d = new Date();
	    d.setTime(d.getTime() + (exdays*10*1000));
	    var expires = "expires="+ d.toUTCString();
	    
		document.cookie = name + "=" + value + ";" + expires;
	} 
	function closeWin() { 
		$("#noticePop").hide();
	}
	function todaycloseWin() { 
		if ( document.getElementById("chbox1").checked ){ 
			setCookie( "noticeCookie", "noticeCookie" ,1); 
		}
		$("#noticePop").hide();
	}
	
	var cookiedata = document.cookie.indexOf("noticeCookie"); 

		$(document).ready(function(){
			if(cookiedata<0){
				$("#noticePop").show();
			}else {
				$("#noticePop").hide();
			}
		});
	

</script>
<c:if test="${center.contains('centerIndex.jsp') }">
	<div id="noticePop" class="layerpopup" style="position: absolute;left:10px;top:210px;width:400px;z-index:100000000000000">
		<div class="popup" style="background:#ffffff" onclick="javascript:location.href='/aaa/mem/notice';">
			<div>
				<table>
				<c:forEach var="each" items="${notice }">
				<tr>
					<td>${each.notice_num }</td>
					<td>${each.notice_writer }</td>
					<td>${each.notice_title }</td>
				</tr>
				</c:forEach>
				</table>
			</div>
		</div>
	
		<div class="close" style="position:relative;font-size: 13px;background:#999;padding:10px 10px 10px 35px;">
			<form name="pop_form">
				<div id="check"><input type="checkbox" name="chbox" id="chbox1" value="checkbox" onclick="todaycloseWin();" style="position:absolute;left:20px;top:13px;">&nbsp;<span>10초 동안 보지 않기</span>&nbsp;</div>
				<div id="close" style="position:absolute;right:20px;top:10px;"><a onclick="closeWin();" style="color: #111">CLOSE</a></div>
			</form>
		</div>
	</div>
</c:if>

	<div class="topLogView" id="topLogView">
		<c:choose>
		<c:when test="${ memLogin != null && adminLogin == null && corpLogin == null }">
			<jsp:include page="/WEB-INF/views/memPage/top/afterLog.jsp"></jsp:include>
		</c:when>
		<c:when test="${ adminLogin != null &&  memLogin == null && corpLogin == null }">
			<jsp:include page="/WEB-INF/views/adminPage/top/afterLog.jsp"></jsp:include>
		</c:when>
		<c:when test="${ corpLogin != null && memLogin == null && adminLogin == null }">
			<jsp:include page="/WEB-INF/views/corpPage/top/afterLog.jsp"></jsp:include>
		</c:when>
		<c:otherwise>
			<jsp:include page="/WEB-INF/views/memPage/top/beforeLog.jsp"></jsp:include>
		</c:otherwise>
		
<%-- 		<c:when test="${ memLogin == null && adminLogin == null && corpLogin == null }"> --%>
<%-- 		</c:when> --%>
	</c:choose>
	</div>
	<div class="topView" id="topView">
		<jsp:include page="/WEB-INF/views/yeob/top/topIndex.jsp"></jsp:include>
	</div>
	<div class="slideView">
		<c:if test="${ slide != null }">
			<jsp:include page="${ slide }"></jsp:include>
		</c:if>
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
