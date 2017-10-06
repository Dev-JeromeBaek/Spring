<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업 회원가입</title>
<script type="text/javascript">
 /* var msg = "${msg}";
	if(msg != ""){
		alert(msg);
	} */
</script>

</head>
<body>

<form name="frm">
<table border="1">
	<tr>
		<td>사업자 번호 ex)000-00-00000 : </td>
		<td colspan="2">
		<input type="text" name="c_bn1" value="${corp.getC_bn1()}">-
		<input type="text" name="c_bn2" value="${corp.getC_bn2()}">-
		<input type="text" name="c_bn3" value="${corp.getC_bn3()}">
		
		<input type="button" value="사업자 번호 검사" onclick="javascript:goBnCheck()">
		</td>
	</tr>
	<tr>
		<td>비밀번호 (공백없이 알파벳과 숫자를 넣어 넣어주세요.) : </td>
		<td><input type="password" name="c_pw" value="${corp.getC_pw()}"></td>
	</tr>
	<tr>
		<td>비밀번호 확인 : </td>
		<td colspan="2">
		<input type="password" name="c_pwCheck" value="${corp.getC_pwCheck()}">
		<input type="button" value="비밀번호 확인" onclick="javascript:goPwCheck()">
		</td>
	</tr>
	<tr>
		<td>회사명 : </td>
		<td><input type="text" name="c_name" value="${corp.getC_name()}"></td>
	</tr>
	<tr>
		<td>대표자 성명 : </td>
		<td><input type="text" name="c_ceo" value="${corp.getC_ceo()}"></td>
	</tr>
	<tr>
		<td>회사 전화번호 : ex)지역번호-***-**** </td>
		<td colspan="3">
		<input type="text" name="c_tel1" value="${corp.getC_tel1()}">-
		<input type="text" name="c_tel2" value="${corp.getC_tel2()}">-
		<input type="text" name="c_tel3" value="${corp.getC_tel3()}">
		</td>
	</tr>
	<tr>
		<td>핸드폰 번호 : ex)01*-***-**** </td>
		<td colspan="3">
		<input type="text" name="c_phone1" value="${corp.getC_phone1()}">-
		<input type="text" name="c_phone2" value="${corp.getC_phone2()}">-
		<input type="text" name="c_phone3" value="${corp.getC_phone3()}">
		</td>
	</tr>
	
				<tr align="center">
					<td colspan="2">
					 우편번호 : 
					<input type="text" name="postCode" id="postCode" value="${postCode}" readonly="readonly">
					 도로명 : 
					<input type="text" name="roadCode" id="roadCode" value="${roadCode}" readonly="readonly">
					<input type="button" value="회사 주소 검색" onclick="javascript:goPopup()">
					</td>
				</tr>
				<tr>
					<td>상세 주소</td>
					<td><input type="text" name="addrDetail" id="addrDetail" value="${addrDetail}"></td>
				</tr>
				<%-- <tr>
					<td>지명</td>
					<td><input type="text" name="addrCode" id="addrCode" value="${addrCode}" readonly="readonly"></td>
				</tr> --%>
	
	<input type="hidden" name="c_grade" value="5">
	<input type="hidden" name="c_dealcount" value="0">
	<input type="hidden" name="c_sellingprice" value="0">
	
	<tr>
		<td colspan="3"  align="center">
		<input type="button" value="가입하기" onclick="javascript:goJoin()">
		<input type="button" value="로그인으로" onclick="javascript:goLogin()">
		<input type="button" value="홈으로" onclick="javascript:goHome()">
		
		
		</td>
	</tr>
</table>
</form>

<script type="text/javascript">
function goPopup(){
    var pop = window.open("/aaa/corpJoin/jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
}
// function goDel(){
	
// 	var frm = document.frm;	
// 	frm.method = "post";
// 	frm.action = "/aaa/corpDel";
// 	frm.submit();
// }
	function goJoin(){
		
		var frm = document.frm;	
		frm.method = "post";
		frm.action = "/aaa/corpJoin/corpJoin";
		frm.submit();
	}
	function goLogin(){
		var frm = document.frm;
		frm.method = "get";
		frm.action="/aaa/corpJoin/corpLogin";
		frm.submit();
	}
	function goHome(){
		var frm = document.frm;
		frm.method = "get";
		frm.action="/aaa/corpJoin/Home";
		frm.submit();
	}
	function goBnCheck(){
		var frm = document.frm;
		frm.method = "post";
		frm.action="/aaa/corpJoin/bnCheck";
		frm.submit();
	}
	function goPwCheck(){
		var frm = document.frm;
		frm.method = "post";
		frm.action="/aaa/corpJoin/pwCheck";
		frm.submit();
	}
</script>

</body>
</html>























