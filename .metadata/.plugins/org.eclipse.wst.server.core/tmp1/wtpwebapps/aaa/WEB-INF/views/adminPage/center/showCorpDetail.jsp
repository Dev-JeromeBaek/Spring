<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"60168",secure:"60173"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-14" data-genuitec-path="/aaa/src/main/webapp/WEB-INF/views/adminPage/center/showCorpDetail.jsp">
	<br data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-14" data-genuitec-path="/aaa/src/main/webapp/WEB-INF/views/adminPage/center/showCorpDetail.jsp">
	<fieldset class="corpModifyField">
	<legend class="modifyLegend" >[ 기업 정보]</legend>
		<div align="left" style="width: 600px; margin-left: 20px;">
			<fieldset style="width: 550px; margin-left: 5px; border-style: none;">
				<legend style="font-size: large;"><strong>기본 정보</strong></legend>
				<div style="font-size: x-small; margin-left: 20px;">정확한 정보를 입력해주세요</div><br>
				<table style="text-align: left;">
					<tr class="zzz">
						<td class="aa"><strong>사업자 번호</strong></td>
						<td class="bb" style="margin-left: 35px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${ corp.getC_bn() }</td>
					</tr>
					<tr class="zzz">
						<td class="aa"><strong>회사명</strong></td>
						<td class="bb" style="margin-left: 35px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(주) ${ corp.getC_name() }</td>
					</tr>
					<tr class="zzz">
						<td class="aa"><strong>대표자</strong></td>
						<td class="bb" style="margin-left: 35px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${ corp.getC_ceo() }</td>
					</tr>
					<tr class="zzz">
						<td class="aa"><strong>전화번호</strong></td>
						<td class="bb" style="margin-left: 35px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${ corp.getC_tel() }</td>
					</tr>
					<tr class="zzz">
						<td class="aa"><strong>핸드폰</strong></td>
						<td class="bb" style="margin-left: 35px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${ corp.getC_phone() }</td>
					</tr>
					<tr class="zzz">
						<td class="aa"><strong>주소</strong></td>
						<td class="bb" style="margin-left: 35px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${ corp.getC_addr().substring(0, 13) }...
						</td>
					</tr>
					<tr class="zzz">
						<td class="aa"><strong>등급</strong></td>
						<td class="bb" style="margin-left: 35px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${ corp.getC_grade() } 등급</td>
					</tr>
					<tr class="zzz">
						<td class="aa"><strong>딜보유 갯수</strong></td>
						<td class="bb" style="margin-left: 35px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${ corp.getC_dealcount() } 개</td>
					</tr>
					<tr class="zzz">
						<td class="aa"><strong>매출</strong></td>
						<td class="bb" style="margin-left: 35px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${ corp.getC_sellingprice() } 원</td>
					</tr>
				</table>
			</fieldset>
		</div>
	</fieldset>
		<p align="left" style="margin-left: 220px;">&nbsp;
		<button onclick="closePop()" 
			style="cursor: pointer; 
				background-color: #FFDF32; 
				width: 180px;
				height: 50px;
				color: white; 
				font-size: large;"><strong>닫기</strong></button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</p>
		<script type="text/javascript">
			function closePop() {
				self.close();
			}
		
		</script>
</body>
</html>
