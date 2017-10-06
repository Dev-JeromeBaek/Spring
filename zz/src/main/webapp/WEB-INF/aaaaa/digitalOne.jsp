<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
	<%-- <c:set var="min_js" value="/resources/js/yeob/jquery-1.8.3.min.js"></c:set>
	<c:set var="ui_min_js" value="/resources/js/yeob/jquery-ui.min.js"></c:set>
	<script type="text/javascript" src="${ min_js }"></script>
	<script type="text/javascript" src="${ ui_min_js }"></script> --%>
 
<!--  위의 순서대로 와야한다. min_js => ui_min_js  -->

</head>
<body>
	<style>
		  body {
		   margin: 20px auto;
		   width: 1000px;
		   /* background: #191933; */
		  }
		  .thumbs img {
		   width: 80px;
		   height: 60px;
		   border: solid 1px #ccc;
		   padding: 5px;
		   margin-bottom: 5px;
		   opacity: 0.5;
		  } 
		  
		.thumbs img:hover {
		  border-color: red;
		/*    border => 테두리     */
		 }
		  
		#large {
		  width: 400px;
		  height: 300px;
		  border: solid 1px #ccc;
		  padding: 5px;
		  margin-left: 0px;
		  overflow: hidden;
		}
		#largeImg {
		  width: 400px;
		  height: 330px;
		}
		.row2 div {
			float: left! important; 
		}
		.row div {
			float: none;
		}
		.row1 div {
			float: left;
		}
		.thumbs a img{
		  width: 100px;
		  margin-left: 20px;
		}
		
		
	 </style>
	
			<div class="row">
				<div class="row1">
					 <div id="large">
						<img id="largeImg"
							src="/aaa/resources/files/${ (dealInfo.di_sysName).split(',')[0] }">
					</div>
					<div style="width:600px; height:350px;">
							<div>카테고리 : </div>
							<div><h2>${dealInfo.di_category }</h2></div><br><br><br>
							<div>상품구분 : </div>
							<div><h2>${dealDetail.dd_name }</h2></div><br><br><br>
							<div>이 름 : </div>
							<div><h2>${dealInfo.di_name }</h2></div><br><br><br>
							<div>가 격 : </div>
							<div><h2>${dealInfo.di_price }</h2></div><br><br><br>
							<div>수 량 : </div>
							<div><h2>${dealDetail.dd_amount }</h2></div><br><br><br>
							<div>설 명 : </div>
							<div><h2>${dealInfo.di_exp }</h2></div><br><br><br>
					</div>
				</div>
				<div class="row2" style="width:700px;height: 300px;"> 
					<c:forEach var="i" items="${ (dealInfo.di_sysName).split(',')}">
						<div class="thumbs">
							<a href="/aaa/resources/files/${i}"> <img
								src="/aaa/resources/files/${i}">
							</a>
						</div>
					</c:forEach>
				</div>
			</div>
	<script type="text/javascript">
	
	//  ".thumbs a" => class="thumbs"의 내부에 있는 a태크
	  $(".thumbs a").hover(
		   function(){
		    $(this).find("img").css("opacity","1");
		    var thisSrc = $(this).attr("href");
		    $("#largeImg").attr("src", thisSrc);
		   },  
		   function(){
		    $(this).find("img").css("opacity","0.5");
		    
		   }  
	  );
	</script>
</body>
</html>
