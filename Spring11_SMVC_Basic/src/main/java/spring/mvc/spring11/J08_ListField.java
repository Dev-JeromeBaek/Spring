package spring.mvc.spring11;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.spring11.bean.PeopleList;

@Controller
public class J08_ListField {
	
	@RequestMapping(value="/j08_insertList", method=RequestMethod.GET)
	public String getWorks() {
		return "/j08_insertListForm";
	}
	
	@RequestMapping(value="/j08_insertList", method=RequestMethod.POST)
	public ModelAndView postWorks(PeopleList peoList) {
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("peoList", peoList);
		mav.setViewName("j08_insertListView");
		
		return mav;
	}
	
}// class END
