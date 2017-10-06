<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"60168",secure:"60173"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-25" data-genuitec-path="/aaa/src/main/webapp/WEB-INF/views/corpPage/center/selectDeal.jsp">


	<h1 data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-25" data-genuitec-path="/aaa/src/main/webapp/WEB-INF/views/corpPage/center/selectDeal.jsp">관리자 페이지로 넘어왔드아아아아아아아앙앙이아잉</h1>

	<table>
	<c:choose>
		<c:when test="${listc != null}">
		<tr>
			<td>번호</td>
			<td>상품명</td>
			<td>카테고리</td>
			<td>사진</td>
			<td>설명</td>
			<td>판매자번호</td>
		</tr>
		<c:forEach var="i" items="${listc}">
	<tr>
			<td>${i.di_num}</td>
			<td>${i.di_name}</td>
			<td>${i.di_category}</td>
			<td><img src="/aaa/webapp/resources/files/${i.di_sysName}" alt="엑뱍"></td>
			<td><textarea cols="15" rows="10">${i.di_exp}</textarea></td>
			<td>${i.di_c_num}</td>
			<td><input type="button" value="승인" onclick="javascript:ok('${i.di_c_num}')"></td>
			<td><input type="button" value="비승인" onclick="javascript:no('${i.di_c_num}')"></td>
		</tr>
		</c:forEach>
		</c:when>
		
		<c:otherwise>
		<td colspan="6">정보음슴ㅋ</td>
		</c:otherwise>
	</c:choose>
	</table>
<script type="text/javascript">
function ok(num) {
	location.href="/aaa/corp/ok?num="+num;
}

function no(num) {
	location.href="/aaa/corp/no?num="+num;
}
</script>


</body>
</html>

