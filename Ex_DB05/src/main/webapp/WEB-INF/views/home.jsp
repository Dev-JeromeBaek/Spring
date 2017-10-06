<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="UTF-8"%>
<html>
<head>
	<title>HW_2017.02.22</title>
	<script type="text/javascript">
		if("${maSSage}" != "null") {
			alert("${maSSage}");
		}
	</script>
</head>
<body>
	<div style="width: 100%; text-align: center; margin-top: 150px;">
		<div style="font-size: 60px; 
					color: red; 
					font-family: 'Rix토이그레이';">소고기 정보관리 프로그램</div>
		
		<br><br><br>
		
		<a href="/exdb05/insertOne">소고기 부위별 정보 입력</a> <br><br>
		<a href="/exdb05/selectList">소고기 부위별 정보 전체보기</a> <br><br>
		
		<br><br><br><br><br>
		
		<div style="font-size: 20px; color: maroon;">
			<a href="/exdb05/yeobInfo">by.백백백</a>
		</div>
	</div>
</body>
</html>
