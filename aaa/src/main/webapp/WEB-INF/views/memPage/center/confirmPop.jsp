<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	

</head>
<body>
	
			<form id="confirm">
				<table border="1" style="text-align: center;" align="center">
					<tr>
						<td>인증번호</td>
						<td>
						${ codeNum }
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="button" value="닫기" onclick="javascript:self.close()">
						</td>				
					</tr>
				</table>
			</form>
	
</body>
</html>