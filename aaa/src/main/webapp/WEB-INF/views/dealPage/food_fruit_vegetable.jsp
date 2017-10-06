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
	<h2>리스트으으으으으으</h2>

	<!-- Page Content -->
	<div class="conconcon">

		<!-- Page Header -->
		<div class="row1">
			<div class="col-lg-12">
				<h1 class="page-header">
					Page Heading <small>Secondary Text</small>
				</h1>
			</div>
		</div>
		<!-- /.row -->

		<c:if test="${!listc.isEmpty() }">
			<c:forEach var="each" items="${listc }">
				<div class="row" align="center">
					<div class="col-md-2 portfolio-item">
						<a href="/aaa/deal/detail/${each.di_num }"> <img
							class="img-responsive"
							src="resources/files/${each.di_sysName.split(',')[0] }"
							alt="deal대표 사진">
						</a>
						<h3>
							<a href="/aaa/deal/detail/${each.di_num }">${each.di_name }</a>
						</h3>
					</div>
				</div>
			</c:forEach>
		</c:if>
	</div>
	<!-- concon END -->

	<hr>
</body>
</html>
