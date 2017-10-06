package spring.mvc.aaa;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.aaa.bean.MemRegistrationBean;
import spring.mvc.aaa.service.AaaService;

@Controller
@RequestMapping("/mem/")
public class MemberController {
	
	private String memPath = "/WEB-INF/views/min/";
	
	@Autowired
	private AaaService service;
	
	@RequestMapping(value="registration", method=RequestMethod.GET)
	public ModelAndView registration01() {
	
		ModelAndView mav = new ModelAndView();
		mav.addObject("center", memPath + "mem_registration.jsp");
		mav.setViewName("home");
		return mav;
	}
	
	@RequestMapping(value="registration", method=RequestMethod.POST)
	public ModelAndView registration02(MemRegistrationBean mem_reg, HttpServletRequest request) {
		System.out.println("회원가입 양식 넘어옴");
		  
		String tel01 = request.getParameter("tel01");
		String tel02 = request.getParameter("tel02");
		String tel03 = request.getParameter("tel03");
		String addr01 = request.getParameter("postCode");
		String addr02 = request.getParameter("roadAddress");
		String addr03 = request.getParameter("detailAddress");
		 
		String m_phone = tel01+"-"+tel02+"-"+tel03;
		String m_addr = addr01+addr02+addr03;
		  
		mem_reg.setM_addr(m_addr);
		mem_reg.setM_phone(m_phone); 
		
		System.out.println(m_addr);
		System.out.println(m_phone);
		
		int res = service.insertOne(mem_reg);
		
		ModelAndView mav = new ModelAndView();
		if(res > 0) {
			mav.addObject("msg", "회원 가입 완료");
		} else {
			mav.addObject("msg", "회원 가입 실패");
		}
		
		mav.addObject("center", memPath + "mem_login_page.jsp");
		mav.setViewName("home");	// 이동하려는 jsp 페이지의 이름을 입력
		
		return mav;
	}
			
	@RequestMapping("logOut")
	public String logOut(HttpSession session, ModelMap mmap) {
		
		String id = (String)session.getAttribute("nowLogin");
		mmap.addAttribute("msg", id + "님 빠이!");
		session.invalidate();
	
		return "";
	}
	
	
}
