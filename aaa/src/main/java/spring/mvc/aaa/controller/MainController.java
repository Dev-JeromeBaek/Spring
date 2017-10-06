package spring.mvc.aaa.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.aaa.bean.Deal_Info;
import spring.mvc.aaa.bean.NoticeBean;
import spring.mvc.aaa.bean.mapperBean;
import spring.mvc.aaa.service.CorpService;
import spring.mvc.aaa.service.DealService;
import spring.mvc.aaa.service.NoticeService;

@Controller
@RequestMapping("/main/")
public class MainController {

	@Autowired
	private NoticeService noService;
	@Autowired
	private DealService dealService;
	@Autowired
	CorpService corpService = new CorpService();

	@ModelAttribute("notice")
	public List<NoticeBean> nonono(){
		return noService.selectList();
	}
	
	@RequestMapping("/home")
	public ModelAndView home() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("left", "/WEB-INF/views/yeob/left/leftIndex.jsp");
//		mav.addObject("center", "/WEB-INF/views/yeob/center/centerIndex.jsp");
		mav.addObject("right", "/WEB-INF/views/yeob/right/rightIndex.jsp");
		mav.addObject("slide", "/WEB-INF/views/yeob/slide/topItems.jsp");
		mav.addObject("todays", "/WEB-INF/views/yeob/todays/todayPick.jsp");
		mav.addObject("others", "/WEB-INF/views/yeob/others/othersDeal.jsp");
		
		mav.addObject("notice",noService.selectList());
		
		mav.setViewName("home");
		return mav;
	}
	
	@RequestMapping(value="recentDel", produces="text/plain; charset=UTF-8")
	@ResponseBody
	public String recentDelete(@RequestParam("di_num")Integer di_num,HttpSession session,@RequestParam(value="center",required=false)String center){
		ArrayList<Deal_Info> recent = (ArrayList<Deal_Info>)session.getAttribute("recent");
		ArrayList<Deal_Info> newRecent = new ArrayList<>();
		System.out.println("recent.size() : " + recent.size());
		for(Deal_Info each : recent)
			if(each.getDi_num()!=di_num)
				newRecent.add(each);
		System.out.println("newRecent.size() " + newRecent.size());
		session.setAttribute("recent", newRecent);
		
		return di_num.toString();
	}
	
	@RequestMapping("inipop")
	public ModelAndView inipop() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/yeob/bottom/bottomPop");
		
		return mav;
	}
	
	@RequestMapping("gradePop")
	public ModelAndView gradePop() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/yeob/center/gradePop");
		return mav;
	}
	
	
	@RequestMapping(value="scrollPaging", produces="text/plain; charset=UTF-8")
	@ResponseBody
	public String scrollPaging(Integer dealNum){
		String didi="";
		List<Deal_Info> diList = corpService.dealApproveList("YES");
		if(!diList.isEmpty()) {
			System.out.println(diList.size());
			if(diList.size()>dealNum){
				for(int i=dealNum;i<dealNum+4;i++){
					if(diList.size()>i){
						System.out.println("i : "+i);
						didi += diList.get(i).getDi_sysName().split(",")[0]+","+diList.get(i).getDi_num()+","+diList.get(i).getDi_name()
								+","+diList.get(i).getDi_exp()+","+diList.get(i).getDi_price()+"-";
					}else{
						break;
					}
				}
			}
		}
		return didi;
	}
	
}
