<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

<form name="frm3">
	<table>
			<tr>
				<td>제목 : &nbsp;</td>
				<td>
					<input type="text" value="${notice.getNotice_title()}" readonly="readonly">
				</td>
			</tr>
			<tr>  
				<td>내용: </td> 
				<td><textarea name="notice_content" rows="10" cols="77%" readonly="readonly">${notice.getNotice_content()}</textarea></td>
			</tr>
	</table>
</form>

<script type="text/javascript">
	function goAdminLogin(){
		location.href = "/aaa/notice/adminLogin";
	}
</script>
	

</body>
</html>













