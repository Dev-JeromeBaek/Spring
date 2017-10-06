package controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import model.HomeService;

@Controller
public class HomeController {
	
//	url이 value="/hello.mv"이런 모양이면 
//	public String works01(Model model) 메소드를 실행시켜라
//	forwarding을 return으로 지정

	
	@RequestMapping(value="/hello.mv")
	public String works01(Model model) {
		
		model.addAttribute("msg", "Spring MVC 시작");
		
		return "/WEB-INF/intro.jsp";
	}
//	==========================================================
	
	@Autowired
	private HomeService service;
	
	@RequestMapping("/selectList.mv")
	public String works02(Model model) {
		
		ArrayList<String> listc = service.selectList();
		model.addAttribute("listc", listc);
		
		return "/WEB-INF/intro.jsp";
	}
	
}// class END
