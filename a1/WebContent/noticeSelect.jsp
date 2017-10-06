<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>

<script type="text/javascript">
	var adminLogin = "${adminLogin}";
	if(adminLogin == ""){
		location.href="/aaa/notice/noticeAnyList";
	}
</script>

</head>
<body>
<form name="frmm">
	<table>
			<tr>
				<td>제목 : &nbsp;</td>
				<td>
					<input type="hidden"  name="notice_num" value="${notice.getNotice_num()}">
					<input type="text" name = "notice_title" value="${notice.getNotice_title()}" readonly="readonly">
   					<input type="button" value="수정" onclick="javascript:goMod()">
 						
					<a href="/aaa/notice/noticeMod?notice_num=${notice.getNotice_num()}">수정</a>
					<a href="/aaa/notice/noticeDel?notice_num=${notice.getNotice_num()}">삭제</a>
					<a href="/aaa/notice/noticeList">목록</a>
					    
<%--   					<input type="button" value="삭제" onclick="javascript:goDel()"> --%>
<%--   					<input type="button" value="작성" onclick="javascript:goInsertForm()"> --%>
				</td>
			</tr>
			<tr>  
				<td>내용: </td> 
				<td><textarea name="notice_content" rows="10" cols="77%" readonly="readonly">${notice.getNotice_content()}</textarea></td>
			</tr>
	</table>
</form>


<script type="text/javascript">
	
	function goMod(){
		var frm = document.frm;
		frm.action = "/aaa/notice/noticeMod";
		frm.method = "get";
		frm.submit();
	}
</script>
	

</body>
</html>























