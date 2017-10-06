<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     
<!-- 합쳐지고 최소화된 최신 CSS -->     
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가전-디지털 목록 리스트</title>
	<style type="text/css">
		.aalist {
			width : 1300px;
			margin-left : 500px;
		}
		
		.a {
			border : solid 1px red;
			width : 320px;
			height : 480px;
			margin : 15px;
			padding : 10px;
			float : letf;
		}
		
		.aalist {
			width : 300px;
			height : 300px;
			padding : 5px;
			padding-top : 10px;
			padding-bottom : 0px;
		}
		.aa:link {
			text-decoration : none;
			font-size : large;
			color: #24A048;		
		}
		.aa:hover {
			text-decoration : none;
			font-size : xx-large;
			color: #24A048;		
		}
		.aa:visited {
			text-decoration : none;
			color: #24A048;		
		}
		.aa:active {
			font-size : xx-large;
			color: #DF171E;	
		}
	</style>
</head>
<body>
	
	<h2>가전-디지털</h2>
	
	<table style="align : center">
		<tr>
			<c:choose>
				<c:when test="${!digitalList.isEmpty() }">
					<c:forEach varStatus="each" items="${ digitalList }">
					
					
						<c:if test="${each.index%3==0}">
							<tr>
							</tr>
						</c:if>
					<td >
						<a href="/aaa/appliance_digital/digitalOne?di_num=${ digitalList[each.index].di_num}" class="thumbnail">
							<img src="/aaa/resources/files/${(digitalList[each.index].di_sysName).split(',')[0]}"
							alt="그림이 없습니다." id="a" style="width : 200px; hieght : 300px;">
							<br>
							이름 : ${ digitalList[each.index].di_name }
							<br>
							가격 : ${ digitalList[each.index].di_price }
						</a>
					</td>
					
					</c:forEach>
				</c:when>
			</c:choose>
		</tr>
	</table>
	
</body>
</html>