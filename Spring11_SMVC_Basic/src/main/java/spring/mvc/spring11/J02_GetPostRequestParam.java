package spring.mvc.spring11;

import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class J02_GetPostRequestParam {
	
	// value="/j02_insertOne", method=RequestMethod.GET 
//		-> URL이 [/j02_insertOne] 라고 요청이 됐을 때,
//		   [method=RequestMethod.GET]
//		-> Get방식일 때만 이 메소드를 작동시켜라.!
	@RequestMapping(value="/j02_insertOne", method=RequestMethod.GET)
	public String getWorks() {
		return "j02_insertForm";
	}
	
	
//	UTF-8 인코딩은 web.xml에서 설정한다.!
//	<!-- 한글 처리 : UTF-8 설정 -->	
//	<!-- filter / filter-mapping -->
//	<filter>
//		<filter-name>encodingFilter</filter-name>
//		<filter-class>org.springframework.web.filter.CharacterEncodingFilter</filter-class>
//		<init-param>
//			<param-name>encoding</param-name>
//			<param-value>UTF-8</param-value>
//		</init-param>
//	</filter>
//	<filter-mapping>
//		<filter-name>encodingFilter</filter-name>
//		<url-pattern>/*</url-pattern>
//	</filter-mapping>
	
	// URL이 똑같은 j02_insertOne이더라도 method= 방식에 따라 실행되는 메소드가 다르다.
	@RequestMapping(value="/j02_insertOne", method=RequestMethod.POST)
	public ModelAndView postWorks(
			
//		@RequestParam(value="name") String name,
//			전달되어진 파라미터 name에 대한 파라미터 값을 String name 변수에 저장한다.
		@RequestParam(value="name", defaultValue="값이 없습니다.") String name,
		@RequestParam(value="age", required=false) /*int*/Integer age,
//		@RequestParam(value="name", defaultValue="값이 없습니다.") String name,
//		@RequestParam(value="age", defaultValue="0") /*int*/Integer age,
		
//		################################################################
//		예외상황 확인
		@RequestParam(value="data1", defaultValue="값이 없습니다.") String data1,
		@RequestParam(value="data2", required=false) Integer data2
			) {
		// required=false : 파라미터 값이 없어도 에러 발생하지 않음.(의미 : 값이 안들어올수도있다)
		// -> 코드상으로 안전하게 설정하기!!!
		// -> 단, 클래스 형이 아닌 기본자료형(int 등)으로 설정하면 에러!!!!!!
		// Integer로 설정..!!!!!
		// JSP 파일로부터 전달도니 파라미터에 대해 값이 없는 경우
		// -> String클래스를 제외한 모든 클래스형태의 값들은 null값이 들어온다.(String은 (""))
		// 	  ->단, 존재하지 않는 파라미터의 값의 경우
//				- String의 값, Integer등의 값 모두 null값으로 처리됨.
		
//		@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		// defaultValue="값이 없습니다." : 값을 입력하지않거나 값이 없을 경우
//			defaultValue로 값을 지정해서 넣어줄 수 있다. 
			// Integer 는 0으로 설정하자!!!
			// String 은 상황에따라 문자열 값을 넣어주자!!!
		
		// 이름을 입력하지 않았을 경우 String값에 대한 값은 ""로 설정된다.
		System.out.println("name : " + name + ", " + name.equals(""));
		System.out.println("age : " + age);
		
//		################################################################
//		예외상황 확인
		System.out.println("data1 : " + data1 + ", data2 : " + data2);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("name", name);
		mav.addObject("age", age);
		mav.setViewName("j02_insertView");
					
		return mav;
	}
	
	
}// (get/post request param) class END
