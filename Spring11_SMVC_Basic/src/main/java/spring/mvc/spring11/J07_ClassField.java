package spring.mvc.spring11;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.spring11.bean.InfoAll;

@Controller
public class J07_ClassField {
	
	@RequestMapping(value="/j07_insertOne", method=RequestMethod.GET)
	public String getWorks() {
		return "j07_insertForm";
	}
	
	@RequestMapping(value="/j07_insertOne", method=RequestMethod.POST)
	public ModelAndView postWorks(InfoAll info) {
		
		System.out.println("name : " + info.getPeo().getName());
		System.out.println("kor : " + info.getStu().getKor());
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("info", info);
		mav.setViewName("j07_insertView");
		
		return mav;
	}
	
	
}// class END
