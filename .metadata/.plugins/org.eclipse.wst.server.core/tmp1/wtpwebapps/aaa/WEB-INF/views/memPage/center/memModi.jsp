<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

body { margin-left: 0px; margin-top: 0px; margin-right: 0px; margin-bottom: 0px; }
.d2 {
/*  	border: 4px solid red; */
	width: 900px;
	margin :0 auto;
	height: 700px;
	overflow: auto;
	text-align: left;
/* 	float : left; */
}

.d3 {
	width: 900px;
	height: 500px;
/* 	border:1px solid green; */
	line-height: 30px;
	float:center;
	font: bold 2.0em/1em
}
.red{
	color:red;
}
.blue{
	color:blue;
}
button:hover {
    opacity: 0.8;
}
button {
/*     background-color: #4CAF50; */
    color: white;
    padding: 14px 14px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 100%;
}


</style>
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"60168",secure:"60173"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-112" data-genuitec-path="/aaa/src/main/webapp/WEB-INF/views/memPage/center/memModi.jsp">
	
	<form name="frmModi" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-112" data-genuitec-path="/aaa/src/main/webapp/WEB-INF/views/memPage/center/memModi.jsp">
	<div class="d2">
	<span style="font: bold 4.0em/1em Georgia, serif; ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;회원 수정 페이지</span><br><br><br>
	<div class="d3">
			<span>아이디</span>
			<span>
			<input type="text" id="m_id" name="m_id" placeholder="아이디 입력" value="${memLogin.m_id}" readonly="readonly">
			</span><br>
			<span>비밀번호</span>
			<span>
				<input type="password" id="m_pw" name="m_pw" placeholder="비밀번호 입력">
			</span><br>
			<span>비밀번호 확인</span>
			<span>
				<input type="password" id="m_pwCheck" name="m_pwCheck" placeholder="비밀번호 확인">
			</span>
		  <span id="pwchk"></span><br>
			<span>이름</span>
			<span>
				<input type="text" id="m_name" name="m_name" placeholder="한글로 입력" value="${memLogin.m_name}">
			</span>
		 		<span id="namechk"></span><br>
			<span>주소</span>
			<span>
				<input id="postCode" type="text" name="postCode" readonly="readonly">
				<input style="background-color:#F08080; border:1 solid #A0DBE4"  type="button" value="우편번호검색" onclick="javascript:openAddr()"> <br>
				<input id="roadAddress" type="text" name="roadAddress" readonly="readonly"> <br>
				<input id="detailAddress" type="text" name="detailAddress" placeholder="나머지 주소 입력"> 
			</span><br>
			<span>성별</span>
			<span>
				<input type="radio" name="m_gender" value="남자" checked="checked"> 남자
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio" name="m_gender" value="여자" > 여자&nbsp;
			</span><br>
			<span>핸드폰</span>
			<span>
				<select name="m_phone1">
					<option>010</option>
					<option>011</option>
					<option>016</option>
					<option>017</option>
					<option>018</option>
					<option>019</option>
				</select>
				- <input name="m_phone2" id="phone2" type="text" maxlength="4">
				- <input name="m_phone3" id="phone3" type="text" maxlength="4">
			</span>
		 	<span id="phonechk"></span><br>
			<span colspan="2">
				<input type="hidden" name = "m_num" value="${memLogin.m_num}">
				<button style="background-color: #4CAF50;" onclick="javascript:goModi()">수정 완료</button>
				<button style="background-color: #B3AC1B;" onclick="javascript:goCancel()">수정 취소</button>
				
			</span><br>
	</div>
	</div>
	</form>
	
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript">
	function goModi(){
		var frm = document.frmModi;
		frm.action = "/aaa/mem/memModify";
		frm.method = "post";
		frm.submit();
	}
	function goCancel(){
		var frm = document.frmModi;
		frm.action = "/aaa/mem/memInfo";
		frm.method = "post";
		frm.submit();
	}
	
	
	function openAddr(){
	    new daum.Postcode({
	        oncomplete: function(data) {
	            var fullAddr = data.address; // 최종 주소 변수
	            var extraAddr = ''; // 조합형 주소 변수
	            if(data.addressType === 'R'){
	                if(data.bname !== ''){
	                    extraAddr += data.bname;
	                }
	                if(data.buildingName !== ''){
	                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
	            }
	            document.getElementById('postCode').value = data.zonecode; //5자리 새우편번호 사용
	            document.getElementById('roadAddress').value = fullAddr;
	            document.getElementById('detailAddress').focus();
	        }
	    }).open();
	}
	
	
	//비밀번호	
	$(document).ready(function(){
	    $('#m_pw').keyup(function(){
	    		var m_pw = $(this).val();
	            $.ajax({
	                type : 'POST',
	                url : '/aaa/mem/pwCheck',
	                data:
	                {
	                	m_pw : m_pw
	                },
	                success : function(result) {
	                   var data  =  result.msg;
	                	if (data == "pwMismatch") {
	                        $("#pwchk").html("영어와 숫자를 공백없이 입력해주세요.");
	                        document.getElementById("pwchk").style.color = "red";
	                         document.getElementById("pwchk").innerHTML="올바른 형식으로 작성하세요.";
	                    }else if(data == "pwSucc"){
	                    	$("#pwchk").html("");
	                    }
	                	
	                }
	            }); 
	    }); 
	});
	
	$(document).ready(function(){
	    $('#m_pwCheck').keyup(function(){
	    	if(document.frmModi.m_pw.value != document.frmModi.m_pwCheck.value){
	    		$("#pwchk").html("비밀번호를 일치시켜 주세요.");
			}else if(document.frmModi.m_pw.value == document.frmModi.m_pwCheck.value){
				var m_pw = $(this).val();
	            // ajax 실행
	            $.ajax({
	                type : 'POST',
	                url : '/aaa/mem/pwCheck',
	                data:
	                {
	                	m_pw : m_pw
	                },
	                success : function(result) {
	                   var data  =  result.msg;
	                	if (data == "pwMismatch") {
	                        document.getElementById("pwchk").style.color = "red";
	                        document.getElementById("pwchk").innerHTML="영어와 숫자를 공백없이 입력해주세요.";
	                    }
	                }
	            });
			}
		});
	});
	

	$(document).ready(function(){
	    $('#m_pwCheck').keyup(function(){
	    	if(document.frmModi.m_pw.value == document.frmModi.m_pwCheck.value){
// 	    		$("#pwchk").html("사용 가능");
	    		document.getElementById("pwchk").style.color = "blue";
                document.getElementById("pwchk").innerHTML="사용 가능";
			}
		}); 
	});
		
/////이름
$(document).ready(function(){
	$('#m_name').keyup(function(){
			var m_name = $(this).val();
			$.ajax({
	            type : 'POST',
	            url : '/aaa/mem/modiName',
	            data:
	            {
	            	m_name : m_name
	            },
	            success : function(result) {
	               var data  =  result.msg;
	            	if (data == "nameMismatch") {
// 	                    $("#namechk").html("한글로 두글자 이상 네글자 이하로 작성해 주세요. ");
	                    document.getElementById("namechk").style.color = "red";
	                    document.getElementById("namechk").innerHTML="한글로 두글자 이상 네글자 이하로 작성해 주세요.";
	                }else if(data == "nameSuc"){
// 	                	$("#namechk").html("사용 가능합니다.");
	                	document.getElementById("namechk").style.color = "blue";
	                    document.getElementById("namechk").innerHTML="사용 가능합니다.";
	                }
	            }
	        });
		});
});

////////전화번호
$(document).ready(function(){
	
$('#phone2').keyup(function(){
var m_phone2 = $(this).val();
	if(document.frmModi.m_phone2.value != null || document.frmModi.m_phone3.value != null){
	$.ajax({
	    type : 'POST',
	    url : '/aaa/mem/modiPhone2',
	    data:
	    {
	    	m_phone2 : m_phone2
	    },
	    success : function(result) {
	       var data  =  result.msg;
	    	if (data == "phoneMis2") {
// 	            $("#phonechk").html("형식에 맞게 입력해주세요.");
	            document.getElementById("phonechk").style.color = "red";
                document.getElementById("phonechk").innerHTML="형식에 맞게 입력해주세요.";
	        }else if(data == "phoneSuc2"){
	        	 $("#phonechk").html("");
	        }
	    }
	});
	}
});

$('#phone3').keyup(function(){
	var m_phone3 = $(this).val();
	if(document.frmModi.m_phone2.value != null || document.frmModi.m_phone3.value != null){
	$.ajax({
	    type : 'POST',
	    url : '/aaa/mem/modiPhone3',
	    data:
	    {
	    	m_phone3 : m_phone3
	    },
	    success : function(result) {
	       var data  =  result.msg;
	    	if (data == "phoneMis3") {
// 	            $("#phonechk").html("형식에 맞게 입력해주세요.");
	            document.getElementById("phonechk").style.color = "red";
                document.getElementById("phonechk").innerHTML="형식에 맞게 입력해주세요.";
	        }else if(data == "phoneSuc3"){
// 	        	$("#phonechk").html("등록 가능합니다.");
	        	 document.getElementById("phonechk").style.color = "blue";
	             document.getElementById("phonechk").innerHTML="등록 가능합니다.";
	        }
	    }
	});
	}
	});
});

</script>
	
	


</body>
</html>















