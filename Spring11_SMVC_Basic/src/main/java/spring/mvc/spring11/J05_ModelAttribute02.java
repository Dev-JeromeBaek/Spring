package spring.mvc.spring11;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

//	@ModelAttribute를 메소드에 적용하는 경우,
//		모든 RequestMapping 메소드에 적용하는 경우,
//		이를 통해 코드의 중복을 피할 수 있다.

@Controller
public class J05_ModelAttribute02 {
	
	@ModelAttribute("data")
	public String works() {
		return "ModelAttribute를 이용하여 항상 전송하는 데이터";
	}
	
	@RequestMapping("/j05_view01")
	public String view01() {
		return "/j05_view01";
	}
	
	
//	[메소드 안에서 값을 사용하고싶을때!!]
	@RequestMapping("/j05_view02")
	public String view02(@ModelAttribute("data") String rcvAttr) {
//		=> view02 메소드 호출 시, 함께 호출되는 works 메소드의 attribute값을
//				이곳에서 이용하고 싶은 경우 위와 같은 명령 사용 가능.
		
		System.out.println("rcvAttr : " + rcvAttr);
		
		return "/j05_view02";
	}
	
}
