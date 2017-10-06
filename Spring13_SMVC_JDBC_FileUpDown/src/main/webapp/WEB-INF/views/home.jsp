<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
</head>
<body>
	<%-- home으로 오자마자 redirect로 설정된 url로 이동할거다!! --%>
	<c:redirect url="/insertOne"></c:redirect>
</body>
</html>
