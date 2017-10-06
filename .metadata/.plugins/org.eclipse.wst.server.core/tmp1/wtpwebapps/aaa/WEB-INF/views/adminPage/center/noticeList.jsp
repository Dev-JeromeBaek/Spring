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

<style type="text/css">
	table{ 
 		background: #eeeeee; 
 	} 
</style>
<script src="http://code.jquery.com/jquery-1.4.4.js"></script>

<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"60168",secure:"60173"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-8" data-genuitec-path="/aaa/src/main/webapp/WEB-INF/views/adminPage/center/noticeList.jsp">
	<br data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-8" data-genuitec-path="/aaa/src/main/webapp/WEB-INF/views/adminPage/center/noticeList.jsp">
	<br>
	<span style=" font: italic bold 5.0em/1em Georgia, serif;"><h2>공지사항</h2></span>
	<br>
	<br>
	<form name="frm">
	<table>
		<tr style="background-color:gray;">
			<c:choose>
			
			<c:when test="${adminLogin == null}">
				<td style=" font: italic bold 1.3em/1em Georgia, serif;">번호</td>
			</c:when>
			<c:otherwise>
				<td style=" font: italic bold 2em/1em Georgia, serif;"><font color="blue">수정번호</font></td>
			</c:otherwise>
			</c:choose>	
				<td style=" font: bold 1.3em/1em Georgia, serif; ">제목</td>
				<td style=" font: bold 1.3em/1em Georgia, serif; ">작성자</td>
				<td style=" font: bold 1.3em/1em Georgia, serif; ">등록일</td>
		</tr>
		
		<c:if test="${ !list.isEmpty() }">
			<c:forEach var="each" items="${ list }">
			
			<tr class="trColor">
			
			<c:choose>
				<c:when test="${adminLogin == null}" >
					<td>${each.notice_num }</td>
				</c:when>	
				<c:otherwise>
					<td><a style=" font: italic bold 2em/1em Georgia, serif;" href="/aaa/admin/noticeMod?notice_num=${each.notice_num}">${each.notice_num }</a></td>
				</c:otherwise>
			</c:choose>
				
				<td><a onclick="go('${each.notice_num }')">${each.notice_title }</a></td>
				<td><a onclick="go('${each.notice_num }')">${each.notice_writer}</a></td>
				<td><a onclick="go('${each.notice_num }')">${each.getNotice_fordate()}</a></td>
			</tr>
			
			<tr id="r${each.notice_num }" class="rrrr">
				<td id="show${each.notice_num }"></td>
			</tr>
			</c:forEach>
			
<!-- 			/// -->
			
		<tr>
			<td colspan="10">
			<c:if test="${ pageDTO.getShowPageNumberBegin() != 1 }">
				<a onclick="location.href='?nowPage=1'">◀◀</a> &nbsp;
				<a onclick="location.href='?nowPage=${pageDTO.getNowPage()-1}'">◀</a>
			</c:if>
			
			<c:forEach var="i" begin="${ pageDTO.getShowPageNumberBegin() }" end="${pageDTO.getShowPageNumberEnd()}" step="1">
				<c:choose>
					<c:when test="${pageDTO.getNowPage() == i }">
						[${i}]
					</c:when>
					<c:otherwise>
						<a href="?nowPage=${i}">[${i}]</a>
					</c:otherwise>
				</c:choose>			
			</c:forEach>
			
			<c:if test="${pageDTO.getShowPageNumberEnd() != pageDTO.getEndPage()}">
				<a onclick="location.href='?nowPage=${pageDTO.getNowPage()+1 }'">▶</a>
				<a onclick="location.href='?nowPage=${pageDTO.getEndPage()}'">▶▶</a>	
			</c:if>
			</td>		
		</tr>
<!-- 			/// -->
		</c:if>
 	<tr>
 	
 	<td colspan="2">
 	<c:choose>
 	<c:when test="${adminLogin == null}" >
<!-- 		<input type="button" value="관리자 로그인" onclick="javascript:goLog()"> -->
 	</c:when>
 	<c:otherwise>
 		<input style="border: 1px solid black;" type="button" value="공지사항 작성" onclick="javascript:goInsertForm()">
 	</c:otherwise>
 	</c:choose>
 		<input style="border: 1px solid black;" type="button" value="목 록" onclick="javascript:gonoticeList()">
 	</td>
 	</tr>	
	</table>
	<script>$(".trColor:even").css("background-color", "#bbbbff");</script>
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
		
	</script>

	<script type="text/javascript">
		$(".rrrr").hide();
		var usingNum  = -1;
	function go(notice_num){
		usingNum = notice_num;
		
		$("#r"+notice_num).slideToggle();
		
		var params = "notice_num="+notice_num;

		sendRequest("/aaa/admin/noticeAnyView",params,callback,null);
	} 
	
		function callback() {
			if (httpRequest.readyState == 4) {	
				if (httpRequest.status == 200) {
					
					var targetNode = document.getElementById("show"+usingNum);
					
					targetNode.innerHTML = httpRequest.responseText;
					
				} else {
					alert("*** 실패 : " + httpRequest.status);
				}
			}
		}
	</script>

</body>
</html>
