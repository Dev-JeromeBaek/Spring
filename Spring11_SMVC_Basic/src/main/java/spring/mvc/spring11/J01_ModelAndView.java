package spring.mvc.spring11;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.spring11.bean.People;

@Controller
public class J01_ModelAndView {
	
	@RequestMapping("/j01_mav01")
	public ModelAndView works01() {
//		ModelAndView : 데이터 및 페이지 이동을 함께 갖고있는 형태의 메소드
		
		People peoBean = new People("둘리", 950);
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("peoBean", peoBean);
//		mav.addObject("peoBean", peoBean); : 보내주고 싶은 값 setAttribute
		
		mav.setViewName("j01_mavView01");
//		mav.setViewName("j01_mavView01"); : 이동하고싶은 Page 설정
		
		return mav;
	}
	
	@RequestMapping("/j01_mavView02")
	public ModelAndView works02() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("peo", new People("도우너", 19));
		
		return mav;
	}
	
}// (ModelAndView) class END
