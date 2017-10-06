package spring.mvc.spring11;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.mvc.spring11.bean.People;

@Controller
public class J04_ModelAttribute01 {
	
	@RequestMapping(value="/j04_insertOne", method=RequestMethod.GET)
	public String getWorks() {
		return "j04_insertForm";
	}
	
//	1. 클래스 이름을 이용하여 자동으로 이름이 생성됨
//		-> 클래스 이름의 첫글자가 소문자인 키워드
//	@RequestMapping(value="/j04_insertOne", method=RequestMethod.POST)
//	public String postWorks(@ModelAttribute People peoBean) {
//		
//		return "j04_insertView";
//	}
	
//	2. 원하는 이름의 빈을 설정하려는 경우
	@RequestMapping(value="/j04_insertOne", method=RequestMethod.POST)
	public String postWorks(@ModelAttribute("ppBean") People peoBean) {
		
		return "j04_insertView";
}
	
}// (ModelAttribute) class END
