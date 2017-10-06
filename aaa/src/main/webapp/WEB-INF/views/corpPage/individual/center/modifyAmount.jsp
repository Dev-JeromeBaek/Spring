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
	<br>
	<br>
	<div style="width: 500px; margin-left: 450px;">
			<fieldset>
				<legend style="font-size: large; border: 0px solid white;"><strong>딜 수량 수정</strong></legend>
				<div style="font-size: small;">변경할 수량을 선택해주세요.</div><br>
				<div style="text-align: left;">
					<div id="selects">
						<p>딜 선택사항 수량 선택</p>
						<c:forEach var="each" items="${ detailList }" varStatus="status">
						<div>
							<span style="margin-left: 70px;">${ each.dd_name } - ${ each.dd_kind }</span>
							<span style="margin-left: 35px;">
								<select name="detailAmount${ status.count }" id="da${ each.dd_num}" 
									style="width: 57px; height: 30px;" >
									<c:forEach var="i" begin="0" end="100">
										<c:choose>
											<c:when test="${ i == each.dd_amount }">
												<option selected="selected">${ i }</option>
											</c:when>
											<c:otherwise>
												<option>${ i }</option>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</select>
							</span>
						</div>
						</c:forEach>
					</div>
				</div>
			</fieldset>
		</div>
		<br>
		<p align="center" style="margin-left: -60px;">&nbsp;
		<button onclick="detailAmountModify()" 
			style="cursor: pointer; 
				background-color: #FFDF32; 
				width: 180px;
				height: 50px;
				color: black; 
				font-size: large;"><strong>수정하기</strong></button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<button onclick="modifyCancel()"
			style="cursor: pointer; 
				border: 1px solid #A8A8A9;
				width: 180px;
				height: 50px;
				color: black;
				font-size: large;"><strong>취소하기</strong></button>&nbsp;
		</p>
		
		<script type="text/javascript">
		function detailAmountModify() {
			var selects = document.getElementById("selects").getElementsByTagName("div");
			var infos = "";
			for(var qq=0;qq<"${detailList.size()}";qq++){
				var deNum = selects.item(qq).getElementsByTagName("select").item(0).id.substring(2);
				var deAmount = selects.item(qq).getElementsByTagName("select").item(0).value;
				infos += deNum+","+deAmount+"-";
			}
			var params = "di_num=${detailList[0].dd_di_num}"+"&infos="+infos;
			sendRequest("/aaa/idvCorp/detailAmountModify", params, momo, "post");
			alert("BB");
		}
		
		function momo() {
			if(httpRequest.readyState == 4) {
				if(httpRequest.status == 200) {
					var rcvData = httpRequest.responseText;
					if(rcvData == "수정 완료.") {
						location.href="/aaa/idvCorp/goDealModifyPage";
					} else {
						alert(rcvData);
					}
				} else {
					alert("*** 실패 : " + httpRequest.status);	
				}
			}
		}
		
		function modifyCancel() {
			location.href="/aaa/idvCorp/goDealModifyPage";
		}
	
	</script>
</body>
</html>
