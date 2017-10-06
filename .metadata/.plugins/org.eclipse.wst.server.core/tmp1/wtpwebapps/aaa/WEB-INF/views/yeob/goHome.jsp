<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"60168",secure:"60173"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-135" data-genuitec-path="/aaa/src/main/webapp/WEB-INF/views/yeob/goHome.jsp">
	<script type="text/javascript" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-135" data-genuitec-path="/aaa/src/main/webapp/WEB-INF/views/yeob/goHome.jsp">
	var msg = "${msg}";
	if(msg != "") {
		location.href="/aaa/?msg="+msg;
	} else {
		location.href="/aaa/";
	}
	</script>
</body>
</html>
