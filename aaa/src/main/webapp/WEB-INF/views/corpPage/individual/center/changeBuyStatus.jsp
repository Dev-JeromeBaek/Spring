<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
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
		
		p {
			font-size: large;
			font-family: "배달의민족 한나는 열한살";
			color: red;
		}
		
	</style>
</head>
<body>
	<fieldset class="popField">
	<legend class="cancelLegend">[ 거래 상태 변경 ]</legend>
			<p align="center">&nbsp;
			<a onclick="chooseStatusTwo(${ b_num }, 'YES' ,'${mem.m_num}','${mem.m_point}',${buy.b_price})"
				style="cursor: pointer;">YES</a>&nbsp;&nbsp;&nbsp;
			<a onclick="chooseStatus(${ b_num }, 'NO')"
				style="cursor: pointer;">NO</a>&nbsp;&nbsp;&nbsp;
			<a onclick="chooseStatus(${ b_num }, 'ING')"
				style="cursor: pointer;">ING</a>&nbsp;&nbsp;&nbsp;
			<a onclick="closePop()"
				style="cursor: pointer;">변경취소</a>&nbsp;
			</p>
	</fieldset>
	<script type="text/javascript">
		function chooseStatus(num, buyStatus) {
			opener.location.href="/aaa/idvCorp/chooseStatus?b_num=" + num + "&b_status=" + buyStatus;
			self.close();
		}
		
		function chooseStatusTwo(num, buyStatus,m_num,point,b_price) {
			
			 if("${mem.m_grade}" == "1"){
				 
				point = parseInt(point) + parseInt(parseInt(b_price) * 0.005);
			}else if("${mem.m_grade}" == "2"){
				point =  parseInt(point) + parseInt(parseInt(b_price) * 0.004);
			}else if("${mem.m_grade}" == "3"){
				point =  parseInt(point) + parseInt(parseInt(b_price) * 0.003);
			}else if("${mem.m_grade}" == "4"){
				point =  parseInt(point) + parseInt(parseInt(b_price) * 0.002);
			}else if("${mem.m_grade}" == "5"){
				point =  parseInt(point)  + parseInt(parseInt(b_price) * 0.001);
			}
			
				opener.location.href="/aaa/idvCorp/chooseStatusTwo?b_num=" + num + "&b_status=" + buyStatus
					+"&m_num="+m_num+"&point="+point;
			self.close();
		}
		
		function closePop() {
			self.close();
		}
	</script>
</body>
</html>
