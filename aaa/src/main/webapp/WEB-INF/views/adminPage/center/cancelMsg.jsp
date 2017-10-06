<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>딜 취소 메시지 작성 Page</title>
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
			width: 160px;
			height: 35px;
		}
		
		.bodyContent {
			text-align: center;
			font-family: "배달의민족 주아";
			width: 350px;
			height: 35px;
		}
		
		.bodyText {
			width: 350px;
			height: 100px;
		}
	</style>
</head>
<body>
	<fieldset class="popField">
	<legend class="cancelLegend">[ 딜 취소 메시지 작성 ]</legend>
		<form name="frm">
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
						<td class="bodyTitle">&nbsp;Cancel Explain</td>
						<td class="bodyContent">
							<textarea class="bodyText" name="di_exp" id="di_exp"
								rows="30" cols="110" autofocus="autofocus"></textarea>
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
			<button onclick="send(${ di.getDi_num() })"
				style="cursor: pointer;">전송하기</button>
			<button onclick="closePop()"
				style="cursor: pointer;">전송취소</button>
			</p>
		</form>
	</fieldset>
	
	<script type="text/javascript">
		function send(di_num) {
			var diExp = document.frm.di_exp.value;
			diExp.replace(/(\n)/g, "<br>");
			var rplaceEnterDi_Exp = diExp.replace(/(\n)/g, "<br>");	<%--엔터값만 <br>로 바꾸기--%>
<%-- 			var rplaceAllBlank = diExp.replace(/\s/g, "&nbsp;"); 모든 공백을 <br>로 바꾸기 --%>
// 			alert(rplaceAllBlank);
			opener.location.href="/aaa/admin/sendCancelMsg?di_num="+di_num+"&di_exp="+rplaceEnterDi_Exp;
			self.close();
		}
	
		function closePop() {
			self.close();
		}
	</script>
</body>
</html>
