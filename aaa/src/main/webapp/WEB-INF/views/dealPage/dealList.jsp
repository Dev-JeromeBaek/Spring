<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.portfolio-item {
	margin-bottom: 25px;
}

.col-md-2 {
	width: 400px;
	height: 300px;
	margin: 20px;
	margin-left: 50px;
	float: left;
	position: relative;
}

.img-responsive {
	width: 200px;
	height: 100px;
	margin: 20px;
	position: relative;
}

 .conconcon { 
 	padding-left: 25px; 
 	padding-right: 20px; 
 }
</style>
</head>
<body>
	<!-- Page Content -->
	<div class="conconcon">

		<!-- Page Header -->
		<div class="row1">
			<div class="col-lg-12">
			
				<h1 class="page-header">
					<c:if test="${!headdd }">${headdd }<br></c:if>
					<c:if test="${!kind}">${kind} List<br></c:if>
					<small>Secondary Text</small>
				</h1>
			</div>
		</div>
		<!-- /.row -->
		<c:choose>
		<c:when test="${!listc.isEmpty() }">
			<c:forEach var="each" items="${listc }">
				<div class="row" align="center">
					<div class="col-md-2 portfolio-item">
						<a href="/aaa/deal/detail/${each.di_num }"> <img
							class="img-responsive" 
							src="/aaa/resources/files/${(each.di_sysName).split(',')[0]}"
							alt="${(each.di_sysName).split(',')[0] }"/>
						</a>
						<h3>
							<a href="/aaa/deal/detail/${each.di_num }">${each.di_name }</a>
						</h3>
					</div>
				</div>
			</c:forEach>
		</c:when>
		<c:otherwise>
		해당 목록이 없습니다.
		</c:otherwise>
		</c:choose>
	</div>
	<!-- concon END -->

	<hr>
</body>
</html>
