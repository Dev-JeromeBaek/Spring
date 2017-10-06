<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.button2123{
 background: #2e8ce3;
 padding:7px 30px 7px 30px;
 font-size:15px;
 font-weight:bold;
 color:#000000;
 text-align:center;
 border:solid 1px #73c8f0;
 background: -moz-linear-gradient(0%, 100%, 90deg, #2e8ce3, #ffffff);
 background: -webkit-gradient(linear, 0% 0%, 0% 100%, from(#ffffff), to(#2e8ce3));

border-radius:5px;
 -moz-border-radius:5px;
 -webkit-border-radius:5px;
 border-bottom-color:#196ebb;
 text-shadow:0 -1px 0 #196ebb;
 }

</style>
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"60168",secure:"60173"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-115" data-genuitec-path="/aaa/src/main/webapp/WEB-INF/views/memPage/center/phonePopupp.jsp">
	
<form name="frmPhone" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-115" data-genuitec-path="/aaa/src/main/webapp/WEB-INF/views/memPage/center/phonePopupp.jsp">
		<c:choose>
		<c:when test="${title == null}">
			<span><h2>질문을 입력해주세요.</h2></span>
		</c:when>
		<c:otherwise>
			<span><h2>질문 내용을 수정해주세요.</h2></span>
		</c:otherwise>
		</c:choose>
		<div>
			<span>제목</span>
			<span><input style="border:1px solid blue;"  type="text" name="m_memo1" value="${title}"></span>
			<c:choose>
		<c:when test="${title == null}">
			<span><input class="button2123" type="button" value="보내기" onclick="javascript:goInsertMemo()"></span>
		</c:when>
		<c:otherwise>
			<span><input class="button2123" type="button" value="수정 완료" onclick="javascript:goModi()"></span>
		</c:otherwise>
		</c:choose><br>
			<span><textarea name="m_memo2" cols="50" rows="5" style="border:1px solid blue;overflow:visible;text-overflow:ellipsis;">${content}</textarea></span>
	    </div>
	
	<input type="hidden" name="m_num" value="${memLogin.m_num}">
</form>
  
<script type="text/javascript">
var msg = "${closer}";
if(msg == "closer"){
	self.close();
}

function goInsertMemo(){
	var frm = document.frmPhone;
	frm.method="post";
	frm.action="/aaa/mem/insertMemo";
	frm.submit();
}

function goModi(){
	var modititle = "${title}"
	var modicontent = "${content}"
	var params = "title="+modititle+"&content="+modicontent;
	
	var frm = document.frmPhone;
	frm.method = "post";
	frm.action = "/aaa/mem/modiQnA?"+params;
	frm.submit();
}



</script>

</body>
</html>


























