<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<style>
		.select {
		    width: 100%;
		    padding: 12px 20px;
		    margin: 8px 0;
		    display: inline-block;
		    border: 1px solid #ccc;
		    border-radius: 4px;
		    box-sizing: border-box;
		}
		.text {
		    width: 100%;
		    padding: 12px 20px;
		    margin: 8px 0;
		    display: inline-block;
		    border: 1px solid #ccc;
		    border-radius: 4px;
		    box-sizing: border-box;
		}
		
		.button {
		    width: 60%;
		    background-color: #ff3333;
		    color: white;
		    padding: 14px 20px;
		    margin: 8px 0;
		    border: none;
		    border-radius: 4px;
		    cursor: pointer;
		}
		
		.button:hover {
		    background-color: #cc0000;
		}
		
		.div {
			margin-left:400px;
			width: 40%;
		    border-radius: 5px;
		    background-color: #f2f2f0;
		    padding: 20px;
		    text-align: center;
		 }
	</style>
	
	
	<spring:url value="/resources/js/yeob/httpRequest.js" var="httpRequest_js"/>
	<spring:url value="/resources/js/yeob/jquery-1.8.3.min.js" var="min_js"/>
	<script type="text/javascript" src="${ httpRequest_js }"></script>
	<script type="text/javascript" src="${ min_js }"></script>
	
	<script type="text/javascript">

	function home() {
		location.href="/aaa/";
	}

	function searchId() {
		var target = document.getElementById("id").value;
		var params = "key="+target;
		sendRequest("/aaa/mem/idCheck01", params , callback01 , "post");
		
	}
	
	function callback01() {
		if(httpRequest.readyState ==4 ) {
			if(httpRequest.status == 200 ) {
				var rcvText = httpRequest.responseText;
				var isID = /^[a-z0-9]{3,12}$/; 
				var isID2 = /[\d]/;
				var userid = document.getElementById("id");
				if( userid.value.length<1 || !isID.test(userid.value) ) {
					document.getElementById("idSpan").style.color = "red";
					document.getElementById("idSpan").innerHTML="* 3 - 12자 영문소문자와 숫자만 사용"; 
					
				} else if( !isID2.test(userid.value) ) { 
					document.getElementById("idSpan").style.color = "red";
					document.getElementById("idSpan").innerHTML="* 숫자를 포함해야합니다."; 
					
				} else if (rcvText == "일치") {  //result에 true문자열이 있으면 사용가능
					document.getElementById("idSpan").style.color = "red";
					document.getElementById("idSpan").innerHTML="* 중복된 아이디입니다.";
					
				} else if (rcvText == "불일치") {
					document.getElementById("idSpan").style.color = "blue";
					document.getElementById("idSpan").innerHTML="* 사용가능한 아이디입니다.";
				}
				
			} else {
				alert(" **** 실패 : " + httpRequest.status)
			}
		}
	}
	function searchPw() {
		var target01 = document.getElementById("pw").value;
		var isPW = /^[A-Za-z0-9]{3,12}$/;
		var isPW2 = /[\d]/;
		
		if( !isPW.test(target01) || target01.length< 3) { 
			alert("비밀번호는 3~12자의 영문 대-소문자와 숫자혼합 사용해야합니다."); 
			document.getElementById("pwSpan1").style.color = "red";
			document.getElementById("pwSpan1").innerHTML="* 3 - 12자 영문, 숫자 혼합 사용해야합니다.";
		    
		} else if( !isPW2.test(target01) ) { 
		    alert("숫자를 포함해야합니다."); 
		    document.getElementById("pwSpan1").style.color = "red";
			document.getElementById("pwSpan1").innerHTML="* 숫자를 포함해야합니다.";
		    
		} else if ( isPW.test(target01) ){
			document.getElementById("pwSpan1").style.color = "blue";
			document.getElementById("pwSpan1").innerHTML="* 비밀번호 사용가능";
		}
		
	}
	
	function checkPw() {
		var target01 = document.getElementById("pw").value;
		var target02 = document.getElementById("pw_Check").value;
		
		if ( target01 == target02) {
			document.getElementById("pwSpan2").style.color = "blue";
			document.getElementById("pwSpan2").innerHTML="* 비밀번호 일치";
		} else {
			document.getElementById("pwSpan2").style.color = "red";
			document.getElementById("pwSpan2").innerHTML="* 비밀번호가 일치하지 않습니다.";
		} 
	}
	
	function emailCheck(){
		var email02 = document.getElementById("email02").value;
		var email03 = document.getElementById("email03").value;
		
		if(email03 == '직접입력') {
			document.getElementById('email02').value = "";
			document.getelementById('email02').focus();
		} else {
			document.getElementById('email02').value = email03;
		}
	}
	
	function validCheck() {
		var isID = /^[a-z0-9]{3,12}$/; 
		var isID2 = /[\d]/;
		var userid = document.getElementById("id");
		
		if( !isID.test(userid.value) ) { 
		    alert("1111아이디는 3~12자의 영문 소문자와 숫자만 사용할 수 있습니다."); 
		    return 0; 
		}
		if( !isID2.test(userid.value) ) { 
		    alert("숫자를 포함해야합니다."); 
		    return 0; 
		}
        // 첫글자는 반드시 영문소문자, 4~12자로 이루어지고, 숫자가  하나 이상 포함되어야한다.
        // 영문소문자와 숫자로만 이루어져야 한다.
        // \d : [0-9]와 같다. {n,m} : n에서 m사이
        // if(!chk(/^[a-z][a-z\d]{3,11}$/, id, "잘못된 형식의 ID입니다.")) return false;
        // if(!chk(/[\d]/, id, "잘못된 형식의 ID입니다.")) return false;
        //alert(re.test(userid.value));
        
		var isPW = /^[A-Za-z0-9]{3,12}$/;
		var isPW2 = /[\d]/;
        var pw = document.getElementById("pw");
		var pwCheck = document.getElementById("pw_Check");
		
		if( !isPW.test(pw.value) ) { 
			alert("비밀번호는 3~12자의 영문 대-소문자와 숫자혼합 사용해야합니다."); 
		    return 0; 
		}
		if( !isPW2.test(pw.value) ) { 
		    alert("숫자를 포함해야합니다."); 
		    return 0; 
		}
		

		if( pw.value != pwCheck.value ) {
			alert('비밀번호가 일치하지 않습니다.. 다시 입력해 주세요.');
			document.getElementById('pw_Check').value="";
			document.getElementById('pw_Check').focus();
			return false;
		}
		
		if( pw.value == pwCheck.value ) {
			alert('비밀번호가 일치.');
		}
		
        //if(!pwchk(pass.value, pass2.value)) return false;
		

        // 이름 검사 : 2글자 이상,한글로만 입력

        // 통과하지 못하면 한글로 2글자 이상을 넣으세요 메세지 출력
		var isName = /^[가-힝]{2,}$/;
        var name = document.getElementById("name");
        if( !isName.test(name.value) ) {
        	alert('한글만 입력하세요!!!(2글자 이상)');
        	return false;
        }
        
        
	    var tel01 = document.getElementById("tel01");
	    var tel02 = document.getElementById("tel02");
	    var tel03 = document.getElementById("tel03");
	    
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
	    //if(tel1.value != ''){
	   	//	 if(!chk(/^\d{3,4}$/, tel2.value, "둘째자리는 3~4자리 숫자")) return false;
	  	// 	 if(!chk(/^\d{4}$/, tel3.value, "셋째자리는 4자리 숫자")) return false;
	   	// }
	    
	    var isEmail = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z\-]+/;
	    var email01 = document.getElementById("email01").value;
	    var email02 = document.getElementById("email02").value;
		var email = email01+"@"+email02;
		
		
		if( !isEmail.test(email) ) { 
		    alert("이메일 형식이 올바르지 않습니다."); 
		    return 0; 
		}
		
	    
		
	    var ff = document.getElementById("joinFRM");
	    ff.action = "/aaa/mem/registration";
	    ff.method = "post";
	    ff.submit();
	}
</script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	function openAddr(){
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
	            
	        	// 각 주소의 노출 규칙에 따라 주소를 조합한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var fullAddr = data.address; // 최종 주소 변수
	            var extraAddr = ''; // 조합형 주소 변수
	
	            // 기본 주소가 도로명 타입일때 조합한다.
	            if(data.addressType === 'R'){
	                //법정동명이 있을 경우 추가한다.
	                if(data.bname !== ''){
	                    extraAddr += data.bname;
	                }
	                // 건물명이 있을 경우 추가한다.
	                if(data.buildingName !== ''){
	                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
	                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
	            }
				
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('postCode').value = data.zonecode; //5자리 새우편번호 사용
	            document.getElementById('roadAddress').value = fullAddr;
	            
	            document.getElementById('detailAddress').focus();
	            // iframe을 넣은 element를 안보이게 한다.
	            // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
	            
	        }
	    }).open();
	}
</script>

<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"60168",secure:"60173"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body  data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-113" data-genuitec-path="/aaa/src/main/webapp/WEB-INF/views/memPage/center/mem_registration.jsp">

		<div class="div" align="center" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-113" data-genuitec-path="/aaa/src/main/webapp/WEB-INF/views/memPage/center/mem_registration.jsp">
			<h1>DASAM - 회원가입</h1>
			<br>
			<br>
		  <form id="joinFRM" >
		  <table>
		  	<tr>
		  		<td>
		   		 <label for="subject">아이디 : </label><br>
		    	<input class="text" type="text" id="id" name="m_id" placeholder="아이디 입력" onkeyup="searchId()"><br>
		   		 <span id="idSpan" style="color: red;"> * 3-12자 영문소문자, 숫자 혼용 사용</span><br>
		 		<br>
		 		</td>
		 	</tr>
		 	<tr>
		  		<td>
				    <label for="subject">비밀번호 : </label><br>
				    <input class="text" type="text" id="pw" name="m_pw" placeholder="비밀번호 입력" onkeyup="searchPw()"><br>
				    <span id="pwSpan1" style="color: red;"> * 3-12자 영문소문자, 숫자 혼용 사용</span><br>
			 		<br>
			 </td>
		 	</tr>
			 <tr>
		  		<td>
			   		 <label for="subject">비밀번호 : </label><br>
		   			 <input class="text" type="text" id="pw_Check" name="pw_Check" placeholder="비밀번호 확인" onkeyup="checkPw()"><br>
		   			 <span id="pwSpan2" style="color: red;"> * 비밀번호가 일치하지 않습니다.</span><br>
					<br>
				</td>
		 	</tr>
			 <tr>
		  		<td>
		    <label for="subject">이름 : </label>
		    <input class="text" type="text" id="name" name="m_name" placeholder="한글로 입력">
		    	</td>
		 	</tr>
			 <tr>
		  		<td>
		    <label for="subject">주소 : </label>
		    <input class="text" id="postCode" type="text" name="postCode" readonly="readonly" style="width:400px;">
		    <input class="button" type="button" value="우편번호검색" style="width:150px;" onclick="javascript:openAddr()"> <br>
		    <input class="text" id="roadAddress" type="text" name="roadAddress" readonly="readonly" > <br>
		    <input class="text" id="detailAddress" type="text" name="detailAddress" placeholder="나머지 주소 입력"> 
		    </td>
		 	</tr>
			 <tr>
		  		<td>
		  			<label for="subject">성별 : </label>
		  			<input type="radio" name="m_gender" value="남자" checked="checked"> 남자
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="m_gender" value="여자" > 여자&nbsp;
		     	</td>
		 		</tr>
			 <tr>
		  		<td>
		     <label for="subject">핸드폰 : </label>
		    <select class="text" name="tel01" style="width:120px;">
		     <option>010</option>
		     <option>011</option>
		     <option>016</option>
		     <option>017</option>
		     <option>018</option>
		     <option>019</option>
		    </select>
		    - <input class="text" name="tel02" id="tel02" type="text" maxlength="4" style="width:200px;">
		    - <input class="text" name="tel03" id="tel03" type="text" maxlength="4" style="width:200px;">
			 </td>
		 	</tr>
			 <tr>
		  		<td>
		  <label for="subject">E-Mail : </label>
		   <input class="text" type="text" id="email01" name="email01" style="width: 180px;">
		    @
		    <input class="text" type="text" id="email02" name="email02" style="width: 180px;">
		    <select class="select" id="email03" style="width: 150px;" onmouseup="emailCheck()">
		     	<option>- 이메일 선택 -</option>
		        <option>naver.com</option>
		        <option>gmail.com</option>
		        <option>google.com</option>
		        <option>daum.net</option>
		        <option>nate.com</option>
		        <option>hotmail.com</option>
		        <option> 직접입력 </option>
		    </select>
		  </td>
		 	</tr>
			 <tr>
		  		<td>
		 	  <div style="text-align: center;" align="center;">
		  		  <input class="button" type="button" value="회원가입" onclick="javascript:validCheck()">
		  		  <input class="button" type="button" value="취소" onclick="javascript:home()">
		 	  </div>
		   </td>
		 	</tr>
		   </table>
		  </form>
		</div>
</body>
</html> 