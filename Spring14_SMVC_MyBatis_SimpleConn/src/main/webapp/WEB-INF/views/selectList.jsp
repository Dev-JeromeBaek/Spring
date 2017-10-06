<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	
	<h2>인사 정보 목록</h2>
	
	<table border="1" style="text-align: center;">
		<tr>
			<td>번 호</td>
			<td>이 름</td>
		</tr>
		<c:if test="${ !listc.isEmpty() }">
			<c:forEach var="each" items="${ listc }">
				<tr>
					<td>${ each.num }</td>
					<td>
						<a href=
						"/spring14/selectOne?num=${ each.num }">${ each.name }</a>
					</td>
				</tr>
			</c:forEach>
			<tr>
			<td colspan="10">
			<c:if test="${ pageDTO.getShowPageNumberBegin() != 1 }">
					
				<a onclick="location.href='?nowPage=1'">◀◀</a> &nbsp;
				<a onclick="location.href='?nowPage=${ pageDTO.getNowPage()-1 }'">◀</a>
			</c:if>
			<c:forEach var="i" begin="${ pageDTO.getShowPageNumberBegin() }" end="${ pageDTO.getShowPageNumberEnd() }" step="1">
				<c:choose>
					<c:when test="${ pageDTO.getNowPage() == i }">
						[${ i }]
					</c:when>
					<c:otherwise>
							<a href="?nowPage=${ i }">[${ i }]</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			
			<c:if test="${ pageDTO.getShowPageNumberEnd() 
								!= pageDTO.getEndPage() }">
				<a onclick="location.href=
					'?nowPage=${ pageDTO.getNowPage()+1 }'">▶</a>
				<a onclick="location.href=
					'?nowPage=${ pageDTO.getEndPage() }'">▶▶</a>	
			</c:if>
			</td>		
		</tr>
		</c:if>
	</table>
</body>
</html>
