<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>

<style>
* {box-sizing:border-box}
body {font-family: Verdana,sans-serif;}
.mySlides {display:none}

/* Slideshow container */
.slideshow-container {
  max-width: 1000px;
  position: relative;
  margin: auto;
}

/* Caption text */
.text1231 {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.dot {
  height: 13px;
  width: 13px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active {
  background-color: #717171;
}

/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .text {font-size: 11px}
}

/* /////////////////// */



/* //////////////////////// */
.d1 {
	margin-top: 5px;
	margin-bottom: 5px;
	width: 65%;
	height: 50px;
	border: 1px solid green;
	border-bottom: 1px dotted green;
	padding: 5px;
	text-align: center;
}

.d2 {
	width: 800px;
	margin :0 auto;
	height: 900px;
}

.d3 {
	float: left;
	width: 340px;
	height: 300px;
	line-height: 60px;
}

.d4 {
	margin: 2px 2px;
 	border: 1px solid red;
	float: left;
	line-height: 60px;
	width : 400px;
}

.d5 {
 	border: 1px solid red;
	float: left;
	margin-left: 0px;
}
.d00{
	width: 340px;
	height: 300px;
	overflow: auto;
}
body { margin-left: 0px; margin-top: 0px; margin-right: 0px; margin-bottom: 0px; }
</style>

</head>
<body>
	<br>
	<br>
	<br>
	<span style=" font: italic bold 5.0em/1em Georgia, serif;"><h2>${kinds}</h2></span>
	<br>
	<br>

<form name="frm111">
	<c:forEach var="each" items="${InfoList}" begin="0" end="2">
				<div class="slideshow-container">
					<div class="mySlides fade">
					  <div class="numbertext"></div>
					  <a href="/aaa/fashion/fashion_beauty_SelectOne?di_num=${each.getDi_num() }">
					  <img src="/aaa/resources/files/${each.getDi_sysName().split(',')[0]}" style="width:70%">
					  </a>
					  <div class="text1231">${each.getDi_name()}</div>
					</div>
				</div>
	</c:forEach>
	
	<c:forEach var="each" items="${InfoList}" begin="0" end="2">
		<div style="text-align:center;display: inline;">
	 		<span class="dot"></span> 
		</div>
	</c:forEach>

<div class="d2">
	<c:forEach var="each" items="${InfoList}">
				<div style="float:left">
							<a href="/aaa/fashion/fashion_beauty_SelectOne?di_num=${each.getDi_num() }">
							<img alt="Image Loading..." src="/aaa/resources/files/${each.getDi_sysName().split(',')[0]}"
								style="width:250px; height:300px">
							</a><br>
							<span style=" font: italic bold 2.0em/1em Georgia, serif; ">${each.getDi_name()}</span><br>
 							<span style=" font: italic bold 1.3em/1em Georgia, serif; "> Dasam price :</span> 
 							<span style=" font-size:2.0em;  color: orange;" > ${each.getDi_price()} 원</span><br>
				</div>
	</c:forEach>


	<!--//////////  -->
	
<%-- 	<c:forEach var="each" items="${InfoList}"> --%>
<!-- 				<div style="float:left"> -->
							
<%-- 							<img alt="Image Loading..." src="/aaa/resources/files/${each.getDi_sysName().split(',')[0]}" --%>
<!-- 								style="width:250px; height:300px"> -->
							
<!-- 				</div> -->
<%-- 	</c:forEach> --%>
	
	
	
</div>

<div class="d2">
	<span id="paginShow"></span>
</div>

	<input id="pageNum111" type="hidden" name="pageNum111" value="2">

</form>

	




<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
<script type="text/javascript">



var slideIndex = 0;
showSlides();

function showSlides() {
    var i;
    var slides = document.getElementsByClassName("mySlides");
    var dots = document.getElementsByClassName("dot");
    for (i = 0; i < slides.length; i++) {
       slides[i].style.display = "none";  
    }
    slideIndex++;
    if (slideIndex> slides.length) {slideIndex = 1}    
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
    }
    slides[slideIndex-1].style.display = "block";  
    dots[slideIndex-1].className += " active";
    setTimeout(showSlides, 2000); // Change image every 2 seconds
}

 
 
 
 
$(window).scroll(function(){  
if  ($(window).scrollTop() > $(document).height() - $(window).height()){  
	alert("남은 리스트를 모두 보여줍니다.");
	var num =  frm111.pageNum111.value;
    $.ajax({
        type : 'GET',
        url : '/aaa/fashion/fashionPaging',
        data:
        {
        	num : num
        },
        success : function(result) {
           var hamp  =  result.hmap2;
           var comNum = result.num;
        }
    });
	
	}
}); 


				




</script>
</body>
</html>















