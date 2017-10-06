package spring.mvc.aaa.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.aaa.bean.DealQnaBean;
import spring.mvc.aaa.bean.Deal_Detail;
import spring.mvc.aaa.bean.Deal_Info;
import spring.mvc.aaa.bean.MemberBean;
import spring.mvc.aaa.bean.ReviewBean;
import spring.mvc.aaa.service.DealService;
import spring.mvc.aaa.service.Digital_deal_Service;
import spring.mvc.aaa.service.ReviewService;

@Controller
@RequestMapping("/appliance_digital/")
public class Digital_Deal_Controller {

private String memPath = "/WEB-INF/views/min/";
	
	@Autowired
	private Digital_deal_Service service;
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private DealService dealService;
	
	private String logPath = "/WEB-INF/views/dealPage/top/";
	private String leftPath = "/WEB-INF/views/dealPage/left/";
	private String centerPath = "/WEB-INF/views/dealPage/center/";
	private String rightPath = "/WEB-INF/views/dealPage/right/";
	
	@RequestMapping("/home")
	public ModelAndView home() {
		
		ModelAndView mav = new ModelAndView();
//		mav.addObject("left", "/WEB-INF/views/yeob/left/leftIndex.jsp");
		mav.addObject("center", "/WEB-INF/views/yeob/center/centerIndex.jsp");
//		mav.addObject("right", "/WEB-INF/views/yeob/right/rightIndex.jsp");
		
		mav.setViewName("home");
		return mav;
	}
	
	@RequestMapping(value="digitalList", method=RequestMethod.GET)
	public ModelAndView selectList(@RequestParam (value="tv_refrigerator_washing", required=false)String tv_refrigerator_washing
								,@RequestParam (value="season", required=false)String season
								,@RequestParam (value="life", required=false)String life
								,@RequestParam (value="kitchen", required=false)String kitchen
								,@RequestParam (value="car", required=false)String car
								,@RequestParam (value="notbook_tablet_pc", required=false)String notbook_tablet_pc
								,@RequestParam (value="game_software", required=false)String game_software
								,@RequestParam (value="storage_others", required=false)String storage_others
								,@RequestParam (value="moniter_printer", required=false)String moniter_printer
								,@RequestParam (value="mobile_acc", required=false)String mobile_acc
								,@RequestParam (value="camera_video_sound", required=false)String camera_video_sound) {
		
		ModelAndView mav = new ModelAndView();
		Deal_Info di = new Deal_Info();
		Deal_Detail ddb = new Deal_Detail();
		String kinds = null;
		
		if(tv_refrigerator_washing != null){
			di.setDi_category("TV·냉장고·세탁기");
			kinds = tv_refrigerator_washing;
		} 
		if(season != null){
			di.setDi_category("계절가전");
			kinds = season;
		}
		if(life != null){
			di.setDi_category("생활가전");
			kinds = life;
		}
		if(kitchen != null){
			di.setDi_category("주방가전");
			kinds = kitchen;
		}
		if(car != null){
			di.setDi_category("차량용디지털기기");
			kinds = car;
		}
		if(notbook_tablet_pc != null){
			di.setDi_category("노트북·태블릿·PC");
			kinds = notbook_tablet_pc;
		}
		if(game_software != null){
			di.setDi_category("게임·소프트웨어");
			kinds = game_software;
		}
		if(storage_others != null){
			di.setDi_category("저장장치·주변기기");
			kinds = storage_others;
		}
		if(moniter_printer != null){
			di.setDi_category("모니터·프린터");
			kinds = moniter_printer;
		}
		if(mobile_acc != null){
			di.setDi_category("모바일·액세서리");
			kinds = mobile_acc;
		}
		if(camera_video_sound != null){
			di.setDi_category("카메라·영상·음향");
			kinds = camera_video_sound;
		}
		List<Deal_Info> digitalList = service.digitalList(di); 
//		
//		mav.addObject("InfoList", InfoList);
		mav.addObject("digitalList", digitalList);
									
		mav.addObject("kinds",kinds);
		
		mav.addObject("center", centerPath + "digitalList.jsp");
		mav.setViewName("home");
		
		return mav;
		
	}
	
//	@RequestMapping("digitalList")
//	public ModelAndView digitalList() {
//		ModelAndView mav = new ModelAndView();
//		List<Digital_Deal_Bean> digitalList = service.digitalList();
//		mav.addObject("digitalList", digitalList);
//		mav.addObject("center", memPath + "mem_registration.jsp");
//		mav.setViewName("home");
//		return mav;
//	}

	@RequestMapping(value="digitalOne", method=RequestMethod.GET)
	public ModelAndView digitalOne(@RequestParam (value="di_num") Integer di_num) {
		System.out.println("digitalOne - 넘어옴");
		ModelAndView mav = new ModelAndView();
		Deal_Info dealInfo = service.digitalOne1(di_num);
		Deal_Info di = service.digitalOne1(di_num);
		List<Deal_Detail> dealDetail = service.digitalOne2(di_num);

// 		[후기를 가져올 상품 번호]
		int num = dealInfo.getDi_num();
		
//		[후기정보넘겨주기]
		List<ReviewBean> reviewList = reviewService.reviewList(num);
				
//		[후기정보담아서 보내기]
		mav.addObject("reviewList", reviewList);
		
		List<MemberBean> reMemList = dealService.selectDealReviewMem(di.getDi_num());
		mav.addObject("reMemList", reMemList);
		
		List<DealQnaBean> dqList = dealService.selectDQList(di.getDi_num());
		mav.addObject("dqList", dqList);
		
		List<MemberBean> qnaMemList = dealService.selectDQMemList(di.getDi_num());
		mav.addObject("dqMemList", qnaMemList);
		
		mav.addObject("dealInfo", dealInfo);
		mav.addObject("dealDetail", dealDetail);
		mav.addObject("center", centerPath + "digitalOne.jsp");
		mav.setViewName("home");
		System.out.println(dealInfo);
		System.out.println(dealInfo.getDi_sysName());
		System.out.println(dealInfo.getDi_name());

		System.out.println(dealDetail);
		System.out.println("화면 이동합니다. 보냄보냄");
		return mav;
	}
	
	@RequestMapping("/insertQna")
	public ModelAndView insertQna(@RequestParam("qnaCont") String qnaCont
								,@RequestParam("di_num") Integer di_num, HttpSession session ) {
		System.out.println(qnaCont);
		DealQnaBean dq = new DealQnaBean();
		dq.setDq_content(qnaCont);
		dq.setDq_di_num(di_num);
		dq.setDq_m_num(((MemberBean)session.getAttribute("memLogin")).getM_num());
		
		int res = dealService.insertDealQna(dq);
		System.out.println("insertQna - " + res);
		ModelAndView mav = new ModelAndView();
		mav.addObject("di_num",di_num);
		mav.setViewName("redirect:/appliance_digital/digitalOne");
		return mav;
	}
	
	
}























