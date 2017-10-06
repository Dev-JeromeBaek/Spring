<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style type="text/css">
		.modifyLegend {
			font-family: "스웨거 TTF";
			font-style: bold;
			font-size: 40px;
			text-decoration: none;
			text-align: left;
			border: none;
		}
		.corpModifyField {
			width: 800px;
			height: auto;
			margin-left: 50px;
		}
		p {
			font-size: large;
			font-family: "배달의민족 한나는 열한살";
			color: red;
		}
		.zzz {
			border: 1px solid red; 
			height: 45px;
		}
		
		.aa {
			margin-top: 10px;
			background-color: #F4F4F6;
			margin-left: 10px;
			padding-left: 5px;
    		font-size: 15px;
    		width: 130px;
    		height: 30px; 
		}
		
		.bb {
			width: 270px;
			padding-left: 20px; /* 텍스트는 35 input은 30 */
			height: 30px;
		}
		.cc {
			font-size: 12px;
			margin-left: -5px;
			color: #767474;
			height: 30px;
		}
		
	</style>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script>
    function openAddr() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += 
                        	(extraAddr !== '' ? ', ' 
                        			+ data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다. 
                // 5자리 새우편번호 사용
				document.getElementById('postnum').value = data.zonecode;
                document.getElementById('addr1').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('addr2').focus();
            }
        }).open();
    }
    
</script>
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"60168",secure:"60173"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-30" data-genuitec-path="/aaa/src/main/webapp/WEB-INF/views/corpPage/individual/center/corpModify.jsp">
	<br data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-30" data-genuitec-path="/aaa/src/main/webapp/WEB-INF/views/corpPage/individual/center/corpModify.jsp">
	<fieldset class="corpModifyField" style="border-style: none;">
	<legend class="modifyLegend">[ 기업정보 ]</legend>
	<div align="left" style="margin-left: 50px; font-size: x-small;">정보를 수정할 경우에는 비밀번호를 꼭 다시 한번 확인해 주세요.</div>
	</fieldset>
	<br>
	<fieldset class="corpModifyField">
	<legend class="modifyLegend" >[ 기업회원 정보 수정 ]</legend>
		<div align="left" style="width: 1100px; margin-left: 20px;">
			<fieldset style="width: 1050px; margin-left: 5px; border-style: none;">
				<legend style="font-size: large;"><strong>기본 정보</strong></legend>
				<div style="font-size: x-small; margin-left: 20px;">정확한 정보를 입력해주세요</div><br>
				<table style="text-align: left;">
					<tr class="zzz">
						<td class="aa"><strong>사업자 번호</strong></td>
						<td class="bb" style="margin-left: 35px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${ corpLogin.getC_bn() }</td>
						<td></td>
					</tr>
					<tr class="zzz">
						<td class="aa"><strong>회사 이름</strong></td>
						<td class="bb" style="margin-left: 35px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${ corpLogin.getC_name() }</td>
						<td class="cc"></td>
					</tr>
					<tr class="zzz">
						<td class="aa"><strong>대표자 이름</strong></td>
						<td class="bb"><input type="text" id="corpCEO" 
							autocomplete="off" placeholder="${ corpLogin.getC_ceo() }"
							style="width: 250px; height: 25px;"></td>
						<td class="cc"></td>
					</tr>
					<tr class="zzz">
						<td class="aa"><strong>새 비밀번호</strong></td>
						<td class="bb"><input type="password" id="pw" 
							autocomplete="off" placeholder="비밀번호를 입력하세요"
							style="width: 250px; height: 25px;"></td>
						<td class="cc">6~15자의 영문 대소문자, 숫자, 특수문자 2개이상 사용하실 수 있으며 연속된 숫자 및 문자(4개이상)제한 합니다.</td>
					</tr>
					<tr class="zzz">
						<td class="aa"><strong>새 비밀번호 확인</strong></td>
						<td class="bb"><input type="password" id="pw_Check" 
							autocomplete="off" placeholder="비밀번호를 입력하세요"
							style="width: 250px; height: 25px;"></td>
						<td class="cc">설정하신 비밀번호를 한번 더 입력해주세요.</td>
					</tr>
					<tr class="zzz">
						<td class="aa"><strong>전화번호</strong></td>
						<td class="bb">
							<select name="tel01" id="tel01" style="width: 57px; height: 30px;">
								<option>02</option>
								<option>031</option>
								<option>032</option>
								<option>033</option>
								<option>034</option>
								<option>035</option>
								<option>041</option>
								<option>042</option>
								<option>043</option>
								<option>044</option>
								<option>051</option>
								<option>052</option>
								<option>053</option>
								<option>054</option>
								<option>055</option>
								<option>061</option>
								<option>062</option>
								<option>063</option>
								<option>054</option>
								<option>0502</option>
								<option>0503</option>
								<option>0504</option>
								<option>0505</option>
								<option>070</option>
								<option>010</option>
								<option>011</option>
								<option>016</option>
								<option>017</option>
								<option>018</option>
								<option>019</option>
							</select> - 
							<input type="tel" id="tel02" 
							autocomplete="off" placeholder="ex) 000"
							style="width: 70px; height: 22px;"> - 
							<input type="tel" id="tel03" 
							autocomplete="off" placeholder="ex) 0000"
							style="width: 70px; height: 22px;">
						</td>
						<td class="cc"></td>
					</tr>
					<tr class="zzz">
						<td class="aa"><strong>핸드폰번호</strong></td>
						<td class="bb">
							<select name="phone01" id="phone01" style="width: 57px; height: 30px;">
								<option>010</option>
								<option>011</option>
								<option>016</option>
								<option>017</option>
								<option>018</option>
								<option>019</option>
							</select> - 
							<input type="tel" id="phone02" 
							autocomplete="off" placeholder="ex) 0000"
							style="width: 70px; height: 22px;"> - 
							<input type="tel" id="phone03" 
							autocomplete="off" placeholder="ex) 0000"
							style="width: 70px; height: 22px;">
						</td>
						<td class="cc"></td>
					</tr>
					<tr class="zzz">
						<td class="aa"><strong>주소</strong></td>
						<td class="bb">
							<input id="postnum" name="postnum" 
								type="text" style="width:65px;
								text-align: center;" readonly="readonly" >&nbsp;
							<input type="button" value="우편번호검색" 
								onclick="openAddr()">
							<input id="addr1" name="addr1" 
								type="text" style="width: 247px;" 
								readonly="readonly">
							<input id="addr2" name="addr2" 
								type="text" style="width: 247px;" 
								placeholder="나머지 주소 입력">
						</td>
						<td class="cc"></td>
					</tr>
						
				</table>
			</fieldset>
		</div>
	</fieldset>
		<p align="left" style="margin-left: 375px;">&nbsp;
		<button onclick="modifyCheck()" 
			style="cursor: pointer; 
				background-color: #FFDF32; 
				width: 180px;
				height: 50px;
				color: white; 
				font-size: large;"><strong>정보수정</strong></button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<button onclick="modifyCancel()"
			style="cursor: pointer; 
				border: 1px solid #A8A8A9;
				width: 180px;
				height: 50px;
				color: black;
				font-size: large;"><strong>취소하기</strong></button>&nbsp;
		</p>
		<script type="text/javascript">
		function modifyCheck() {
			var corpCeo = document.getElementById("corpCEO").value;
			var corpPw = document.getElementById("pw").value;
			var tel01 = document.getElementById("tel01").value;
			var tel02 = document.getElementById("tel02").value;
			var tel03 = document.getElementById("tel03").value;
			var phone01 = document.getElementById("phone01").value;
			var phone02 = document.getElementById("phone02").value;
			var phone03 = document.getElementById("phone03").value;
			var postnum = document.getElementById("postnum").value;
			var addr1 = document.getElementById("addr1").value;
			var addr2 = document.getElementById("addr2").value;
			
			if(corpCeo == "") {
	    		alert('대표자이름을 입력해주세요');
	    		document.getElementById('corpCEO').focus();
	    		return;
	    	} else if(corpPw == "") {
	    		alert('비밀번호를 입력해주세요');
	    		document.getElementById('pw').focus();
	    		return;
	    	} else if(tel02 == "") {
	    		alert('회사전화번호를 입력해주세요');
	    		document.getElementById('tel02').focus();
	    		return;
	    	} else if(tel03 == "") {
	    		alert('회사전화번호를 입력해주세요');
	    		document.getElementById('tel03').focus();
	    		return;
	    	} else if(phone02 == "") {
	    		alert('핸드폰번호를 입력해주세요');
	    		document.getElementById('phone02').focus();
	    		return;
	    	} else if(phone03 == "") {
	    		alert('핸드폰번호를 입력해주세요');
	    		document.getElementById('phone03').focus();
	    		return;
	    	}
			var pwck = document.getElementById("pw_Check").value;
		 	if (corpPw != pwck) {
		            alert('비밀번호가 틀렸습니다. 다시 입력해 주세요');
		            document.getElementById('pw_Check').value = "";
		            document.getElementById('pw_Check').focus();
		            return;
		    }
			var corpTel = tel01 + "-" + tel02 + "-" + tel03;
			var corpPhone = phone01 + "-" + phone02 + "-" + phone03;
			var corpAddr = "("+postnum+")"+addr1+"("+addr2+")";
			var params = "&c_ceo="+corpCeo
							+"&c_pw="+corpPw+"&c_tel="+corpTel+"&c_phone="+corpPhone
							+"&c_addr="+corpAddr;
			sendRequest("/aaa/idvCorp/modifyCorp", params, haha, "post");
		}
		
		function haha() {
			if(httpRequest.readyState == 4) {
				if(httpRequest.status == 200) {
					var rcvData = httpRequest.responseText;
					if(rcvData == "정보가 성공적으로 수정되었습니다.") {
						var c_bn = '${ corpLogin.getC_bn() }';
						var c_pw = document.getElementById('pw').value;
						opener.location.href="/aaa/corpJoin/corpLoginn?c_bn="+c_bn+"&c_pw="+c_pw;
						self.close();
					} else {
						alert(rcvData);
					}
				} else {
					alert("*** 실패 : " + httpRequest.status);
				}
			}
		}
		
		function modifyCancel() {
			location.href="/aaa/idvCorp/corpHome";
		}
	
	</script>
</body>
</html>
