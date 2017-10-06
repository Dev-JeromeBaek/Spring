package spring.mvc.aaa;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.aaa.bean.Deal_Info;
import spring.mvc.aaa.bean.NoticeBean;
import spring.mvc.aaa.service.CorpService;
import spring.mvc.aaa.service.DealService;
import spring.mvc.aaa.service.NoticeService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private NoticeService noService;
	@Autowired
	private DealService dealService;
	@Autowired
	private CorpService corpService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, @RequestParam(value="msg", required=false) String msg) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		List<Deal_Info> othersDealList = corpService.dealApproveList("YES");
		
		model.addAttribute("serverTime", formattedDate );
		
		model.addAttribute("othersDealList", othersDealList);
		model.addAttribute("others", "/WEB-INF/views/yeob/others/othersDeal.jsp");
		model.addAttribute("todays", "/WEB-INF/views/yeob/todays/todaysPick.jsp");
		model.addAttribute("msg", msg);
		return "home";
	}
	
	@ModelAttribute("notice")
	public List<NoticeBean> nonono(){
		return noService.selectList();
	}
	
	
	
}
