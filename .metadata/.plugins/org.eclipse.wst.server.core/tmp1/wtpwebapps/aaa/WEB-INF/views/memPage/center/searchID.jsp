<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		.bodyTitle {
			
			font-family: "배달의민족 한나는 열한살";
			font-style: bold;
			font-size: 44px;
			
		}
		
		.select {
		    width: 50%;
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
	<script type="text/javascript">
		function home() {
			location.href="/aaa/";
		}
		function login() {
			location.href="/aaa/mem/loginForm";
		}
	</script>
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"60168",secure:"60173"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-122" data-genuitec-path="/aaa/src/main/webapp/WEB-INF/views/memPage/center/searchID.jsp">
	<c:choose>
			<c:when test="${!m_id.isEmpty() }">
				<div class="div" align="center">
			<h1 class="bodyTitle" >DASAM - 아이디 찾기</h1>
			<br>
			<br>
		  
		  <table border="1" style="text-align: center; " align="center;">
		  	 <tr>
		  		<td style="width: 50%; ">
		    		<label class="subject" for="subject">이 름 : </label>
		   		</td>
		   		<td>
		    		<label class="subject" for="subject">${ m_name } </label>
		   		</td>
		 	</tr>
		 	 <tr>
		  		<td>
		    		<label class="subject" for="subject">아이디 : </label>
		   		</td>
		   		<td>
		    		<label class="subject" for="subject">${ m_id }</label>
		   		</td>
		 	</tr>
			<tr>
		  		<td colspan="2">
				 	<div style="text-align: center;" align="center;">
				    	<input class="button" type="button" value="로그인" onclick="javascript:login()">
						<input class="button" type="button" value="취소" onclick="javascript:home()">
				 	</div>
		 		</td>
		 	</tr>
		   </table>
		  
		</div>
	
			</c:when>
			
			<c:otherwise>
				<div>정보가 없습니다.</div>
			</c:otherwise>
	</c:choose>
</body>
</html>