<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
   
    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업 회원가입</title>
<style>

.d2 {
/*  	border: 4px solid red; */
	width: 1200px;
	margin :0 auto;
	height: 1300px;
	overflow: auto;
	text-align: left;
}

.d3 {
	width: 900px;
	height: 500px;
	border:1px solid green;
	line-height: 30px;
	float:left;
	font: bold 2.0em/1em
}
.red{
	color:red;
}
.blue{
	color:blue;
}

</style>
</head>
<body>

<form name="frm">
<div class="d2">
		<span style=" font: bold 4.0em/1em Georgia, serif ;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;기업 회원가입</span><br><br><br>
	<div class="d3">
	<br><br>
		<span>사업자 번호 ex)000-00-00000 :</span> 
		<span><input id="c_bn" name="c_bn"  type="text" placeholder="사업자 번호 ex)000-00-00000"
				style="width:200px;"></span>
		<span  id="idchk"></span><br>
	
		<span>비밀번호  : </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<span><input id="c_pw" type="password" name="c_pw" value="${corp.getC_pw()}"
				placeholder="공백없이 알파벳과 숫자" style="width:200px;"></span><br>
		<span>비밀번호 확인 : </span>
		<span>
		<input id="c_pwCheck"  type="password" name="c_pwCheck" value="${corp.getC_pwCheck()}"style="width:200px;"placeholder="공백없이 알파벳과 숫자">
		</span>
		<span id="pwchk"></span><br>
		
		<span>회사명 : </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<span><input id="compName" type="text" name="c_name" value="${corp.getC_name()}"placeholder="입력"></span>
		<span id="cName"></span><br>
		<span>대표자 성명 : </span>
		<span><input id="c_ceo" type="text" name="c_ceo" value="${corp.getC_ceo()}"placeholder="입력"></span>
		<span id="cCeo"></span><br>
		<span>회사 전화번호 : ex)지역번호-***-**** </span>
		<span colspan="3">
		<select name="c_tel1">
			<option>02</option>
			<option>031</option>
			<option>041</option>
			<option>081</option>
		</select>-
		<input id="comTel2"  type="text" name="c_tel2" value="${corp.getC_tel2()}"placeholder="번호입력">-
		<input id="comTel3"  type="text" name="c_tel3" value="${corp.getC_tel3()}"placeholder="번호입력">
		</span>
		<span id="comTel"></span><br>
		<span>핸드폰 번호 : ex)01*-***-**** </span>
		<span>
		<select name="c_phone1">
			<option>010</option>
			<option>011</option>
			<option>016</option>
			<option>018</option>
			<option>017</option>
		</select>-
		<input id="phone2" type="text" name="c_phone2" value="${corp.getC_phone2()}"placeholder="번호입력">-
		<input id="phone3" type="text" name="c_phone3" value="${corp.getC_phone3()}"placeholder="번호입력">
		</span>
		<span id="comPhone"></span><br>
					
					<span>
					 우편번호 : 
					<input type="text" name="postCode" id="postCode" value="${postCode}" readonly="readonly"placeholder="검색 입력">
					</span>&nbsp;<input style="width:75; font-family:돋움; background-color:#F08080; border:1 solid #A0DBE4"  type="button" value="회사 주소 검색" onclick="javascript:openAddr()"><br>
					 도로명 : &nbsp;&nbsp;
					<input type="text" size="20" style="width:500px;"   name="roadCode" id="roadCode" value="${roadCode}" readonly="readonly" placeholder="검색 입력">
					<br>
					<span>상세 주소</span>&nbsp;
					<span><input type="text" name="addrDetail" id="addrDetail" value="${addrDetail}" placeholder="입력"></span><br>
					
					</span><br>
	
	<input type="hidden" name="c_grade" value="6">
	<input type="hidden" name="c_dealcount" value="0">
	<input type="hidden" name="c_sellingprice" value="0">
	
		<span colspan="3"  align="center">
		<input style="width:75; font-family:돋움; background-color:#E9967A; border:1 solid #A0DBE4" type="button" value="가입하기" onclick="javascript:goJoin()">
		<input style="width:75; font-family:돋움; background-color:#E9967A; border:1 solid #A0DBE4" type="button" value="로그인으로" onclick="javascript:goLogin()">
		<input style="width:75; font-family:돋움; background-color:#E9967A; border:1 solid #A0DBE4" type="button" value="홈으로" onclick="javascript:goHome()">
		</span>
	</div>	

</div>

<input type="hidden" id="idChk" value="N" />

</form>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
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
            document.getElementById('roadCode').value = fullAddr;
//             document.getElementById('detailAddress').focus();
        }
    }).open();
}



///////사업자번호
$(document).ready(function(){
    $('#c_bn').keyup(function(){
            var c_bn = $(this).val();
            // ajax 실행
            $.ajax({
                type : 'POST',
                url : '/aaa/corpJoin/bnCheck',
                data:
                {
                	c_bn: c_bn
                },
                success : function(result) {
                    //console.log(result);
                   var data  =  result.msg;
                	if (data == "overlab") {
//                       $("#idchk").html("중복된 사업자 번호입니다.");
                         document.getElementById("idchk").style.color = "red";
                         document.getElementById("idchk").innerHTML="중복된 사업자 번호입니다.";
                    }else if(data == "misMath"){
//                     	 $("#idchk1").html("올바른 형식으로 작성하세요.");
                    	 document.getElementById("idchk").style.color = "red";
                         document.getElementById("idchk").innerHTML="올바른 형식으로 작성하세요.";
                    }else if(data == "suc"){
//                    	 $("#idchk2").html("등록 가능한 사업자 번호입니다.");
                    	document.getElementById("idchk").style.color = "blue";
                        document.getElementById("idchk").innerHTML="등록 가능한 사업자 번호입니다.";
                    }
                }
            }); // end ajax
    }); // end keyup
});


///////비밀번호
$(document).ready(function(){
    $('#c_pw').keyup(function(){
    		var c_pw = $(this).val();
            $.ajax({
                type : 'POST',
                url : '/aaa/corpJoin/pwCheck',
                data:
                {
                	c_pw : c_pw
                },
                success : function(result) {
                   var data  =  result.msg;
                	if (data == "mismatch") {
//                         $("#pwchk").html("영어와 숫자를 공백없이 입력해주세요.");
                        document.getElementById("pwchk").style.color = "red";
                        document.getElementById("pwchk").innerHTML="영어와 숫자를 공백없이 입력해주세요.";
                    }else if(data == "succ"){
                    	$("#pwchk").html("");
                    }
                	
                }
            }); 
    }); 
});

$(document).ready(function(){
    $('#c_pwCheck').keyup(function(){
    	if(document.frm.c_pw.value != document.frm.c_pwCheck.value){
    		$("#pwchk").html("비밀번호를 일치시켜 주세요.");
		}else if(document.frm.c_pw.value == document.frm.c_pwCheck.value){
			var c_pw = $(this).val();
            // ajax 실행
            $.ajax({
                type : 'POST',
                url : '/aaa/corpJoin/pwCheck',
                data:
                {
                	c_pw : c_pw
                },
                success : function(result) {
                   var data  =  result.msg;
                	if (data == "mismatch") {
//                         $("#pwchk").html("영어와 숫자를 공백없이 입력해주세요.");
                        document.getElementById("pwchk").style.color = "red";
                        document.getElementById("pwchk").innerHTML="영어와 숫자를 공백없이 입력해주세요.";
                    }
                }
            });
		}
	});
});

$(document).ready(function(){
    $('#c_pwCheck').keyup(function(){
    	if(document.frm.c_pw.value == document.frm.c_pwCheck.value){
    		$("#pwchk").html("사용 가능");
    		 document.getElementById("pwchk").style.color = "blue";
             document.getElementById("pwchk").innerHTML="사용 가능";
		}
	}); 
});

////회사명
$(document).ready(function(){
    $('#compName').keyup(function(){
			var c_name = $(this).val();
			$.ajax({
                type : 'POST',
                url : '/aaa/corpJoin/compName',
                data:
                {
                	c_name : c_name
                },
                success : function(result) {
                   var data  =  result.msg;
                	if (data == "compNameCheck") {
//                         $("#cName").html("특수문자를 제외한 두글자 이상 아홉글자 이하로 작성 해주세요.");
                        document.getElementById("cName").style.color = "red";
                        document.getElementById("cName").innerHTML="특수문자를 제외한 두글자 이상 아홉글자 이하로 작성 해주세요.";
                    }else if(data == "compSucc"){
//                     	$("#cName").html("사용 가능합니다.");
                    	 document.getElementById("cName").style.color = "blue";
                         document.getElementById("cName").innerHTML="사용 가능합니다.";
                    }
                }
            });
		
	});
});

////대표자 성명
$(document).ready(function(){
$('#c_ceo').keyup(function(){
		var c_ceo = $(this).val();
		$.ajax({
            type : 'POST',
            url : '/aaa/corpJoin/ceoName',
            data:
            {
            	c_ceo : c_ceo
            },
            success : function(result) {
               var data  =  result.msg;
            	if (data == "ceoMismatch") {
//                     $("#cCeo").html("한글로 두글자 이상 네글자 이하로 작성해 주세요. ");
                    document.getElementById("cCeo").style.color = "red";
                    document.getElementById("cCeo").innerHTML="한글로 두글자 이상 네글자 이하로 작성해 주세요.";
                }else if(data == "ceoSuc"){
//                 	$("#cCeo").html("사용 가능합니다.");
                	document.getElementById("cCeo").style.color = "blue";
                    document.getElementById("cCeo").innerHTML="사용 가능합니다.";
                }
            }
        });
	});
});


////회사 전화번호
$(document).ready(function(){
$('#comTel2').keyup(function(){
	var c_tel2 = $(this).val();
	if(document.frm.c_tel2.value != null || document.frm.c_tel3.value != null){
	$.ajax({
        type : 'POST',
        url : '/aaa/corpJoin/comTel2',
        data:
        {
        	c_tel2 : c_tel2
        },
        success : function(result) {
           var data  =  result.msg;
        	if (data == "comTelMis2") {
//              $("#comTel").html("잘못된 형식의 번호입니다.");
                document.getElementById("comTel").style.color = "red";
                document.getElementById("comTel").innerHTML="잘못된 형식의 번호입니다.";
            }
        }
    });
	}
});
$('#comTel3').keyup(function(){
	var c_tel3 = $(this).val();
	if(document.frm.c_tel2.value != null || document.frm.c_tel3.value != null){
	$.ajax({
        type : 'POST',
        url : '/aaa/corpJoin/comTel3',
        data:
        {
        	c_tel3 : c_tel3
        },
        success : function(result) {
           var data  =  result.msg;
        	if (data == "comTelMis3") {
//                 $("#comTel").html("잘못된 형식의 번호입니다.");
                document.getElementById("comTel").style.color = "red";
                document.getElementById("comTel").innerHTML="잘못된 형식의 번호입니다.";
            }else if(data == "comTelSuc3"){
//             	$("#comTel").html("등록 가능합니다.");
            	document.getElementById("comTel").style.color = "blue";
                document.getElementById("comTel").innerHTML="등록 가능합니다.";
            }
        }
    });
	}
});
});

////핸드폰
$(document).ready(function(){
	
$('#phone2').keyup(function(){
var c_phone2 = $(this).val();
if(document.frm.c_phone2.value != null || document.frm.c_phone3.value != null){
$.ajax({
    type : 'POST',
    url : '/aaa/corpJoin/phone2',
    data:
    {
    	c_phone2 : c_phone2
    },
    success : function(result) {
       var data  =  result.msg;
    	if (data == "phoneMis2") {
//             $("#comPhone").html("형식에 맞게 입력해주세요.");
            document.getElementById("comPhone").style.color = "red";
            document.getElementById("comPhone").innerHTML="형식에 맞게 입력해주세요.";
        }
    }
});
}
});
$('#phone3').keyup(function(){
var c_phone3 = $(this).val();
if(document.frm.c_phone2.value != null || document.frm.c_phone3.value != null){
$.ajax({
    type : 'POST',
    url : '/aaa/corpJoin/phone3',
    data:
    {
    	c_phone3 : c_phone3
    },
    success : function(result) {
       var data  =  result.msg;
    	if (data == "phoneMis3") {
//             $("#comPhone").html("형식에 맞게 입력해주세요.");
            document.getElementById("comPhone").style.color = "red";
            document.getElementById("comPhone").innerHTML="형식에 맞게 입력해주세요.";
        }else if(data == "phoneSuc3"){
//         	$("#comPhone").html("등록 가능합니다.");
        	  document.getElementById("comPhone").style.color = "blue";
              document.getElementById("comPhone").innerHTML="등록 가능합니다.";
        }
    }
});
}
});
});



// function goPopup(){
//     var pop = window.open("/aaa/corpJoin/jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
// }
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























