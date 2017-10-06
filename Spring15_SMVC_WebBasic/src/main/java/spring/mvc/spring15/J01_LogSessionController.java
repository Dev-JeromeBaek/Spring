package spring.mvc.spring15;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.spring15.bean.LogBean;
import spring.mvc.spring15.repository.LogRepository;

@Controller
public class J01_LogSessionController {
	
	@Autowired
	private LogRepository repository;
	
	@RequestMapping("j01_logHome")
	public void works01() {};
	
	@RequestMapping(value="regLog", method=RequestMethod.GET)
	public String getRegLog() {
		return "j02_regLogForm";
	}
	
	@RequestMapping(value="regLog", method=RequestMethod.POST)
	public ModelAndView postRegLog(LogBean log) {
		
		int res = repository.insertOne(log);
		
		ModelAndView mav = new ModelAndView();
		if(res > 0) {
			mav.addObject("msg", "회원 가입 완료");
		} else {
			mav.addObject("msg", "회원 가입 실패");
		}
		mav.setViewName("j01_logHome");
		
		return mav;
	}
	
	@RequestMapping("login")	// 매개변수 영역에 사용하고싶은 것들을 넣으면 
								// Spring이 자동으로 가져와서 사용할 수 있게끔 만들어준다!!
	public String login(
				LogBean log, ModelMap mmap, HttpSession session) {
		
		LogBean loginRes = repository.selectOne(log);
		if(loginRes != null) {
			session.setAttribute("nowLogin", log.getId());
			mmap.addAttribute("msg", log.getId() + "님 하이!");
		} else {
			
			mmap.addAttribute("msg", "로그인 실패");
		}
		
		return "j01_logHome";
	}
	
	@RequestMapping("logOut")
	public String logOut(HttpSession session, ModelMap mmap) {
		String id = (String)session.getAttribute("nowLogin");
		mmap.addAttribute("msg", id + "님 빠이!");
		session.invalidate();
		
		return "j01_logHome";
	}
	
	
	
}// class END
