<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<spring:url value="/resources/js/yeob/httpRequest.js" var="httpRequest_js"/>
	<spring:url value="/resources/js/yeob/jquery-1.8.3.min.js" var="min_js"/>
	<script src="${ httpRequest_js }"></script>
	<script src="${ min_js }"></script>
	
	<script type="text/javascript">
		var msg = "${msg}";
		if(msg != "") {
			alert(msg);
		}
	</script>
	
	<script type="text/javascript">
		function home() {
			location.href="/aaa/";
		}
		
		function searchID() {
			alert("ccc");      
	
	        // 이름 검사 : 2글자 이상,한글로만 입력
	
	        // 통과하지 못하면 한글로 2글자 이상을 넣으세요 메세지 출력
			var isName = /^[가-힝]{2,}$/;
	        var name = document.getElementById("name");
	        alert( name.value ); 
	        if( !isName.test(name.value) ) {
	        	alert('한글만 입력하세요!!!(2글자 이상)');
	        	return false;
	        }
	        
	        alert("ddd"); 
	        
		    var tel01 = document.getElementById("tel01");
		    var tel02 = document.getElementById("tel02");
		    var tel03 = document.getElementById("tel03");
		    
		    alert( tel02.value );
		    alert( tel03.value );
		    
		    var isTel2 = /^\d{3,4}$/;
		    var isTel3 = /^\d{4}$/;
		    
		    if( !isTel2.test(tel02.value) ) { 
			    alert("3-4자리로 입력해야합니다."); 
			    return 0; 
			}
		    if( !isTel3.test(tel03.value) ) { 
			    alert("4자리로 입력해야합니다."); 
			    return 0; 
			}
		    
		    alert("eee"); 
		    
		    //return false;
			
		    var ff = document.getElementById("id_Find");
		    alert("fff"); 
		    var name1 = ff.name.value;
		    var tel01 = ff.tel01.value;
		    var tel02 = ff.tel02.value;
		    var tel03 = ff.tel03.value;
		    alert("ggg"); 
		    var params = "m_name="+name1+"&m_phone="+tel01+"-"+tel02+"-"+tel03;
		    alert(params);
// 		    ff.submit();
			sendRequest("/aaa/mem/id_Find", params , callback01 , "post");
		    alert("hhhh");
		}
		/* [아이디 찾기 인증번호 임시저장] */
		var saveNum ;
		
		function callback01() {
			if(httpRequest.readyState ==4 ) {
				if(httpRequest.status == 200 ) {
					
					var rcvText = httpRequest.responseText;
					alert(" 인증번호 : " + rcvText);
					saveNum = rcvText;
					alert(" [아이디 찾기 인증번호 임시저장] "+ saveNum);
					
					if (rcvText == "일치하는 정보가 없습니다.") {
						alert("1. " + rcvText);
					} else {
						alert("2. " + rcvText);
						
						var url = "/aaa/mem/showpop?codeNum="+rcvText;
						var popname = "아이디 찾기 인증번호";
						var size = "width=400px, height=250px";
						window.open(url, popname, size);
						
					}
					
					
				} else {
					alert(" **** 실패 : " + httpRequest.status)
				}
			}
		}	
		
		function goEnter() {
			
			var confirmNum = document.getElementById("checkNum").value;
			alert("인증번호"+confirmNum);
			alert("저장된 인증번호"+saveNum);
			if(confirmNum == saveNum) {
				var ff = document.getElementById("id_Find");
			    alert("fff"); 
			    ff.action = "/aaa/mem/FindID";
			    ff.method = "post";
			    ff.submit();
			    alert("ggg"); 
				
			} else {
				alert("인증번호가 일치하지 않습니다. 재발행 후 입력해주세요.")
			}
			
		}
	</script>
	
</head>
<body>
	<form id="id_Find">
		<table border="1" style="text-align: center;" align="center;">
			<tr>
				<td>이름</td>
				<td>
					<input type="text" id="name" name="m_name" placeholder="한글로 입력">
				</td>
			</tr>
			<tr>
				<td>핸드폰</td>
				<td>
					<select name="tel01" id="tel01">
						<option>010</option>
						<option>011</option>
						<option>016</option>
						<option>017</option>
						<option>018</option>
						<option>019</option>
					</select>
					- <input name="tel02" id="tel02" type="text" maxlength="4">
					- <input name="tel03" id="tel03" type="text" maxlength="4">
					&nbsp;&nbsp;&nbsp;					
					<input type="button" value="인증번호받기" onclick="javascript:searchID()">
				</td>
			</tr>
			<tr>
				<td>인증번호</td>
				<td>
					<input type="text" id="checkNum" name="checkNum" placeholder="인증번호 입력">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" value="확인" onclick="javascript:goEnter()">
					<input type="button" value="취소" onclick="javascript:home()">
				</td>
			</tr>
		</table>
	</form>
	
	
</body>
</html>