<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"60168",secure:"60173"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-11" data-genuitec-path="/aaa/src/main/webapp/WEB-INF/views/adminPage/center/noticeSelectAny.jsp">

<form name="frm3" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-11" data-genuitec-path="/aaa/src/main/webapp/WEB-INF/views/adminPage/center/noticeSelectAny.jsp">
	<table>
			<tr>
				<td>제목 : &nbsp;</td>
				<td>
					<input type="text" value="${notice.getNotice_title()}" readonly="readonly">
				</td>
			</tr>
			<tr>  
				<td>내용: </td> 
				<td><textarea name="notice_content" rows="10" cols="77%" readonly="readonly">${notice.getNotice_content()}</textarea></td>
			</tr>
	</table>
</form>

<script type="text/javascript">
	function goAdminLogin(){
		location.href = "/aaa/admin/adminLogin";
	}
</script>
	

</body>
</html>













