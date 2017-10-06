<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>구매 상세 확인 Page</title>
	<style type="text/css">
		.cancelLegend {
			font-family: "스웨거 TTF";
			font-style: bold;
			font-size: 40px;
		}
		.popField {
			width: auto;
			height: auto;
		}
	
		.tableHeadLine {
			background-color: #D9D9D9;
			opacity: 0.85;
			width: ;
			height: 15px;
		}
	
		.bodyTitle {
			background-color: #D9D9D9;
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
			font-size: 15px;
			color: red;
			opacity: 0.85;
		}
	</style>
</head>
<body>
	<fieldset class="popField">
	<legend class="cancelLegend">[ ${ co.getC_name() } : ${ di.getDi_name() }(${ dd.get(0).getDd_kind() }) 상세 정보 ]</legend>
		<form name="frm">
		<div style="width: 280px; height: auto;float: left;">
			<div>
				<img class="img-responsive" style="width: 150px; height:150px; border: 1px solid blue;" id="mainPhoto"
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
		<div style="border: 1px solid yello; width: 185px; float: left; margin-left: 10px;">
			<c:forEach var="i" items="${ dd }">
				<p>품목 : ${ i.getDd_name() }</p>
				<p>가격 : ${ i.getDd_price() }</p>
			</c:forEach>
		</div>
			<table style="padding: 5px;">
				<thead>
					<tr>
						<td class="tableHeadLine" colspan="2"></td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="bodyTitle">&nbsp;Deal Num</td>
						<td class="bodyContent">${ di.getDi_num() }</td>
					</tr>
					<tr>
						<td class="bodyTitle">&nbsp;Deal Name</td>
						<td class="bodyContent">${ di.getDi_name() }</td>
					</tr>
					<tr>
						<td class="bodyTitle">&nbsp;Deal Category</td>
						<td class="bodyContent">${ di.getDi_category() }</td>
					</tr>
					<tr>
						<td class="bodyTitle">&nbsp;Corp Name</td>
						<td class="bodyContent">${ co.getC_name() }</td>
					</tr>
					<tr>
						<td class="bodyTitle">&nbsp;Corp CEO</td>
						<td class="bodyContent">${co.getC_ceo() }</td>
					</tr>
					<tr>
						<td class="bodyTitle">&nbsp;Explain</td>
						<td class="bodyContent">
							<pre class="bodyText">${ di.getDi_exp_sub() }${ di.getDi_exp() }</pre>
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
