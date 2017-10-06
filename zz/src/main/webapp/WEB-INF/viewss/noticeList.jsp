<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
     <%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<spring:url value="/resources/js/yeob/httpRequest.js"
	var="httpRequest_js" />
<%-- <spring:url value="/resources/files/yeob/jquery-3.1.1.min.js" var="min_js" /> --%>
<script src="${httpRequest_js }"></script>
<!-- 	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> -->
<%-- <script src="${min_js }"></script> --%>


</head>
<body>

	<form name="frm">
	<table>
		<tr>
			<c:choose>
			
			<c:when test="${adminLogin == null}">
				<td>번호</td>
			</c:when>
			<c:otherwise>
				<td>수정번호</td>
			</c:otherwise>
			</c:choose>	
				
				<td>제목</td><td>작성자</td><td>등록일</td>
		</tr>
		
		<c:if test="${ !list.isEmpty() }">
			<c:forEach var="each" items="${ list }">
			<tr id="r" class="rrrr">
				<td id="show"></td>
			</tr>
			<tr>
			
			<c:choose>
				<c:when test="${adminLogin == null}" >
					<td>${each.notice_num }</td>
				</c:when>
				<c:otherwise>
					<td><a href="/aaa/admin/noticeMod?notice_num=${each.notice_num}">${each.notice_num }</a></td>
				</c:otherwise>
			</c:choose>
						
				<td><a onclick="go('${each.notice_num }')">${each.notice_title }</a></td>
				<td><a onclick="go('${each.notice_num }')">${each.notice_writer }</a></td>
				<td><a onclick="go('${each.notice_num }')">${each.notice_date }</a></td>
			</tr>
			</c:forEach>
		</c:if>
		
 	<tr>
 	<td colspan="2">
 	<c:choose>
 	<c:when test="${adminLogin == null}" >
		<input type="button" value="관리자 로그인" onclick="javascript:goLog()">
 	</c:when>
 	<c:otherwise>
 		<input type="button" value="공지사항 작성" onclick="javascript:goInsertForm()">
 	</c:otherwise>
 	</c:choose>
 		<input type="button" value="목 록" onclick="javascript:gonoticeList()">

<!--  		 Title 검색 : -->
<!--  		<input type="text" name = "notice_title"> -->
<!--  		<input type="button" value="검색" onclick="javascript:goSearch()"> -->
 		
 	</td>
 	</tr>	
	</table>
	</form>

	<script type="text/javascript">
		function goModi(notice_num){
			var frm = document.frm;
			frm.method = "get";
			frm.action = "/aaa/admin/noticeMod?notice_num="+notice_num;
			frm.submit();
		}
		function goInsertForm(){
			var frm = document.frm;
			frm.method = "get";
			frm.action = "/aaa/admin/noticeInsertForm";
			frm.submit();
		}
		function gonoticeList(){
			var frm = document.frm;
			frm.method = "get";
			frm.action = "/aaa/admin/noticeList";
			frm.submit();
		}
		function goLog(){
			var frm = document.frm;
			frm.method = "get";
			frm.action = "/aaa/admin/adminLogin";
			frm.submit();
		}
		
// 		function goSearch(){
// 			var frm = document.frm;
// 			frm.method = "get";
// 			frm.action = "/aaa/notice/noticeSearchKey";
// 			frm.submit();
// 		}
	</script>

	<script type="text/javascript">
		$(".rrrr").hide();
	
	function go(notice_num){
		$("#r").slideToggle();
		
		var params = "notice_num="+notice_num;
		var adminLogin = "${adminLogin}";
		
		sendRequest("/aaa/admin/noticeAnyView",params,callback,null);
		
	} 
	
		function callback() {
			if (httpRequest.readyState == 4) {
				if (httpRequest.status == 200) {

					var targetNode = document.getElementById("show");
		
					targetNode.innerHTML = httpRequest.responseText;
				
				
				} else {
					alert("*** 실패 : " + httpRequest.status);
				}
			}
		}
	</script>

</body>
</html>






















