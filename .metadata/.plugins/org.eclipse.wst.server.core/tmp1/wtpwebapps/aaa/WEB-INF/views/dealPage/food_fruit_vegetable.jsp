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
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"60168",secure:"60173"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-63" data-genuitec-path="/aaa/src/main/webapp/WEB-INF/views/dealPage/food_fruit_vegetable.jsp">
	<h2 data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-63" data-genuitec-path="/aaa/src/main/webapp/WEB-INF/views/dealPage/food_fruit_vegetable.jsp">리스트으으으으으으</h2>

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
