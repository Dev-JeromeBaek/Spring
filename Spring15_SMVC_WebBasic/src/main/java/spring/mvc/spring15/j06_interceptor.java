package spring.mvc.spring15;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

//	인터셉터 구현
//	1. 인터셉터 구현 클래스 필요
//	2. servlet-context.xml(인터셉터는 빈 객체가 필요한데, 
//		얘의 역할은 정상적인경우와 비정상적인 경우의 mapping을 바꾸기 때문에 
//		웹로직으로 인정받아서 servlet-context에서 빈을 (생성?x) 설명 한다!!!!설정인데,, 다시이해..)에서 인터셉터 빈 설정 필요
	
	
@Controller
public class j06_interceptor {
	
	@RequestMapping("j06_interceptor")		
	public String goPage() {
		System.out.println("goPage");
		
		return "j06_interceptor";
	}
	
	@RequestMapping("/logAlert")
	public String goAlertPage() {
		System.out.println("goAlertPage");
		
		
		return "j06_logAlert";
	}
	
}// (Controller) class END
