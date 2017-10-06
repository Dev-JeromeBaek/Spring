<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			
			width: 400px;
			heigth: 600px;
		    border-radius: 5px;
		    background-color: #f2f2f0;
		    padding: 20px;
		 }
		/*  .textarea {
		 	width: 300px;
		 	heigth: 400px;
		    padding: 12px 20px;
		    margin: 8px 0;
		    display: inline-block;
		    border: 1px solid #ccc;
		    border-radius: 4px;
		    box-sizing: border-box;
		 } */
		 .subject {
		 	margin: 0px;
		 	text-align: left;
		 	align: left;
		 }
	</style>
	<script type="text/javascript">
		var msg = "${msg}";
		if(msg != "") {
			alert(msg);
			msg == "";
			self.close();
		}
		
		function reviewSubmit() {
			var ff = document.getElementById("reviewFRM");
		    ff.action = "/aaa/review/reviewSubmit";
		    ff.method = "post";
		    ff.submit();
		    
		}
		
		
	</script>
</head>
<body>
	<div class="div" >
			<h1 style="text-align: center;">구매후기</h1>
			<br>
			<br>
		  <form id="reviewFRM" >
		  <table>
		  	<tr>
		  		<td>
		   		 <label class="subject" >상품명 : </label><br>
		    	<input class="text" type="text" id="dealName" name="dealName" value="${ dealName }"><br>
		 		<br>
		 		</td>
		 	</tr>
		 	<tr>
		  		<td>
				    <label class="subject">제 목 : </label><br>
				    <input class="text" type="text" id="dr_title" name="dr_title" autofocus="autofocus" placeholder="상품후기 제목" ><br>
			 		<br>
			 </td>
		 	</tr>
			 <tr>
		  		<td>
			   		 <label class="subject">내 용 : </label><br>
		   			 <textarea name="dr_content" cols="40" rows="10"  placeholder="상품후기 내용을 입력해주세요."></textarea>
				</td>
		 	</tr>
			 <tr>
		  		<td>
		 	 	 <div style="text-align: center;" align="center;">
		  			  <input class="button" type="button" value="확인" onclick="javascript:reviewSubmit()">
		  			  <input class="button" type="button" value="취소" onclick="javascript:self.close()">
		 	 		  <input type="hidden" name="di_num" value="${ di_num }">
		 	 		  <input type="hidden" name="dr_m_num" value="${m_num}">
		 	 	 </div>
		   		</td>
		 	</tr>
		   </table>
		  </form>
		</div>
</body>
</html>