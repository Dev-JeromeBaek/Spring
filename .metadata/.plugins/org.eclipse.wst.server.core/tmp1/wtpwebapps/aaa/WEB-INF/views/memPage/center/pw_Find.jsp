<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	
	<style>
		.bodyTitle {
			
			font-family: "배달의민족 한나는 열한살";
			font-style: bold;
			font-size: 44px;
			
		}
		
		.select {
		    width: 100%;
		    padding: 12px 20px;
		    margin: 8px 0;
		    display: inline-block;
		    border: 1px solid #ccc;
		    border-radius: 4px;
		    box-sizing: border-box;
		    font-family: "배달의민족 주아";
			font-size: 20
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
			width: 50%;
		    border-radius: 5px;
		    background-color: #f2f2f0;
		    padding: 20px;
		    text-align: center;
		 }
	</style>
	
<title>Insert title here</title>
	<spring:url value="/resources/js/yeob/httpRequest.js" var="httpRequest_js"/>
	<spring:url value="/resources/js/yeob/jquery-1.8.3.min.js" var="min_js"/>
	<script src="${ httpRequest_js }"></script>
	<script src="${ min_js }"></script>
	
	<script type="text/javascript">
		function home() {
			location.href="/aaa/";
		}
		
		function searchPW() {
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
	        
	        //if(!pwchk(pass.value, pass2.value)) return false;
			
		        
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
		  
		    var ff = document.getElementById("pw_Find");
		    var id1 = ff.id.value;
		    var tel01 = ff.tel01.value;
		    var tel02 = ff.tel02.value;
		    var tel03 = ff.tel03.value;
		    var params = "m_id="+id1+"&m_phone="+tel01+"-"+tel02+"-"+tel03;
// 		    ff.submit();
			sendRequest("/aaa/mem/pw_Find", params , callback01 , "post");
		}
		
		/* [아이디 찾기 인증번호 임시저장] */
		var saveNum;
		
		function callback01() {
			if(httpRequest.readyState ==4 ) {
				if(httpRequest.status == 200 ) {
					
					var rcvText = httpRequest.responseText;
					alert(" 인증번호 : " + rcvText);
					saveNum = rcvText;
					alert(" [아이디 찾기 인증번호 임시저장] "+ saveNum);
					
					if (rcvText == "일치하는 정보가 없습니다.") {
					} else {
						var url = "/aaa/mem/showpop?codeNum="+rcvText;
						var popname = "비밀번호 찾기 인증번호";
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
			if(confirmNum == saveNum) {
				var ff = document.getElementById("pw_Find");
			    ff.action = "/aaa/mem/FindPW";
			    ff.method = "post";
			    ff.submit();
				
			} else {
				alert("인증번호가 일치하지 않습니다. 재발행 후 입력해주세요.")
			}
			
		}
	</script>
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"60168",secure:"60173"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-116" data-genuitec-path="/aaa/src/main/webapp/WEB-INF/views/memPage/center/pw_Find.jsp">
	<div class="div" align="center" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-116" data-genuitec-path="/aaa/src/main/webapp/WEB-INF/views/memPage/center/pw_Find.jsp">
			<h1 class="bodyTitle" >DASAM - 비밀번호 찾기</h1>
			<br>
			<br>
		  <form id="pw_Find" >
		  <table>
		  	 <tr>
		  		<td>
		    		<label class="subject" for="subject">아이디 : </label>
		   			 <input class="text" type="text" id="id" name="m_id" placeholder="한글로 입력">
		    		<br>
		    		<br>
		    	</td>
		 	</tr>
			 <tr>
		  		<td>
		   			<label class="subject" for="subject">핸드폰 : </label>
		   			<br>
		    		<select class="text" name="tel01" style="width:120px;">
					     <option>010</option>
					     <option>011</option>
					     <option>016</option>
					     <option>017</option>
					     <option>018</option>
					     <option>019</option>
		    		</select>
		    		- <input class="text" name="tel02" id="tel02" type="text" maxlength="4" style="width:220px; text-align: center;">
		    		- <input class="text" name="tel03" id="tel03" type="text" maxlength="4" style="width:220px; text-align: center;">
					&nbsp;&nbsp;&nbsp;					
					<input class="button" type="button" value="인증번호받기" onclick="javascript:searchPW()" style="width:120px ! important;">
					<br>
					<br>
				</td>
		 	</tr>
		 	<tr>
				<td>
					<label class="subject" for="subject">인증번호 : </label>
					<input class ="text" type="text" id="checkNum" name="checkNum" placeholder="인증번호 입력">
					<br>
					<br>
					<br>
				</td>
			</tr>
			<!--  <tr>
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
		 	</tr> -->
		 	
			<tr>
		  		<td>
				 	<div style="text-align: center;" align="center;">
				    	<input class="button" type="button" value="확인" onclick="javascript:goEnter()">
						<input class="button" type="button" value="취소" onclick="javascript:home()">
				 	</div>
		 		</td>
		 	</tr>
		   </table>
		  </form>
		</div>
	
	
	
</body>
</html>