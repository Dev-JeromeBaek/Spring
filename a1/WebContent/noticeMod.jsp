<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!DOCTYPE html>
<html>

<script type="text/javascript">
	var adminLogin = "${adminLogin}";
	if(adminLogin == ""){
		location.href="/aaa/notice/adminLogin";
	}
</script>


<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form name="frm">
<table border="1">
			<input type="hidden" name="notice_num" value="${notice.getNotice_num()}">
			<tr>
				<td>제목 : &nbsp;</td>
				<td>
					<input type="text" name="notice_title" value="${notice.getNotice_title()}">
<!-- 					<a href="/aaa/notice/noticeModi"></a> -->
					<input type="button" value="수정완료" onclick="javascript:goModi()">
					<input type="button" value="삭제" onclick="javascript:goDel()">
					<input type="button" value="목록으로" onclick="javascript:goSelectList()">
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
		frm.action = "/aaa/notice/noticeModi";
		frm.method = "post";
		frm.submit();
	}
	function goDel(){
		var frm = document.frm;
		frm.action = "/aaa/notice/noticeDel";
		frm.method = "get";
		frm.submit();
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



















