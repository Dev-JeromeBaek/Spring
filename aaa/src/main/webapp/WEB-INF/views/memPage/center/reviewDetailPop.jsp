<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>구매후기 DetailPage</title>
	<style type="text/css">
		.cancelLegend {
			font-family: "스웨거 TTF";
			font-style: bold;
			font-size: 40px;
		}
		.popField {
			width: 800px;
			height: 400px;
		}
	
		.tableHeadLine {
			background-color: #D9D9D9;
			opacity: 0.85;
			width: ;
			height: 15px;
		}
	
		.bodyTitle {
			background-color: #D9D9D9;
			text-align: center;
			font-family: "배달의민족 한나는 열한살";
			font-style: bold;
			font-size: 20px;
			width: 190px;
			height: 35px;
		}
		
		.bodyContent {
			text-align: center;
			font-family: "배달의민족 주아";
			width: 330px;
			height: 35px;
		}
		
		.bodyText {
			width: 320px;
			height: 100px;
			font-family: "배달의민족 주아";
			overflow-y: auto;
		}
		p {
			font-family: "배달의민족 한나는 열한살";
			font-size: 20px;
			color: red;
			opacity: 0.85;
		}
	</style>
</head>
<body>
	<fieldset class="popField">
	<legend class="cancelLegend">[ ${ di.getDi_name() } 구매후기 ]</legend>
		<form name="frm">
		<div style="width: 280px; height: auto;float: left;">
			<div>
				<img class="img-responsive" style="width: 250px; height:250px; border: 1px solid blue;" id="mainPhoto"
	             				src="/aaa/resources/files/${(di.di_sysName).split(',')[0]}" 
	             				alt="${(di.di_sysName).split(',')[0]}" />
           	</div>
           	<div style="width: 250px; height: auto;">
           		<c:forEach var="i" items="${(di.di_sysName).split(',') }">
	            <div class="col-sm-3 col-xs-6">
	                <a id="smallImg" onclick="expendImg('${i}')">
	                    <img class="img-responsive portfolio-item" 
	                    		src="/aaa/resources/files/${i}" alt="${i}"
	                    		style="width: 50px; height: 50px; float: left; border: 1px solid red;">
					</a>
				</div>
				</c:forEach>
           	</div>
		</div>
	
			<table style="padding: 5px;">
				<thead>
					<tr>
						<td class="tableHeadLine" colspan="2"></td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="bodyTitle">&nbsp;작성자</td>
						<td class="bodyContent">${ mem.getM_id() }</td>
					</tr>
					<tr>
						<td class="bodyTitle">&nbsp;작성일자</td>
						<td class="bodyContent">${ reviewDetail.getDr_date() }</td>
					</tr>
					<tr>
						<td class="bodyTitle">&nbsp;제 목</td>
						<td class="bodyContent">${ reviewDetail.getDr_title() }</td>
					</tr>
					<tr>
						<td class="bodyTitle">&nbsp;내 용</td>
						<td class="bodyContent">
							<pre class="bodyText" style="text-align: left;">${ reviewDetail.getDr_content_sub() }<br>${ reviewDetail.getDr_content() }</pre>
						</td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td class="tableHeadLine" colspan="2"></td>
					</tr>
				</tfoot>
			</table>
			<p align="center">
			<button onclick="closePop()"
				style="cursor: pointer;">닫기</button>
			</p>
		</form>
	</fieldset>
	
	<script type="text/javascript">
		function expendImg(i) {
			document.getElementById("mainPhoto").src = "/aaa/resources/files/"+i;
			$("#smallImg").find("img").css("opacity","0.5");
		}
		function closePop() {
			self.close();
		}
	</script>
</body>
</html>
