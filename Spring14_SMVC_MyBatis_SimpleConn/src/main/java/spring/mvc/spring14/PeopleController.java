package spring.mvc.spring14;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.spring14.bean.PeopleBean;
import spring.mvc.spring14.module.PageDTO;
import spring.mvc.spring14.repository.PeopleRepository;

@Controller
public class PeopleController {
	
	@Autowired
	private PeopleRepository repository;
	
	@RequestMapping("selectList")
	public String selectList(Model model, PageDTO pageDto) {
		
		List<PeopleBean> listc = repository.selectList(pageDto);
		model.addAttribute("listc", listc);
		
		 return "selectList";
	}
	
	@RequestMapping("selectOne")
	public ModelAndView selectOne(@RequestParam("num") Integer num) {
		
		ModelAndView mav = new ModelAndView();
		PeopleBean peoBean = repository.selectOne(num);
		
		mav.addObject("peoBean", peoBean);
		mav.setViewName("selectOne");
		
		return mav;
	}
	
}// (Controller) class END
