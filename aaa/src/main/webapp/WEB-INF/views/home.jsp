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
	<title>D-A-S-A-M</title>
	
	<script type="text/javascript">
		var msg = "${msg}";
		if(msg != "") {
			alert(msg);
			msg == "";
		}
		var gradeMsg = "${gradeMsg}";
		if(gradeMsg != "") {
			alert(gradeMsg);
		}
	</script>
	
	<%-- .js 파일 --%>
	<script type="text/javascript" src="/aaa/resources/js/yeob/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="/aaa/resources/js/yeob/yeob.js"></script>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript" src="/aaa/resources/js/yeob/aa/jquery.easing.js"></script>
	<script type="text/javascript" src="/aaa/resources/js/yeob/aa/jquery.rollingCounter.min.js"></script>
	<script type="text/javascript" src="/aaa/resources/js/yeob/yeob-deal-tables.js"></script>
<!-- 	<script type="text/javascript" src="/aaa/resources/js/yeob/yeob-mem-tables.js"></script> -->

	<%-- .css 파일 --%>
	<link rel="stylesheet" href="/aaa/resources/css/yeob/yeob-whole.css" />
	<link rel="stylesheet" href="/aaa/resources/css/yeob/yeob-top-log.css" />
	<link rel="stylesheet" href="/aaa/resources/css/yeob/yeob-top-mid.css" />
	<link rel="stylesheet" href="/aaa/resources/css/yeob/yeob-top-menu.css" />
	<link rel="stylesheet" href="/aaa/resources/css/yeob/yeob-top-down.css" />
	<link rel="stylesheet" href="/aaa/resources/css/yeob/admin-show-list.css" />
	<link rel="stylesheet" href="/aaa/resources/css/yeob/bottom.css" />
	<style type="text/css">
		body {
			text-align: center;
			background-color: #F9F9F9;
		}
 	.topLogView {width:1450px; height: 30px; position: relative; margin-left: 200px; margin-top: 0px;} 
	.topView {border:1px solid red; width:1950px;	height: 280px;position: relative;margin-left: 0px; <%--background-color: #FFEFEF;--%> background-image: url("/aaa/resources/img/yeob/banner_02.png"); opacity: 0.9;}
/*   	.todaysView{width:1350px;border: 1px solid red;height:auto;float: left; margin-left: 75px !important; margin-top:20px; position: relative; z-index: 1;} */
 	.othersView{width:1350px;height:auto; !important;float: left; margin-left: 280px; margin-top:20px;}
 	.centerView {width:1500px; height:auto;float: left; margin-left: 200px !important; margin-top:20px;} 
	.bottomView{width:1900px;height: auto !important;float: left; margin-top:15px;}
/* 	.reImages:hover { */
/* 		border: 2px solid red; */
/* 	} */
	</style>

</head>
<body>

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
			setCookie( "noticeCookie", "noticeCook" ,1); 
		}
		$("#noticePop").hide();
	}
	
</script>


<c:if test="${center==null }">
<c:if test="${notice.size()!=0 }">
	<div id="noticePop" class="layerpopup" style="position: absolute;left:10px;top:300px;width:400px;z-index:100000000000000">
		<div class="popup" style="background:#ffffff" onclick="javascript:location.href='/aaa/admin/noticeList';">
			<div>
				<table>
				<c:forEach var="each" items="${ notice }" begin="0" end="9">
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
				<div id="check"><input type="checkbox" name="chbox" id="chbox1" value="checkbox" onclick="todaycloseWin();" style="position:absolute;left:20px;top:13px;">&nbsp;<span>10초 동안 보지 않기</span>&bnsp;</div>
				<div id="close" style="position:absolute;right:20px;top:10px;">
					<a onclick="closeWin();" style="color: #111">CLOSE</a>
				</div>
			</form>
		</div>
	</div>
</c:if>
</c:if>

<script>
	$("#noticePop").hide();
	var cookiedata = document.cookie.indexOf("noticeCook"); 
	if(cookiedata<0){
		$("#noticePop").show();
	}else {
		$("#noticePop").hide();
	}
</script>

	<div class="topLogView" id="topLogView">
		<c:choose>
		<c:when test="${ memLogin != null && adminLogin == null && corpLogin == null }">
			<jsp:include page="/WEB-INF/views/memPage/top/afterLog.jsp"></jsp:include>
		</c:when>
		<c:when test="${ adminLogin != null &&  memLogin == null && corpLogin == null }">
			<jsp:include page="/WEB-INF/views/adminPage/top/afterLog.jsp"></jsp:include>
		</c:when>
		<c:when test="${ corpLogin != null && memLogin == null && adminLogin == null }">
			<script type="text/javascript">
				var coName = "${ corpLogin.getC_name() }";
				alert(coName + "개인 페이지로 이동합니다.");
				var url = "/aaa/idvCorp/corpHome";	//controller쪽으로 가는 url을 의미!
				var popname = "${ corpLogin.getC_name() } Page";
				var size = "width=1800px, height=900px, left=50px, top=50px";
				window.open(url, popname, size);
			</script>
			<jsp:include page="/WEB-INF/views/corpPage/top/afterLog.jsp"></jsp:include>
		</c:when>
		<c:otherwise>
			<jsp:include page="/WEB-INF/views/memPage/top/beforeLog.jsp"></jsp:include>
		</c:otherwise>
		
	</c:choose>
	</div>
	<div class="topView" id="topView">
		<c:choose>
			<c:when test="${ adminLogin != null }">
				<jsp:include page="/WEB-INF/views/adminPage/top/topIndex.jsp"></jsp:include>
			</c:when>
			<c:otherwise>
				<jsp:include page="/WEB-INF/views/yeob/top/topIndex.jsp"></jsp:include>
			</c:otherwise>
		</c:choose>
	</div>
	
	<div class="centerView">
		<c:if test="${ center != null }">
			<jsp:include page="${ center }"></jsp:include>
		</c:if>
	</div>
	<br>
	<br>
	<div class="todaysView">
		<jsp:include page="${ todays }"></jsp:include>
	</div>
	<br>
	<br>
	<div class="othersView">
		<jsp:include page="${ others }"></jsp:include>
	</div>
	
	<br>
	
	<c:if test="${recent!=null}">
	<c:if test="${recent.size()!=0 }">
	<div id="lastPostsLoader"
	 style="width: 120px;
		    left: 89%;
		    top: 30%;
		    z-index: 10000;
		    border: 2px solid black;" >
		<p>최근 본 상품</p>
		<div id="reList3">
			<c:forEach var="di" items="${recent}">
				<div id="i${di.di_num }" class="reImages">
					<a href="/aaa/deal/detail/${di.di_num }" 
						data-toggle="popover" title="${di.di_name }" data-content="${di.di_price}">
						<img src="/aaa/resources/files/${di.di_sysName.split(',')[0]}"
							style="width: 110px;height: 110px;"alt="/aaa/resources/files/${di.di_sysName.split(',')[0]}"/>
					</a>
					<div style="float: right;" onclick="recentDel(${di.di_num})">X</div>
				</div>
			</c:forEach>
		</div>
		<div><button id="preButtoon">--</button>
			<span id="rePageNum1">1</span><span id="rePageNum2">/1</span>
			<button id="nextButtoon">++</button>
		</div>
	</div>
	</c:if>
	</c:if>
	
	<div class="bottomView" id="bottomView">
		<jsp:include page="/WEB-INF/views/yeob/bottom/bottomIndex.jsp"></jsp:include>
	</div>
	
	<div id="lastPostsLoader"></div>
	
	<div id="page_top_down1" class="page_top_down1">
		<a href="#topLogView" title="페이지 상단으로 가기" class="top">
			<img id="topImg" alt="" src="/aaa/resources/img/yeob/bt_top1.png">
		</a>
		<a href="#bottomView" title="페이지 하단으로 가기" class="down">
			<img id="downImg" alt="" src="/aaa/resources/img/yeob/bt_down1.png">
		</a>
	</div>
	
	<script type="text/javascript">
// 	[topDown버튼 .hover()이벤트]=======================================================
	$("#topImg").hover(
		function() { $(this).attr("src", "/aaa/resources/img/yeob/bt_top2.png") }, 
		function() { $(this).attr("src", "/aaa/resources/img/yeob/bt_top1.png") }
	);
	$("#downImg").hover(
		function() { $(this).attr("src", "/aaa/resources/img/yeob/bt_down2.png") }, 
		function() { $(this).attr("src", "/aaa/resources/img/yeob/bt_down1.png") }
	);
// ================================================================================
	
	$(".reImages").hide();
	for(var gg=0;gg<3;gg++){
		$("#"+document.getElementsByClassName("reImages").item(gg).id).show();
	}
	document.getElementById("rePageNum2").childNodes.item(0).nodeValue=" / "+(parseInt("${recent.size()<7 ? (recent.size()-1)/3+1 : 3 }")) ;
	$("#preButtoon").click(function(){
		$(".reImages").hide();
		var nunu = document.getElementById("rePageNum1").childNodes.item(0).nodeValue;
		nunu = parseInt(nunu)-1;
		if(parseInt(nunu)<1) nunu=parseInt("${recent.size()<7 ? (recent.size()-1)/3+1 : 3 }");
		document.getElementById("rePageNum1").childNodes.item(0).nodeValue=nunu;
		document.getElementById("rePageNum2").childNodes.item(0).nodeValue=" / "+(parseInt("${recent.size()<7 ? (recent.size()-1)/3+1 : 3 }")) ;
		var jj = parseInt(nunu*3>parseInt("${recent.size()}") ? parseInt("${recent.size()}") : nunu*3);
		var kk = (nunu-1)*3;
		for(var gg=kk;gg<jj;gg++){
			$("#"+document.getElementsByClassName("reImages").item(gg).id).show();
		}
	});
	$("#nextButtoon").click(function(){
		$(".reImages").hide();
		var nunu = document.getElementById("rePageNum1").childNodes.item(0).nodeValue;
		nunu=parseInt(nunu)+1;
		if(parseInt(nunu)>parseInt("${recent.size()<7 ? (recent.size()-1)/3+1 : 3 }"))nunu=1;
		document.getElementById("rePageNum1").childNodes.item(0).nodeValue=nunu;
		document.getElementById("rePageNum2").childNodes.item(0).nodeValue=" / "+(parseInt("${recent.size()<7 ? (recent.size()-1)/3+1 : 3 }")) ;
		var jj = parseInt(nunu*3>parseInt("${recent.size()}") ? parseInt("${recent.size()}") : nunu*3);
		var kk = (nunu-1)*3;
		for(var gg=kk;gg<jj;gg++){
			$("#"+document.getElementsByClassName("reImages").item(gg).id).show();
		}
	});
	
	function recentDel(di) {
		sendRequest("/aaa/main/recentDel","di_num="+di,callbackk,"get");
	}
	function callbackk() {
		if (httpRequest.readyState == 4) {
			if (httpRequest.status == 200) {
				var dinum = httpRequest.responseText;
				$("#i"+dinum).remove();
			} else {
				alert("*** 실패 : " + httpRequest.status);
			}
		}
	}
</script>
	
</body>
</html>
