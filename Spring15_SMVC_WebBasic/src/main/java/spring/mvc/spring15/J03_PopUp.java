package spring.mvc.spring15;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class J03_PopUp {
	
//	- 팝업 보지 않기 기능 구형 전 매핑
//	@RequestMapping("j03_popUpHome")
//	public void works() {}
	
	@RequestMapping("j03_popUpHome")
	public String works(
					ModelMap mmap,
						@CookieValue(value="nopop", required=false) String ckValue) {
		
		System.out.println("쿠키 없을 때 ckValue : " + ckValue);
		
		mmap.addAttribute("nopop", ckValue);
		
		return "j03_popUpHome";
	}
	

	@RequestMapping("showpop")
	public String popUpView() {
		return "j03_popUp";
	}
	
	@RequestMapping("nopopCK")
	public ModelAndView nopopCK(HttpServletResponse response) {
		
		Cookie ck = new Cookie("nopop", "no");
		ck.setMaxAge(5);
		response.addCookie(ck);
		System.out.println("nopopCK 쿠키 생성");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("j03_popUp");
		mav.addObject("closer", "ckComp");
		
		return mav;
	}
	
}
