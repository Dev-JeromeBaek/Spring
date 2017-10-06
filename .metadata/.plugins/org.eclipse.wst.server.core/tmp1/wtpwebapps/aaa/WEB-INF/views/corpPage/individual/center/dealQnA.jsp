<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"60168",secure:"60173"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-37" data-genuitec-path="/aaa/src/main/webapp/WEB-INF/views/corpPage/individual/center/dealQnA.jsp">

<table data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-37" data-genuitec-path="/aaa/src/main/webapp/WEB-INF/views/corpPage/individual/center/dealQnA.jsp">
[<strong>${di.di_name }</strong> 상품 문의 미답변 리스트]
	<c:if test="${dqList!=null }">
		<c:forEach var="dq" items="${dqList }">
			<c:if test="${dq.dq_ans==null }">
			<tr>
				<td><a onclick="ansPop('${dq.dq_num}')">${dq.dq_content }</a></td>
			</tr>
			</c:if>
		</c:forEach>
	</c:if>
	<tr>
</table>


<table>
[<strong>${di.di_name }</strong> 상품 문의 답변 리스트]
	<c:if test="${dqList!=null }">
		<c:forEach var="dq" items="${dqList }">
			<c:if test="${dq.dq_ans!=null }">
			<tr>
				<td><a onclick="ansPop('${dq.dq_num}')">${dq.dq_content }</a></td>
			</tr>
			</c:if>
		</c:forEach>
	</c:if>
</table>

<script type="text/javascript">
	function ansPop(dqnum) {
		var url = "/aaa/idvCorp/DQAnsPop?dqnum=" + dqnum;
		var popname = dqnum + "문의 답변 페이지";
		var size = "width=600px, height=820px, left=450px, top=100px";
		window.open(url, popname, size);
	}
</script>
</body>
</html>
