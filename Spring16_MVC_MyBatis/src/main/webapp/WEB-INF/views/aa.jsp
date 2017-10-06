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
	값 확인(null, "")
	1. 마이바티스의 레파지토리에서 selectList()의 리턴
		-> List 인터페이스
		=> 값이 없을 때 null 아님
			값이 있는지 없는지 확인하려는 경우 : isEmpty()
	2. 마이바티스의 레파지토리에서 selectOne()의 리턴
		-> 매퍼에서 설정한 resultType으로 제공됨
		-> 값이 없을 때 null
	3. 컨트롤러에서 msg를 jsp로 보내는 경우(setAttribute)
		-> msg를 보내지 않은 경우(setAttribute 하지 않은 경우)
		<script type="text/javascript">
			var msg = "${ msg }";
			if(msg != "") {
				alert(msg);
			}
		</script>
</body>
</html>
