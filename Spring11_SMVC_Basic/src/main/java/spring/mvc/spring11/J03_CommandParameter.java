package spring.mvc.spring11;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.spring11.bean.People;
import spring.mvc.spring11.bean.People2;

//	커맨드 객체
//	- @RequestParam을 통해 전달되는 파라미터 값을
//		bean 객체에 자동으로 저장함.
//	- 같은 타입(클래스)의 빈이 여러개인 경우, 모두 저장됨
//	- 파라미터의 이름과 클래스의 멤버 변수 이름이 같아야 함
//		(각 멤버변수의 setter를 통해 파라미터 값을 저장하므로 setter는 필수 요소)

@Controller
public class J03_CommandParameter {
	
	@RequestMapping(value="/j03_insertOne", method=RequestMethod.GET)
	public String getWorks() {
		return "j03_insertForm";
	}
	
	@RequestMapping(value="/j03_insertOne", method=RequestMethod.POST)
	public ModelAndView postWorks(
							People peoBean, People2 peoBean2) {
//	(People peoBean) : 프레임워크가 이 (People)이라는 클래스로부터 
//						자기가 사용하기 위한 객체(peoBean)를 하나 생성함.
//	People2 addObject를 해주지 않아도 @Component한 것 처럼 bean이 생성된다.
//		-> @Component는 클래스의 이름의 첫글자를 소문자로 바꾼 뒤 빈으로 생성해준다.
		
		System.out.println(peoBean.getName() + ", " + peoBean.getAge());

		System.out.println(peoBean2.getName() + ", " + peoBean2.getAge());
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("j03_insertView");
		mav.addObject("peoBean", peoBean);
		
		return mav;
	}
	
}// (CommandParameter) class END
