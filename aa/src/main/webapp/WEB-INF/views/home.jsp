<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="/aa/resources/style.css" type="text/css">
</head>
<body>


<div class="counter" data-count="12312312"></div>

<button id="oneMore"> 다시 돌려라  버튼 </button>

<div class="counter" data-count="9871"></div>
<div class="counter" data-count="51513"></div>
<div class="counter" data-count="91818121365158"></div>

<div class="counter" data-count="183131"></div>
<div class="counter" data-count="60000"></div>

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="/aa/resources/jquery.easing.js"></script>
<script type="text/javascript" src="/aa/resources/jquery.rollingCounter.min.js"></script>
<script type="text/javascript">

$(".counter").rollingCounter({
    animate : true,
    attrCount : 'data-count',
    delayTime : 20 ,
    waitTime : 1 ,
    easing : 'easeOutBounce',
    duration : 1000
});

$("#oneMore").bind("click", function(){
    var counter =  $(".counter").eq(0).data("rollingCounter-1");
    counter.rolling();
});

// ]]>
</script>

</body>
</html>
