<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.button1231{
 background: #75BC00;
 padding:7px 30px 7px 30px;
 font-size:15px;
 font-weight:bold;
 color:#000000;
 text-align:center;
 border:solid 1px #99E000;
 background: -moz-linear-gradient(0%, 100%, 90deg, #75BC00, #ffffff);
 background: -webkit-gradient(linear, 0% 0%, 0% 100%, from(#ffffff), to(#75BC00));

border-radius:5px;
 -moz-border-radius:5px;
 -webkit-border-radius:5px;
 border-bottom-color:#3F8600;
 text-shadow:0 -1px 0 #3F8600;
 }
.button2123{
 background: #2e8ce3;
 padding:7px 30px 7px 30px;
 font-size:15px;
 font-weight:bold;
 color:#000000;
 text-align:center;
 border:solid 1px #73c8f0;
 background: -moz-linear-gradient(0%, 100%, 90deg, #2e8ce3, #ffffff);
 background: -webkit-gradient(linear, 0% 0%, 0% 100%, from(#ffffff), to(#2e8ce3));

border-radius:5px;
 -moz-border-radius:5px;
 -webkit-border-radius:5px;
 border-bottom-color:#196ebb;
 text-shadow:0 -1px 0 #196ebb;
 }

.button3123{
 background: #F361DC;
 padding:7px 30px 7px 30px;
 font-size:15px;
 font-weight:bold;
 color:#000000;
 text-align:center;
 border:solid 1px #FFB2D9;
 background: -moz-linear-gradient(0%, 100%, 90deg, #F361DC, #ffffff);
 background: -webkit-gradient(linear, 0% 0%, 0% 100%, from(#ffffff), to(#F361DC));

border-radius:5px;
 -moz-border-radius:5px;
 -webkit-border-radius:5px;
 border-bottom-color:#99004C;
 text-shadow:0 -1px 0 #99004C;
 }
</style>
</head>
<body>
	<h2 style=" font: italic bold 5.0em/1em Georgia, serif;">Membership Phone History</h2>
	
	
	<form name="frmAdminMemo">
	
	<table>
		<br>
		<br>
		<br>
		
		<tr>
			<td style="font-weight:bold; font-size: 18px;">회원 번호</td>
			<td style="font-weight:bold; font-size: 18px;">회원 전화번호</td>
			<td  style="font-weight:bold; font-size: 18px;">회원 아이디</td>
			<td style="font-weight:bold; font-size: 18px;">회원 가입 날짜</td>
		</tr>	
		
		<c:forEach var = "each" items="${memoList}">
		<c:choose>
		<c:when test="${each.getM_memo() != null}">
			<tr>
				<td><a style="font-style: italic; font-weight: bold" onclick="javascript:goShowMemo('${each.getM_num()}')">${each.getM_num()}</a></td>
				<td><a style="font-style: italic; font-weight: bold" onclick="javascript:goShowMemo('${each.getM_num()}')">${each.getM_phone()} </a></td>
				<td><a style="font-style: italic; font-weight: bold" onclick="javascript:goShowMemo('${each.getM_num()}')">${each.getM_id()}</a></td>
				<td><a style="font-style: italic; font-weight: bold" onclick="javascript:goShowMemo('${each.getM_num()}')">${each.getM_fordate()}</a></td>
			</tr>
		</c:when>
		<c:otherwise>
			질문 내용이 없습니다.
		</c:otherwise>
		</c:choose>
		</c:forEach>
<!-- 			<tr> -->
<!-- 			<td colspan="10"> -->
<%-- 			<c:if test="${ pageDTO.getShowPageNumberBegin() != 1 }"> --%>
<!-- 				<a onclick="location.href='?nowPage=1'">◀◀</a> &nbsp; -->
<%-- 				<a onclick="location.href='?nowPage=${pageDTO.getNowPage()-1}'">◀</a> --%>
<%-- 			</c:if> --%>
			
<%-- 			<c:forEach var="i" begin="${ pageDTO.getShowPageNumberBegin() }" end="${pageDTO.getShowPageNumberEnd()}" step="1"> --%>
<%-- 				<c:choose> --%>
<%-- 					<c:when test="${pageDTO.getNowPage() == i }"> --%>
<%-- 						[${i}] --%>
<%-- 					</c:when> --%>
<%-- 					<c:otherwise> --%>
<%-- 						<a href="?nowPage=${i}">[${i}]</a> --%>
<%-- 					</c:otherwise> --%>
<%-- 				</c:choose>			 --%>
<%-- 			</c:forEach> --%>
			
<%-- 			<c:if test="${pageDTO.getShowPageNumberEnd() != pageDTO.getEndPage()}"> --%>
<%-- 				<a onclick="location.href='?nowPage=${pageDTO.getNowPage()+1 }'">▶</a> --%>
<%-- 				<a onclick="location.href='?nowPage=${pageDTO.getEndPage()}'">▶▶</a>	 --%>
<%-- 			</c:if> --%>
<!-- 			</td>		 -->
<!-- 		</tr> -->
		
	</table>
		<br><br><br>
	<!-- 테이블 분리 배치  -->
	
	<div >
	<c:forEach var = "each" items="${memoList}">
	<c:choose>
		<c:when test="${ each.getM_memo() != null}">
			<div id="showmemo${each.getM_num()}" class="memoQnA" style="float:left; width: 1200px">
				<c:forEach var="i" items="${each.m_memo.split('///')}" varStatus="Num">
				<span style="float:left;" >
<%-- 			<input type="text" value="${each.m_id}"> --%>
				
				<input  type="text" value="질문 제목 : " style="width: 20%; float: left; font: bold;">
				<input id="title${i.split(',,,')[1]}" type="text" value="${i.split(',,,')[0].split(',/,')[1]}" readonly="readonly">
				<c:choose>				
				<c:when test="${ i.split(',,,')[0].split(',/,')[0] != ''}">
						<span><font color="blue" size="5px">답변 완료</font></span>
				</c:when>
				<c:otherwise>
						<span><font color="red" size="5px">답변 미 완료</font></span>
				</c:otherwise>
				</c:choose>
				
				<tr>
				<c:if test="${ i.split(',,,')[0].split(',/,')[0] == ''}"> 	
					<td><input class="button1231"  type="button" value="답변 달기" onclick="javascript:goOpenRe('${i.split(",,,")[1]}')"></td>
				</c:if>
					
				<c:choose>		
				<c:when test="${ i.split(',,,')[0].split(',/,')[0] == ''}"> 
					<td><input class="button3123" type="button" value="질문 삭제" onclick="javascript:goDelQnA2('${i.split(",,,")[1]}')"></td>
				</c:when>		
				<c:otherwise>	
					<td><input class="button3123" type="button" value="질문 삭제" onclick="javascript:goDelQnA('${i.split(",,,")[1]}')"></td>
				</c:otherwise>	
				</c:choose>	
					<td><input  style="width:75; font-family:돋움; background-color:#E9967A; border:1 solid #A0DBE4" id="showReSave${i.split(',,,')[1]}" class="memoQnA" type="button" value="답변 등록" onclick="javascript:goSaveRe('${i.split(",,,")[1]}')"></td>
				</tr>
				</span>
				
<!-- 				<span style="float:left;"> -->
<!-- 					내용 : -->
<!-- 				</span> -->
				<span>
					<textarea id="m_content${i.split(',,,')[1]}" rows="5" cols="5" readonly="readonly">${i.split(',,,')[1]}</textarea>
				</span><br>
				<c:choose>				
				<c:when test="${ i.split(',,,')[0].split(',/,')[0] != ''}"> 
						<span style="float: left;">답변 내용 :</span> 
				
				<c:choose>
				<c:when test="${ i.split(',,,')[0].split(',/,')[0] == ''}"> 	
				
				</c:when>
					 
				<c:otherwise>
				<tr>	
					<td><input class="button2123" type="button" value="수정 하기" onclick="javascript:goOpenModi('${i.split(",,,")[1]}')"></td>
					<td><input style="width:75; font-family:돋움; background-color:#E9967A; border:1 solid #A0DBE4" id="showModiSave${i.split(',,,')[1]}" class="memoQnA" type="button" value="수정 등록" onclick="javascript:goModiRe('${i.split(",,,")[1]}')"></td>
					<td><input class="button3123" type="button" value="답변 삭제" onclick="javascript:goDelRe('${i.split(",,,")[1]}')"></td>
				</tr>			
				</c:otherwise>	
				</c:choose>	
				
						<span><textarea id="review${i.split(',,,')[1]}" rows="5" cols="5" readonly="readonly">${i.split(',,,')[0].split(',/,')[0]}</textarea></span><br>
				</c:when>
				</c:choose>
				
					<span><textarea id="showRe${i.split(',,,')[1]}" class="memoQnA" placeholder="답변을 달아 주세요."></textarea></span>
					
					<span><textarea id="showModi${i.split(',,,')[1]}" class="memoQnA" placeholder="수정 내용을 적어 주세요."></textarea></span>
				
					
				
					
					<input type="hidden" name="m_num" value="${each.getM_num()}">
					</c:forEach>
			</div>
			</c:when>
			</c:choose>
	</c:forEach>
	</div>
</form>	

<script type="text/javascript">
$(".showhide").hide();
$(".memoQnA").hide();


function goOpenRe(m_num){
	$("#showRe"+m_num).slideToggle();
	$("#showReSave"+m_num).slideToggle();
}
function goShowMemo(m_num){
	$("#showmemo"+m_num).slideToggle();
}

function goOpenModi(m_num){
	$("#showModi"+m_num).slideToggle();
	$("#showModiSave"+m_num).slideToggle();
	
}
function goModiRe(m_num){
	
	var review = $("#review"+m_num).val();
	var modi = $("#showModi"+m_num).val();
	var con = $("#m_content"+m_num).val();
	var tit = $("#title"+m_num).val();
	var params = "review="+review+"&m_title="+tit+"&m_content="+con+"&m_memoModi="+modi;
	
	var frm = document.frmAdminMemo;
	frm.method = "post";
	frm.action = "/aaa/admin/modiRe?"+params;
	frm.submit();
}

function goDelRe(m_num){
	var con = $("#m_content"+m_num).val();
	var tit = $("#title"+m_num).val();
	var review = $("#review"+m_num).val();
	
	var params = "review="+review+"&m_title="+tit+"&m_content="+con;
	
	var frm = document.frmAdminMemo;
	frm.method = "post";
	frm.action = "/aaa/admin/delRe?"+params;
	frm.submit();
	
}

function goDelQnA2(m_num){
	var con = $("#m_content"+m_num).val();
	var tit = $("#title"+m_num).val();
	var params = "m_title="+tit+"&m_content="+con;
	
	var frm = document.frmAdminMemo;
	frm.method = "post";
	frm.action = "/aaa/admin/delQnA2?"+params;
	frm.submit();
	
}


function goDelQnA(m_num){
	var con = $("#m_content"+m_num).val();
	var tit = $("#title"+m_num).val();
	var review = $("#review"+m_num).val();
	
	var params = "review="+review+"&m_title="+tit+"&m_content="+con;
	
	var frm = document.frmAdminMemo;
	frm.method = "post";
	frm.action = "/aaa/admin/delQnARe?"+params;
	frm.submit();
}



function goSaveRe(m_num){
		
		var re = $("#showRe"+m_num).val();
		var con = $("#m_content"+m_num).val();
		var tit = $("#title"+m_num).val();
		
		var params = "m_memoRe="+re+"&m_title="+tit+"&m_content="+con;
		
		
		
		var frm = document.frmAdminMemo;
		frm.method = "post";
		frm.action = "/aaa/admin/saveMemo?"+params;
		frm.submit();
	}

</script>
	

	

</body>
</html>

