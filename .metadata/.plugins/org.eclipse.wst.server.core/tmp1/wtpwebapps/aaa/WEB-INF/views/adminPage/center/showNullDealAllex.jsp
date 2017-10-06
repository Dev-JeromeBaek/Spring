<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<c:set var="pageLoaded" value="1"/>

<script type="text/javascript">
//<![CDATA[
// var pageLoaded = 1; //현재 페이지

	$(window).scroll( function() {
	if ($(window).scrollTop() == $(document).height() - $(window).height()) {
		pageLoaded = pageLoaded + 4;
		"${ pageLoaded = pageLoaded + 1}";
		// ajax를 추가해서 목록을 받아온다
// 		aa();
		$('div#lastPostsLoader').html('<img src="/aaa/resources/img/yeob/loading2.gif">');
		$('div#lastPostsLoader').show();
		
		var ppp = "<c:forEach var='i' items='${ othersDealList }' begin='${ pageLoaded }' end='${ pageLoaded +3 }' step='1' >"
		+"<figure class='snip1268' >"
		+"<div class='image'>"
		+"<div class='icons'>"
		+"</div>"
		+"<a href='' class='add-to-cart'>보러가기</a>"
		+"</div>"
		+"<figcaption>"
		+"<h2>AAAAA</h2>"
		+"<p>VVVV</p>"
		+"<div class='price'>GGGGG 원</div>"
		+"</figcaption>"
		+"</figure>"
		+"</c:forEach>";
		
// 		$('#main_content').append(
// 				"main_content"+pageLoaded+"<br><br><br><br><br><br><br><br><br><br><br><br><br>");

		$('#main_content').append(ppp);
		
		$("#lastPostsLoader").fadeOut(500);
	}
});

	

// function aa() {
// 	$('div#lastPostsLoader').html('<img src="/aaa/resources/img/yeob/loading1.gif">');
// }
// function bb() {
// 	$('div#lastPostsLoader').empty();
// }
//]]>
</script>

<style type="text/css">

</style>

<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"60168",secure:"60173"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-18" data-genuitec-path="/aaa/src/main/webapp/WEB-INF/views/adminPage/center/showNullDealAllex.jsp">
<div id="wrap" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-18" data-genuitec-path="/aaa/src/main/webapp/WEB-INF/views/adminPage/center/showNullDealAllex.jsp">
	<div id="content">
		<div id="main_content">
		main_content1<br><br><br><br><br><br><br><br><br><br><br><br><br>
		main_content2<br><br><br><br><br><br><br><br><br><br><br><br><br>
		main_content3<br><br><br><br><br><br><br><br><br><br><br><br><br>
		</div>
		<div id="lastPostsLoader" style="position: fixed; width: 300px; height: 300px; top: 300px; left: 800px;"></div>
	</div>
	
	<div id="right_menu">right_menu</div>
</div>

</body>
</html>
