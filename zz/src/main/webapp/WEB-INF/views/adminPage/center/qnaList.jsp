<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style type="text/css">
	h2 {
		font-weight: bold;
	}
	</style>
</head>
<body>
<h2>QnA List페이지</h2>
	
<div class="tb_type">
    <table cellspacing="0" border="1">
        <caption>1:1문의 미답변 리스트</caption>
        <h2>1:1문의 미답변 리스트</h2>
        <colgroup>
            <col width="118"><col><col width="76"><col width="136">
        </colgroup>
        <thead>
            <tr>
                <th scope="col">번호</th>
                <th scope="col">제목</th>
                <th scope="col">등록일</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
        	<c:choose>
        	<c:when test="${!noList.isEmpty() }">
        	<c:forEach var="each" items="${noList }">
            <tr>
                <td>${each.q_num }</td>
                <td class="noti_name" style="width: 500px;"><%-- <a href="/user/qna/selectQna?q_num=${each.q_num }"> --%>${each.q_title }<!-- </a> --></td>
                <td>${each.q_date }</td>
				<td><button onclick="javascript:location='/aaa/admin/answerQna?q_num=${each.q_num}'">답변하기</button>
					<button onclick="javascript:location='/aaa/admin/deleteQna?q_num=${each.q_num}'">삭제</button></td>
            </tr>
        	</c:forEach>
        	</c:when>
        	<c:otherwise>
            <tr>
                <td colspan="5" style="padding:30px">답변이 필요한 1:1문의가 없습니다.</td>
            </tr>
        	</c:otherwise>
        	</c:choose>
        </tbody>
    </table>
</div>
<br><br>
<div class="tb_type">
    <table cellspacing="0" border="1">
        <caption>1:1문의 답변 리스트</caption>
        <h2>1:1문의 답변 리스트</h2>
        <colgroup>
            <col width="118"><col><col width="76"><col width="136">
        </colgroup>
        <thead>
            <tr>
                <th scope="col">번호</th>
                <th scope="col">제목</th>
                <th scope="col">등록일</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
        	<c:choose>
        	<c:when test="${!ansList.isEmpty() }">
        	<c:forEach var="each" items="${ansList }">
            <tr>
                <td>${each.q_num }</td>
                <td class="noti_name" style="width: 500px;"><%-- <a href="/user/qna/selectQna?q_num=${each.q_num }"> --%>${each.q_title }<!-- </a> --></td>
                <td>${each.q_date }</td>
				<td>
					<button onclick="javascript:location='/aaa/admin/answerQna?q_num=${each.q_num}'">답변수정하기</button>
					<button onclick="javascript:location='/aaa/admin/deleteQna?q_num=${each.q_num}'">삭제</button></td>
            </tr>
        	</c:forEach>
        	</c:when>
        	<c:otherwise>
            <tr>
                <td colspan="5" style="padding:30px">답변한 1:1문의가 없습니다.</td>
            </tr>
        	</c:otherwise>
        	</c:choose>
        </tbody>
    </table>
</div>

<script>function openAnswer(here)
{
    var isopen = $("#isopen_"+here).val();
    
    if(isopen == "0"){
        $("#title_"+here).css({'font-weight':'bold'});
        $("#answer_"+here).show();
        $("#td_"+here).show();
        $("#isopen_"+here).val("1");
        $(".a_ct img").each(function(){
            if($(this).width() > 851){
                $(this).width(851);
            }
        });
    }
    else{
        $("#title_"+here).css({'font-weight':'normal'});
        $("#answer_"+here).hide();
        $("#td_"+here).hide();
        $("#isopen_"+here).val("0");
    }
}

function changeFilter()
{
    var filter = $("#filter option:selected").val();
    location.href = "/user/qna/list/1/3/"+filter;
}

function go(id) {
    if(confirm("정말로 1:1 문의를 삭제하시겠습니까?") == true){
        $('#qna_delete_'+id).submit();
    }
    else{
        return; 
    }
}

$(function(){
    $("#filter").val("");
});
</script>
<!-- <div class="date_control"> -->
<!--     <select title="리스트 정렬 방법" id="filter" style="width:100px" onchange="changeFilter()"> -->
<!--         <option value="">전체 문의</option> -->
<!--         <option value="N">미답변</option> -->
<!--         <option value="Y">답변 완료</option> -->
<!--     </select> -->
<!-- </div> -->
<br><br><br>
<div class="tb_qna">
    <table cellspacing="0" border="1">
        <caption>1:1 문의/답변</caption>
        <colgroup>
            <col width="150"><col width="215"><col><col width="100"><col width="100">
        </colgroup>
        <thead>
            <tr>
                <th scope="col">문의유형</th>
                <th scope="col">상품명</th>
                <th scope="col">제목</th>
                <th scope="col">등록일</th>
                <th scope="col">답변여부</th>
            </tr>
        </thead>
        <tbody>
                        <tr>
                <td colspan="5" style="padding:30px">등록된 1:1문의가 없습니다.</td>
            </tr>
        </tbody>
    </table>
</div>
	
</body>
</html>
