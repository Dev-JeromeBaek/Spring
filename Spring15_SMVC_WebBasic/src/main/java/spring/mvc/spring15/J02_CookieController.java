package spring.mvc.spring15;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class J02_CookieController {
	
	@RequestMapping("j02_cookieHome")
	public void works() {}
	
	@RequestMapping("makeCookie")
	public String makeCookie(HttpServletResponse response, ModelMap mmap) {
		System.out.println("쿠키 생성");
		 
		Cookie ck = new Cookie("myCookie", "asd");
		response.addCookie(ck);
		mmap.addAttribute("msg", "myCookie 생성 및 전송 완료");
		
		return "j02_cookieHome";
	}
	
	@RequestMapping("showCK")
	public String showCK(ModelMap mmap, 
							@CookieValue(value="myCookie", 
								required=false) Cookie ck1, 
									@CookieValue(value="myCookie", 
										defaultValue="쿠키 없음") 
											String ckValue) {
	
		if(ck1 != null) {
			System.out.println("ck1의 값 : " + ck1.getValue());
			mmap.addAttribute("myCookie", ck1.getValue());
		}
			System.out.println("ckValue : " + ckValue);
			
		return "j02_cookieHome";
	}
	
	@RequestMapping("delCK")
	public String delCK(HttpServletResponse response, ModelMap mmap) {
		
		Cookie ck = new Cookie("myCookie", "asd");
		ck.setMaxAge(0);
		response.addCookie(ck);
		mmap.addAttribute("msg", "쿠키 삭제 완료");
		return "j02_cookieHome";
	}
	
}// (Cookie) class END
