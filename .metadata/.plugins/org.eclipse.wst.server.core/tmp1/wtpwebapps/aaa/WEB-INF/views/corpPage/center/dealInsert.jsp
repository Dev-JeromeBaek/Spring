<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >


<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"60168",secure:"60173"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-23" data-genuitec-path="/aaa/src/main/webapp/WEB-INF/views/corpPage/center/dealInsert.jsp">


	<form name="suinfrm" method="post" action="/aaa/corp/dealSuccess"
		enctype="multipart/form-data" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-23" data-genuitec-path="/aaa/src/main/webapp/WEB-INF/views/corpPage/center/dealInsert.jsp">

		<h1>DEAL 올리기 PAGE</h1>
		<table id="tt" style="border: 1px solid red;">
			<tr>
				<td>타이틀 이름 <input type="text" name="name">

				카테고리 <select name="category">
						<optgroup label="패션 뷰티 ">
							<option>여성패션</option>
							<option>남성·유니섹스페션</option>
							<option>여성 브랜드 패션</option>
							<option>남성 브랜드 패션</option>
							<option>스포츠 패션</option>
							<option>뷰티</option>
						</optgroup>

						<optgroup label="식품 ">
							<option>과일·채소</option>
							<option>수산·정육·계란</option>
							<option>즉석·가공식품</option>
							<option>김치·반찬·장류</option>
							<option>스 낵</option>
							<option>음 료</option>
							<option>건강·홍삼</option>
							<option>다이어트</option>
							<option>수입식품</option>
							<option></option>
						</optgroup>

						<optgroup label="생활 홈 데코 ">
							<option>세제 세안</option>
							<option>수납 정리</option>
							<option>청소용품</option>
							<option>세탁 욕실용품</option>
							<option>침실가구</option>
							<option>주방가구</option>
							<option>아동 학생 가구</option>
							<option>캔들 조명</option>
						</optgroup>

						<optgroup label="가전 디지털">
							<option>TV·냉장고·세탁기</option>
							<option>계절가전</option>
							<option>생활가전</option>
							<option>주방가전</option>
							<option>차량용디지털기기</option>
							<option>노트북·태블릿·PC</option>
							<option>게임·소프트웨어</option>
							<option>저장장치·주변기기</option>
							<option>모니터·프린터</option>
							<option>모바일·액세서리</option>
							<option>카메라·영상·음향</option>
						</optgroup>

						<optgroup label="지역">
							<option>강남</option>
							<option>홍대·합정·상수</option>
							<option>명동·시청·중구</option>
							<option>잠실·신천</option>
							<option>서초·방배·양재</option>
							<option>대학로·수유</option>
							<option>압구정·가로수</option>
							<option>신촌·이대·공덕</option>
							<option>종로·광화문</option>
							<option>송파·방이·가락</option>
							<option>강서·양천</option>
							<option>노원·도봉</option>
							<option>청담·학동·논현</option>
							<option>상암·은평</option>
							<option>이태원·한남</option>
							<option>강동·천호·길동</option>
							<option>관악·동작·사당</option>
							<option>성동·동대문</option>
							<option>삼성·역삼·대치</option>
							<option>구로·영등포</option>
							<option>건대·구의·중랑</option>
						</optgroup>
				</select>></td></tr>
			<tr>
				<td>대표가격<input type="text" name="price"></td>
			</tr>
			<tr>
				<td colspan="2">소개</td>
			</tr>
			
			<tr>
				<td colspan="2"><textArea name="exp" cols="10" rows="5">텍스트아리아</textArea>
			</tr>
		
			<tr>
				<td>상세선택<input type="text" name="dd_kind11">
				
				상세 이름 <input type="text" name="dd_name11">
				상세 가격 <input type="text" name="dd_price11">
				상세 수량 <input type="text" name="dd_amount11"></td>
			</tr>
					
		<tr><td><div id="aa"></div></td></tr>
			<tr  id="amountTarget">
				<td><input type="button" value="상품추가"
					onclick="javascript:button333()"></td>
			</tr>
			<tr>
				<td>
					<input type="file" name="upfile1"><div id="filebox"></div>
					<input type="button" id="button2" value="파일 추가" onclick="addFile()">
				</td>
			</tr>

			<tr>
				<td colspan="2"><input type="hidden" name="num" value="${ corpLogin.getC_num() }">
					<input type="hidden" name="cnt">
					<input type="button" value="관리자에게 보내기" onclick="frmSubmit()"></td>
			</tr>
		</table>
	</form>

</body>

<script type="text/javascript">

	var cnt = 2;
	
	function addFile() {
		var filebox = document.getElementById("filebox");
		var fileNode = document.createElement("tr");
		fileNode.innerHTML ="<td><input type='file' name='upfile"+cnt+"'/></td></br>";
		filebox.appendChild(fileNode); 
		cnt++;
	}
	var b = 12; 
	var c = 12;
	var d = 12;
	var e = 12;
	function button333() {
		 var addAll = "<td>상세선택<input type='text' name='dd_kind"+b+"'></td>"
				+"<td>상세 이름</td><td><input type='text' name='dd_name"+d+"'></td>"
				+"<td>상세 가격</td><td><input type='text' name='dd_price"+c+"'></td>"
				+ " <td>상세 수량</td> <td><input type='text' name='dd_amount"+e+"'></td>";
					var amountNode = document.createElement("tr");
					amountNode.innerHTML =addAll;
					
					var amount =document.getElementById("amountTarget");
					var tt =document.getElementById("aa");
					tt.appendChild(amountNode); 
		
		b++;
		c++;
		d++;
		e++;
	}
	
	function frmSubmit() {
		var suinfrm = document.suinfrm;
		suinfrm.cnt.value = b-1;
		suinfrm.submit();
	}
</script>
</html>








