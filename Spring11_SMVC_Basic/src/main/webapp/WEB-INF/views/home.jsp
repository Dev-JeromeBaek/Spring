<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="UTF-8"%>
<html>
<head>
	<script type="text/javascript">
		if("${ maSSage }" != null) {
			alert("${ maSSage }");
		}
	</script>
	<title>Home</title>
</head>
<body style="font-size: 16px;">
	
	<h2>0. RequestMapping 이용하기</h2>
	
	<a href="/spring11/j00_basic.jsp">0. j00_basic.jsp 이동하기(에러->.jsp)</a>
	<hr>
	
	<a href="/spring11/j00_basic">0. j00_basic.jsp 이동하기</a>
	<hr>
	
	<a href="/spring11/j00_basic01">0. j00_basic01.jsp 이동하기</a>
	<hr>
	
	<a href="/spring11/j00_works01">0. 페이지 이동 : works01(URL) -> 컨트롤러 -> works02(jsp)</a>
	<hr>
	
	<%-- redirect공부하기!! --%>
	<a href="/spring11/j00_works03">0. 페이지 이동 : works03(URL) -> 컨트롤러(redirect)
												-> 컨트롤러(works01 : return works02)
												-> works02(jsp)</a>
	<hr>
	
	<h2>1. ModelAndView 이용하기</h2>
	
	<a href="/spring11/j01_mav01">
		1. 정보 가져오기 (viewname && data 설정)</a>
	<hr>
	
	<a href="/spring11/j01_mavView02">	
	<%-- viewName이 설정되어있지 않으면 mapping된 이름으로 페이지를 찾아감. --%>
		1. 정보 가져오기 (viewname 설정 없음)</a>
	<hr>
	
	<h2>2. RequestMapping의 get/post 이용 
			&& 파라미터 정보에 대한 @RequestParam 이용</h2>
	
	<a href="/spring11/j02_insertOne">
		2. 정보 입력 후 도착페이지에서 파라미터 확인</a>
	<hr>
	
	<h2>3. RequestMapping의 get/post 이용
			&& 파라미터 정보에 대한 bean의 자동 저장 기능 이용</h2>
			
	<a href="/spring11/j03_insertOne">
		3. 정보 입력 후 도착페이지에서 파라미터 확인</a>
	<hr>
		
	<h2>4. ModelAttribute 이용하기 01</h2>
	
	<a href="/spring11/j04_insertOne">
		4. 정보 입력 후 도착페이지에서 파라미터 확인</a>
	<hr>
	
	<h2>5. ModelAttribute 이용하기 02
			- 공통적으로 사용하는 데이터에 대한 이용(@메소드)</h2>
		
	<a href="/spring11/j05_view01">
		5. 컨트롤러에서 데이터 가져오기(view01)</a>
	<hr>
	
	<a href="/spring11/j05_view02">
		5. 컨트롤러에서 데이터 가져오기(view02)</a>
	<hr>
	
	<a href="/spring11/j06_modelView">
		6. 데이터 가져오기</a>
	<hr>
	
	<h2>7. 클래스 필드에 대한 파라미터 이용하기</h2>
	
	<a href="/spring11/j07_insertOne">
		7. 학생 정보 입력 및 전송하기</a>
	<hr>
	
	<h2>8. 컬렉션 필드에 대한 파라미터 이용하기</h2>
	
	<a href="/spring11/j08_insertList">
		8. 인사 정보(여러명) 입력 및 전송하기</a>
	<hr>
	
	
	
</body>
</html>
