<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
    <!DOCTYPE html>
<html>

<script type="text/javascript">
	var adminLogin = "${adminLogin}";
	if(adminLogin == ""){
		location.href="/aaa/admin/adminLogin";
	}
</script>


<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form name="frm">
<br>
	<br>
	<span style=" font: italic bold 5.0em/1em Georgia, serif;"><h2>공지사항 수정</h2></span>
	<br>
	<br>
<table border="1">
			
			<input type="hidden" name="notice_num" value="${notice.getNotice_num()}">
			<tr>
				<td>제목 : &nbsp;</td>
				<td>
					<input style="width: 300px;" type="text" name="notice_title" value="${notice.getNotice_title()}">
<!-- 					<a href="/aaa/notice/noticeModi"></a> -->
					<input style="width:75; font-family:돋움; background-color:#E9967A; border:1 solid #1B5AB3" type="button" value="수정완료" onclick="javascript:goModi()">
					<input style="width:75; font-family:돋움; background-color:#F08080; border:1 solid #A0DBE4" type="button" value="삭제" onclick="javascript:goDel()">
					<input style="width:75; font-family:돋움; background-color:#F08080; border:1 solid #1BB3AE" type="button" value="목록으로" onclick="javascript:goSelectList()">
				</td>
			</tr>
			<tr>  
				<td>내용:</td> 
				<td><textarea  name="notice_content" rows="10" cols="77%">${notice.getNotice_content()}</textarea></td>
			</tr>
			
		</table>
</form>

<script type="text/javascript">
	function goModi(){
		var frm = document.frm;
		frm.action = "/aaa/admin/noticeModi";
		frm.method = "post";
		frm.submit();
	}
	function goDel(){
		var frm = document.frm;
		frm.action = "/aaa/admin/noticeDel";
		frm.method = "get";
		frm.submit();
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



















