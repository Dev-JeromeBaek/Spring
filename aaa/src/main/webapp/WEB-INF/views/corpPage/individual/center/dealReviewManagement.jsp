<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style type="text/css">
	 tr {border: 1px solid red; }
	 td {width: 500px; }
	 .titi td{border-top: 1px solid gray;} 
	</style>
	<script type="text/javascript" src="/aaa/resources/js/yeob/httpRequest.js"></script>
</head>
<body>
<!-- 	<h1>딜 리뷰 관리 페이지</h1> -->

<h1>[<strong>${di.di_name }</strong> 상품 리뷰 리스트]</h1>
<table>
	<c:if test="${drList!=null }">
		<c:forEach var="dr" items="${drList }">
			<tr class="titi" id="tititi${dr.dr_num }" >
				<td><a onclick="ansPop('${dr.dr_num}')">${dr.dr_title}</a></td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<td><input type="button" value="리뷰삭제하기" onclick="delReview(${dr.dr_num})"></td>
			</tr>
			<tr class="concon" id="cococo${dr.dr_num }" >
				<td colspan="2">${dr.dr_content }</td>
			</tr>
		</c:forEach>
	</c:if>
</table>

<script type="text/javascript">
$(".concon").hide();
	function delReview(drnum) {
		if(confirm("해당 리뷰를 삭제하시겠습니까?")){
			if(prompt("비밀번호를 입력해주세요")=="${corpLogin.c_pw}"){
				alert("해당 리뷰를 삭제합니다.");
				sendRequest("/aaa/idvCorp/delReview","dr_num="+drnum,delRe,"post");
			}else{
				alert("비밀번호가 일치하지 않습니다.");
			}
		}
	}
	function delRe() {
		if(httpRequest.readyState==4){
			if(httpRequest.status==200){
				var msg = httpRequest.responseText;
// 				alert(msg);
				if(msg.split(",")[0]=="리뷰 삭제 완료"){
// 					alert("삭제삭제");
					$("#tititi"+msg.split(",")[1]).remove();
					$("#cococo"+msg.split(",")[1]).remove();
				}
			}else {
				alert("*** 실패: "+httpRequest.status);
			}
		}
	}
	
var wewe = document.getElementsByClassName("titi");
for(var i=0;i<wewe.length;i++){
	$(wewe.item(i)).click(function() {
		$(this.nextElementSibling).toggle();
	});
}
</script>
	
</body>
</html>
