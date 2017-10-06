package spring.mvc.spring16.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("corp/")
public class CorpController {
	
	private String peoPath = "/WEB-INF/views/peoViews/";
	
	@ModelAttribute("top2")
	public String peoTop2() {
		return"/WEB-INF/views/peoViews/peoTop2.jsp";
	}
	
	@ModelAttribute("left")
	public String left() {
		return"/WEB-INF/views/peoViews/peoLeft.jsp";
	}
	
	@RequestMapping("/home")
	public ModelAndView home() {
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("center", peoPath + "peoCenter.jsp");
		mav.setViewName("home");
		return mav;
	}
	
	@RequestMapping(value="insertOne", method=RequestMethod.GET)
	public ModelAndView insertOne() {
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("center", peoPath + "insertForm.jsp");
		mav.setViewName("home");
		
		return mav;
	}
	
	@RequestMapping(value="insertOne", method=RequestMethod.POST)
	public ModelAndView insertOne2() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:selectList");
		
		return mav;
	}
	
	@RequestMapping("selectList")
	public ModelAndView selectList() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("home");
		mav.addObject("listc", "전체정보");
		mav.addObject("center", peoPath + "selectList.jsp");
		return mav;
	}
		
}// (Controller) class END
