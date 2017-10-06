<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	var adminLogin = "${adminLogin}";
	if(adminLogin == ""){
		location.href="/aaa/notice/adminLogin";
	}
</script>

<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"60168",secure:"60173"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-7" data-genuitec-path="/aaa/src/main/webapp/WEB-INF/views/adminPage/center/noticeInsertForm.jsp">
	<br data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-7" data-genuitec-path="/aaa/src/main/webapp/WEB-INF/views/adminPage/center/noticeInsertForm.jsp">
	<br>
	<span style=" font: italic bold 5.0em/1em Georgia, serif;"><h2>공지사항 작성</h2></span>
	<br>
	<br>
	<form name="frm2">
	<table>
		<tr>
			<td colspan="2">제 목
			<input type="text" name="notice_title" placeholder="제목 입력">
			<input style="width:75; font-family:돋움; background-color:#F08080; border:1 solid #A0DBE4" type="button" value="등록" onclick="javascript:goInsert()">
			<input  style="width:75; font-family:돋움; background-color:#E9967A; border:1 solid #A0DBE4" type="button" value="목록으로" onclick="javascript:goSelectList()">
			</td>
		</tr>
		<tr>
			<td><textarea rows="9" cols="40" name="notice_content" placeholder="내용 입력"></textarea><td>
		</tr>
		<input type="hidden" name="admin" value="${adminLogin}">
	</table>
	</form>
	
	<script type="text/javascript">
		function goInsert(){
			var frm2 = document.frm2;
			frm2.action = "/aaa/admin/noticeInsert";
			frm2.method = "post";
			frm2.submit();
		}
		function goSelectList(){
			var frm = document.frm;
			frm.action = "/aaa/admin/noticeList";
			frm.method = "get";
			frm.submit();
		}
		
	</script> 
</body>
</html>





