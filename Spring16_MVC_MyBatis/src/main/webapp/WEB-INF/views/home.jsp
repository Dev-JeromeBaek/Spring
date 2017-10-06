<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
	<style type="text/css">
		
		html, body {
			width: 100%;
			height: 100%;
			
		}
		
		#home {
			width: 100%;
			height: 100%;
			text-align: center;
			border: 
		}
		
	</style>
</head>
<body>
	
	<table id="home" border="1">
		<tr style="height: 10%">
			<td colspan="2">
				<jsp:include page="/WEB-INF/views/mainTop.jsp"></jsp:include>
			</td>
		</tr>
		<tr style="height: 15%">
			<td colspan="2">
				<c:choose>
					<c:when test="${ top2 != null }">
						<jsp:include page="${ top2 }"></jsp:include>
					</c:when>
					<c:otherwise>
						<jsp:include page="/WEB-INF/views/mainTop2.jsp"></jsp:include>
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
		<tr>
			<td style="width: 20%">
				<c:choose>
					<c:when test="${ left != null }">
						<jsp:include page="${ left }"></jsp:include>
					</c:when>
					<c:otherwise>
						<jsp:include page="/WEB-INF/views/mainLeft.jsp"></jsp:include>
					</c:otherwise>
				</c:choose>
			</td>
			<td align="center">
				<c:choose>
					<c:when test="${ center != null }">
						<jsp:include page="${ center }"></jsp:include>
					</c:when>
					<c:otherwise>
						<jsp:include page="/WEB-INF/views/mainCenter.jsp"></jsp:include>
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
		<tr style="height: 10%">
			<td colspan="2">
				<jsp:include page="/WEB-INF/views/mainBottom.jsp"></jsp:include>
			</td>
		</tr>
	</table>
	
</body>
</html>
