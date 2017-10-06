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

</head>
<body>
	<form name="frm2">
	<table>
		<tr>
			<td colspan="2">제 목
			<input type="text" name="notice_title">
			<input type="button" value="등록" onclick="javascript:goInsert()">
			<input type="button" value="목록으로" onclick="javascript:goSelectList()">
			</td>
		</tr>
		<tr> 
			<td><textarea rows="5" cols="30" name="notice_content"></textarea><td>
		</tr>
		<input type="hidden" name="admin" value="${adminLogin}">
	</table>
	</form>
	
	<script type="text/javascript">
		function goInsert(){
			var frm2 = document.frm2;
			frm2.action = "/aaa/notice/noticeInsert";
			frm2.method = "post";
			frm2.submit();
		}
		function goSelectList(){
			var frm = document.frm;
			frm.action = "/aaa/notice/noticeList";
			frm.method = "get";
			frm.submit();
		}
		
	</script>
</body>
</html>





















