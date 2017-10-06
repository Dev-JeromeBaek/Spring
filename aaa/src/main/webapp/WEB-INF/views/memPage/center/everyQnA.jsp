<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<%--     <c:set var = "min_js" value="/resources/js/yeob/jquery-1.8.3.min.js"> --%>
     <spring:url value="/resources/js/yeob/jquery-1.8.3.min.js" var="min_js" /> 
    <script type="text/javascript" src="${ min_js }"></script>
    
    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body { margin-left: 0px; margin-top: 0px; margin-right: 0px; margin-bottom: 0px; }
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

.d2{
/* 	border: 1px solid red; */
	overflow: auto;
	width: 1500px;
	margin :0 auto;
	height: 400px;
}

.d3{
/*  	border: 1px solid graytext; */
	overflow: auto;
	width: 685px;
/* 	margin :0 auto; */
	height: 500px;
	font-weight:bold; 
/* 	color:#ff0080; */
/* 	background-color:gray; */
/* 	font-style: gray;  */
	font-size: 18px;
	float: left;
/* 	border-right: 1px gray; */
}

.d33{
/* 	border: 4px solid red; */
	overflow: auto;
	width: 1400px;
	margin :0 auto;
	height: 500px;
}

</style>
<script type="text/javascript">
	if(${adminLogin != null}){
		location.href = "/aaa/mem/adminMemo";
	}
</script>

</head>
<body>
	<form name="frmMemo">
	<h2 style=" font: italic bold 5.0em/1em Georgia, serif;">Frequently asked questions</h2>
	<span><br></span>
	<span><br></span>
	<span><br></span>
	<span><br></span>
	
	
	<div class="d33">
	<div class="d3">
		<span style="background-color: gray; float: left"  id="qna0">Q.상품 교환을 신청했는데, 환불로 변경하고 싶습니다. 어디에서 할 수 있나요?</span>
		<span>
				<textarea style="font-size: 15px;" id="q0"  class="q1"  rows="200" cols="200" readonly="readonly">
						
		교환철회 후 환불로 재접수, 또는 고객센터로 문의

		교환신청 후 환불로 변경을 원하실 경우 [마이페이지→ 구매내역]에서 

		교환철회 후 환불로 다시 접수해주시면 됩니다.

		단, 교환철회 버튼이 노출되지 않는 경우에는 직접 처리가 불가하오니, 
						
		이 경우에는 1:1문의 게시판 또는 고객센터 (1544-6240)로 문의 해 주시기 바랍니다. 

		※ 단, 교환상품이 이미 발송 된 경우 변경은 불가합니다.
						
				</textarea>
				</span>
		<br><br>
<!-- 		//////////////////////////////////////////////////////////// -->

		<span style="float: left; float: left;" id="qna1">Q.배송상품을 받았는데 파손이 됐습니다. 어떻게 해야 하나요?</span>
		<span>
				<textarea style="font-size: 15px;" id="q1"  class="q1" rows="200" cols="200" readonly="readonly">
						
		고객센터로 문의

		수령하신 상태 그대로를 사진으로 남기신 후, 
		
		1:1문의 게시판을 통해 사진을 첨부하여 문의를 주시면 
		
		신속히 확인하여 답변드리겠습니다.
						
				</textarea>
			</span>
		<br><br>
		
		<span style="background-color: gray;float: left;" id="qna2">Q.배송지연으로 환불했는데, 상품이 배송되었어요. 어떻게 해야 하나요?</span>
		<span>
				<textarea style="font-size: 15px;"  id="q2"  class="q1" rows="200" cols="200" readonly="readonly">
						
		배송된 상품은 수취거절

		환불완료 후, 배송된 상품은 수취거절 해 주시기 바랍니다.

		수취거절을 하시지 못한 경우, 
		
		상품수거를 위해 1:1문의 게시판
		
		 또는 고객센터(1544-6240)로 문의 해 주시기 바랍니다.

		※ 반품을 하지 않는 경우, 상품금액을 입금요청할 수 있습니다.

						
				</textarea>
				</span>
		<br><br>
		<span style="float: left;" id="qna3">Q.휴면 안내 메일을 받았는데, 제 개인정보를 삭제하고 싶어요.</span>
		<span>
				<textarea style="font-size: 15px;" id="q3"  class="q1" rows="200" cols="200" readonly="readonly">
						
		로그인 후 [마이페이지→개인정보] 하단에서 탈퇴

		휴면 안내 메일은 휴면 전환 전의 사전 안내 메일이며, 
		
		안내 된 예정일에 맞춰 휴면 계정으로 전환됩니다. 

		만약 정보보관이나 티몬 이용을 원치 않으신다면, 
		
		로그인 후 [마이페이지→개인정보] 하단에서 탈퇴 하실 수 있습니다.

						
				</textarea>
				</span>
		<br><br>
		<span style="background-color: gray;float: left;" id="qna4">Q.휴면 전환에 대한 안내 메일을 받았어요.</span>
		<span>
				<textarea style="font-size: 15px;"  id="q4"  class="q1" rows="200" cols="200" readonly="readonly">
						
		휴면 계정으로 전환되기 전 메일을 통해 사전 안내

		고객님의 개인정보 보호를 위해 정보통신망 이용촉진 
		
		및 정보보호 등에 관한 법률에 따라

		1년 동안 티몬 서비스를 이용하지 않은 고객님의 계정은 휴면으로 전환 됩니다.
						
		휴면 계정으로 전환되기 전 메일을 통해 사전 안내를 드리고 있습니다. 

						
				</textarea>
				</span>
		<br><br>
		<span style="float: left;"  id="qna5">Q.휴면 계정인데 탈퇴하고 싶어요.</span>
		<span>
				<textarea style="font-size: 15px;" id="q5"  class="q1" rows="200" cols="200" readonly="readonly">
						
		휴면 해제 후 탈퇴 가능

		휴면 계정 상태에서는 즉시 탈퇴가 어려우며, 
		
		휴면 해제 후 [마이페이지→개인정보] 하단에서 하실 수 있습니다.
						
		휴면 해제는 로그인 시 노출되는 휴면계정 안내 창에서 
		
		[확인]버튼을 통해 즉시 처리가 가능합니다. 

						
				</textarea>
			</span>
		<br><br>
		<span style="background-color: gray;float: left;" id="qna6">Q.휴면 전환에 대한 안내 메일을 받았어요.</span>
		<span>
				<textarea style="font-size: 15px;" id="q6"  class="q1" rows="200" cols="200" readonly="readonly">
						
		로그인 시 휴면계정 안내창에서 해제 

		고객님의 개인정보 보호를 위해 1년 동안 
		
		티몬 서비스를 이용하지 않은 고객님의 계정은 휴면으로 전환되며, 
						
		전환 된 고객님의 개인정보는 별도 DB로 분리하여 안전하게 보호합니다. 

		다시 티몬을 이용하기 위해서는 로그인 시 노출되는 휴면계정 안내 창에서 
		
		[확인]버튼을 통해 즉시 휴면 해제가 가능합니다. 
		</textarea>
		</span>
		<br><br>
<!-- 		<tr><td>Q.휴면 계정인데 탈퇴하고 싶어요.</td></tr> -->
<!-- 		<tr><td>Q.휴면 해제는 어떻게 하나요?</td></tr> -->
<!-- 		<tr><td>Q.주문한 상품은 언제 배송되나요?</td></tr> -->
<!-- 		<tr><td>Q.구매한 상품 중 일부만 배송되었습니다. 어떻게 해야 하나요?</td></tr> -->
<!-- 		<tr><td>Q.해외배송 상품을 주문했는데, 배송흐름이 없습니다. 어떻게 해야 하나요?</td></tr> -->
				
</div>	

<div class="d3">
		<span style="background-color: gray; float: left"  id="qna00">Q.실시간 계좌이체란 무엇인가요?</span>
		<span>
				<textarea style="font-size: 15px;" id="q00"  class="q1"  rows="200" cols="200" readonly="readonly">
						
		은행계좌로부터 바로 구매대금을 송금하는 결제방법

		실시간계좌이체란, 주문과정에서 고객님의 은행계좌로부터 
		
		바로 구매대금을 송금하는 결제방법입니다.

						
				</textarea>
				</span>
		<br><br>
<!-- 		//////////////////////////////////////////////////////////// -->

		<span style="float: left; float: left;" id="qna11">Q.환불 받기로 했는데, 벌써 카드대금이 청구 되었어요.</span>
		<span>
				<textarea style="font-size: 15px;" id="q11"  class="q1" rows="200" cols="200" readonly="readonly">
						
환불완료 후 영업일 기준 3~5일 소요

카드 승인취소에 대한 환불처리는 카드사마다 다소 차이가 있으나, 

보통 다음과 같이 처리됩니다. 

[대금 출금 전 카드승인 취소]

정상승인취소되며, 

한도액 복구는 영업일 기준 약 3~5일 소요됩니다.

[대금 출금 후 카드승인 취소]

익월 환급 또는 한도복구가 진행됩니다.

자세한 내용은 카드사 별로 상이하오니 해당 카드사로 문의해 주시기 바랍니다.

						
				</textarea>
			</span>
		<br><br>
		
		<span style="background-color: gray;float: left;" id="qna22">Q.신용카드로 결제했는데, 다른 방법으로 환불받을 수 있나요?</span>
		<span>
				<textarea style="font-size: 15px;"  id="q22"  class="q1" rows="200" cols="200" readonly="readonly">
						
카드 승인취소로만 가능

신용카드로 결제 후 환불 시에는 카드 승인내역을 취소하는 방법으로 환불이 진행됩니다.

신용카드 결제 후 환불에 대한 상세내용은 다음과 같습니다. 


[신용카드 결제 환불]

∙ 카드 승인취소로 진행됩니다.

∙ 결제당일 취소는 '환불완료' 후 2시간 이내에 이루어집니다.(일부 금액취소 제외)

∙ 일부 금액취소나 결제당일 이후 취소는 '환불완료' 일로부터 약 3~5일 소요됩니다. (주말, 공휴일 제외)

∙ 이미 결제금액이 포함되어 카드대금이 청구 되었다면 해당 카드사에서 익월 환급해 드리거나, 한도복구가 진행됩니다.



						
				</textarea>
				</span>
		<br><br>
		<span style="float: left;" id="qna33">Q.TMONPAY 계좌이체 결제 시 공인인증서가 필요한가요?</span>
		<span>
				<textarea style="font-size: 15px;" id="q33"  class="q1" rows="200" cols="200" readonly="readonly">
공인인증서 필요없이 결제 비밀번호 등록하여 사용

공인인증서 필요없이 결제비밀번호만으로 결제가 가능합니다.

※ 단, TMONPAY 계좌이체는 앱에서만 이용이 가능합니다.
						
				</textarea>
				</span>
		<br><br>
		<span style="background-color: gray;float: left;" id="qna44">Q.PAYCO 간편계좌 결제 시 공인인증서가 필요한가요?</span>
		<span>
				<textarea style="font-size: 15px;"  id="q44"  class="q1" rows="200" cols="200" readonly="readonly">
						
공인인증서 필요없이 ARS 인증 후 결제 비밀번호 등록하여 사용

공인인증서 필요없이, 결제수단 등록시에는 최초 1회 ARS 인증, 이후부터는 PAYCO 결제비밀번호만으로 결제가 가능합니다.
						
				</textarea>
				</span>
		<br><br>
		<span style="float: left;"  id="qna55">Q.모바일 환경에서 실시간 계좌이체는 불가한가요?</span>
		<span>
				<textarea style="font-size: 15px;" id="q55"  class="q1" rows="200" cols="200" readonly="readonly">
						
모바일은 실시간 계좌이체 이용 불가

모바일에서는 실시간 계좌이체를 지원하지 않습니다.

모바일에서는 TMONPAY 신용카드, 신용카드, 휴대폰 결제, 무통장입금, 카카오페이, PAYCO 결제가 가능합니다.

						
				</textarea>
			</span>
		<br><br>
		<span style="background-color: gray;float: left;" id="qna66">Q.다른 사람 명의의 휴대폰에서 카카오페이 사용이 가능한가요?</span>
		<span>
				<textarea style="font-size: 15px;" id="q66"  class="q1" rows="200" cols="200" readonly="readonly">
						
본인 명의의 휴대폰에서만 서비스 이용 가능

카카오페이는 실명확인을 전제로 운영되는 결제 서비스로, 

본인 명의의 휴대폰에서만 서비스 이용이 가능합니다.

		</textarea>
		</span>
		<br><br>
<!-- 		<tr><td>Q.휴면 계정인데 탈퇴하고 싶어요.</td></tr> -->
<!-- 		<tr><td>Q.휴면 해제는 어떻게 하나요?</td></tr> -->
<!-- 		<tr><td>Q.주문한 상품은 언제 배송되나요?</td></tr> -->
<!-- 		<tr><td>Q.구매한 상품 중 일부만 배송되었습니다. 어떻게 해야 하나요?</td></tr> -->
<!-- 		<tr><td>Q.해외배송 상품을 주문했는데, 배송흐름이 없습니다. 어떻게 해야 하나요?</td></tr> -->
				
</div>	

</div>	
<!-- 	////////////////////////////////// -->
<!-- /////////////////////////  -->
<div>
<h2 style=" font: italic bold 3.0em/1em Georgia, serif;">Go Service</h2>
	<button onclick="javascript:goBoughtHistory()"><img alt="" src="/aaa/resources/files/개인정보.jpg"
				style="width:150px; height:150px"></button>
	<button onclick="javascript:goMyshipping()"><img alt="" src="/aaa/resources/files/구매내역.jpg"
				style="width:150px; height:150px"></button>
	<button onclick="javascript:goCancelBuy()"><img alt="" src="/aaa/resources/files/취소환불.jpg"
				style="width:150px; height:150px"></button>
	
</div>

<c:if test="${memLogin != null }">
	<h2 id="phoneClick" style=" font: italic bold 3.0em/1em Georgia, serif;">Call history (Click!)</h2>
	<span><br></span>
	<div id="phone2"  class="d2">
<!-- 	<div class="d2" id="phone2"> -->
	<c:forEach var="i" items="${memLogin.m_memo.split('///')}">
			<span>	
			<input type="text" value="질문 제목 : ">
			<input type="text" id="title${i.split(',,,')[0].split(',/,')[1]}" onclick="javascript:goContent('${i.split(',,,')[0].split(',/,')[1]}')" value="${i.split(',,,')[0].split(',/,')[1]}" readonly="readonly">
			<input type="hidden" id="modiTitle${i.split(',,,')[0].split(',/,')[1]}" name="modiTitle" value="${i.split(',,,')[0].split(',/,')[1]}">
			<input type="hidden" id="modicontent${i.split(',,,')[0].split(',/,')[1]}" name="modicontent" value="${i.split(',,,')[1]}">
			
			<c:choose>	
				<c:when test="${ i.split(',,,')[0].split(',/,')[0] != ''}">
						<span><font color="blue" size="4px">답변 : ON</font></span>
				</c:when>
				<c:otherwise>
						<span><font color="gray" size="4px">답변 : OFF</font></span>
				</c:otherwise>
			</c:choose>
			
			<c:if test="${ i.split(',,,')[0].split(',/,')[0] == ''}">
					<span><button class="button1231" style="color: green;border:1 solid red;" value="질문 수정" onclick="javascript:goPopup2('${i.split(',,,')[0].split(',/,')[1]}')">질문 수정</button></span>
			</c:if>
			
			<c:choose>
			<c:when test="${ i.split(',,,')[0].split(',/,')[0] != ''}">	
			<span>	
				<button class="button3123" style="color: red" onclick="javascript:goDelContent('${i.split(',,,')[0].split(',/,')[1]}')">질문 삭제</button>
			</span>		
			</c:when>
			<c:otherwise>
			<span>	
				<button class="button3123" style="color: red" onclick="javascript:goDelContent2('${i.split(',,,')[0].split(',/,')[1]}')">질문 삭제</button>
			</span>	
			</c:otherwise>
			</c:choose>
			
		<br>	
		</span>
		<tr>	
			<td><textarea id="content${i.split(',,,')[0].split(',/,')[1]}"  class="content" rows="5" cols="5" readonly="readonly">${i.split(',,,')[1]}</textarea></td>
		</tr>

		<c:if test="${ i.split(',,,')[0].split(',/,')[0] != ''}">
			<tr>	
				<td><textarea id="review${i.split(',,,')[0].split(',/,')[1]}"  class="content" rows="5" cols="5" readonly="readonly">${i.split(',,,')[0].split(',/,')[0]}</textarea></td>
			</tr>
		</c:if>
		
	</c:forEach>
		
		
	
	</div>	
</c:if>			
<!-- 	//////////////////////////// -->
				<!--//////////////////////////  -->
		<h2 style=" font: italic bold 3.0em/1em Georgia, serif;">Service center</h2>
	<table>		
		<tr>	
			<c:choose>
			<c:when test="${memLogin != null }">
				<a onclick="javascript:goPopup()"><img alt="" src="/aaa/resources/files/전화기.jpg"
				style="width:50px; height:50px"></a> Company : 02)932-2391  / phone : 010-3213-3395
			</c:when>
			<c:otherwise>
				<img alt="" src="/aaa/resources/files/전화기.jpg"
				style="width:50px; height:50px"> 010-3213-3395
			</c:otherwise>
			</c:choose>
		</tr>
	</table>
	<input type="hidden" name="m_num" value="${memLogin.m_num}">
	</form>
	
	<script type="text/javascript">
	$(".q1").hide();
	$(".phone1").hide();
	$(".content").hide();
	$(".modi").hide();
	$(".d2").hide();
	
	function goBoughtHistory(){
		var frm = document.frmMemo;
		var memLogin = "${memLogin}";
		if(memLogin != null) {
			frm.action = "/aaa/mem/memInfo";
			frm.submit();	
		}
		frm.action = "/aaa/mem/loginForm";
		frm.submit();	
	}
	
	function goMyshipping(){
		var frm = document.frmMemo;
		frm.action = "/aaa/mem/Myshipping";
		frm.submit();	
	}
	
	function goCancelBuy(){
		var frm = document.frmMemo;
		frm.action = "/aaa/mem/MyCancel";
		frm.submit();	
	}
	
	function goContent(conNum){
		$("#content"+conNum).slideToggle();
		$("#review"+conNum).slideToggle();
		$("#modi"+conNum).slideToggle();
	}
	
	function goPopup(){
	    var pop = window.open("/aaa/mem/phonePopupp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	}
	
	function goPopup2(conNum){
		var title = $("#modiTitle"+conNum).val();
		var content = $("#modicontent"+conNum).val();
	    var pop = window.open("/aaa/mem/phonePopup2?title="+title+"&content="+content,"pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	}
	
	function goqna(usingNum){
		$("#q"+usingNum).slideToggle();
	}
	
// 	function goContent(conNum){
// 		$("#content"+conNum).slideToggle();
// 	}
	
	function goDelContent(conNum){
		var review = $("#review"+conNum).val();
		var con = $("#content"+conNum).val();
		var tit = $("#title"+conNum).val();
		
		var params = "review="+review+"&title="+tit+"&content="+con;
		
		var frm = document.frmMemo;
		frm.method = "post";
		frm.action = "/aaa/mem/DelQnA?"+params;
		frm.submit();
	}
	
	function goDelContent2(conNum){
		
		var con = $("#content"+conNum).val();
		var tit = $("#title"+conNum).val();
		
		var params = "title="+tit+"&content="+con;
		
		var frm = document.frmMemo;
		frm.method = "post";
		frm.action = "/aaa/mem/DelQnA2?"+params;
		frm.submit();
	}
	
	
	
	$("#phoneClick").click(
			function(){
					$("#phone2").slideToggle();
				}		
			);
	
	$("#qna1").click(
		function(){
				$("#q1").slideToggle();
			}		
		);
	$("#qna2").click(
			function(){
					$("#q2").slideToggle();
				}		
			);
	$("#qna3").click(
			function(){
					$("#q3").slideToggle();
				}		
			);
	$("#qna4").click(
			function(){
					$("#q4").slideToggle();
				}		
			);
	$("#qna5").click(
			function(){
					$("#q5").slideToggle();
				}		
			);
	$("#qna6").click(
			function(){
					$("#q6").slideToggle();
				}		
			);
	$("#qna0").click(
			function(){
					$("#q0").slideToggle();
				}		
			);
	//////
	$("#qna11").click(
			function(){
					$("#q11").slideToggle();
				}		
			);
		$("#qna22").click(
				function(){
						$("#q22").slideToggle();
					}		
				);
		$("#qna33").click(
				function(){
						$("#q33").slideToggle();
					}		
				);
		$("#qna44").click(
				function(){
						$("#q44").slideToggle();
					}		
				);
		$("#qna55").click(
				function(){
						$("#q55").slideToggle();
					}		
				);
		$("#qna66").click(
				function(){
						$("#q66").slideToggle();
					}		
				);
		$("#qna00").click(
				function(){
						$("#q00").slideToggle();
					}		
				);
	
	</script>



</body>
</html>
















