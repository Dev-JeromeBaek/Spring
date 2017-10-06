<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	

<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"60168",secure:"60173"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-101" data-genuitec-path="/aaa/src/main/webapp/WEB-INF/views/memPage/center/confirmPop.jsp">
	
			<form id="confirm" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-101" data-genuitec-path="/aaa/src/main/webapp/WEB-INF/views/memPage/center/confirmPop.jsp">
				<table border="1" style="text-align: center;" align="center">
					<tr>
						<td>인증번호</td>
						<td>
						${ codeNum }
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="button" value="닫기" onclick="javascript:self.close()">
						</td>				
					</tr>
				</table>
			</form>
	
</body>
</html>