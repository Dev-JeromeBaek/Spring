package spring.mvc.aaa.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.aaa.bean.DealQnaBean;
import spring.mvc.aaa.bean.Deal_Detail;
import spring.mvc.aaa.bean.Deal_Info;
import spring.mvc.aaa.bean.MemberBean;
import spring.mvc.aaa.bean.ReviewBean;
import spring.mvc.aaa.service.DealService;
import spring.mvc.aaa.service.NoticeService;
import spring.mvc.aaa.service.ReviewService;
import spring.mvc.aaa.service.SearchKeyWordService;

@Controller
@RequestMapping("/searchKeyWord/")
public class SearchKeyWordController {
	
	@Autowired
	private SearchKeyWordService service;
	@Autowired
	private NoticeService noService;
	@Autowired
	private DealService dealService;
	@Autowired
	private ReviewService reviewService;
	
	
	private String centerPath = "/WEB-INF/views/searchPage/center/";
	
	@RequestMapping("/home")
	public ModelAndView home() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("notice",noService.selectList());
		
		mav.setViewName("home");
		return mav;
	}
	
	@RequestMapping(value="KeyWord", produces="text/plain; charset=UTF-8")
	@ResponseBody
	public String SearchKeyWord(@RequestParam(value="key") String KeyWord) {
		System.out.println("검색어 메소트로 옴");
		System.out.println("검색어 - " + KeyWord);
		
		String KeyWord_Result = null;
		
		List<Deal_Info> listc = service.SearchKeyWord(KeyWord);	
		KeyWord_Result = "";
		for(Deal_Info each : listc) {
			
			System.out.println("#### - " + each.getDi_name() + " - " + each.getDi_category());
			KeyWord_Result += "<a href=/aaa/searchKeyWord/KeyWordChoice?key="+each.getDi_num()+">"+each.getDi_name()+" - "+each.getDi_category()+"</a><br>";
		}
		
		System.out.println("검색에 대한 자동완성 결과를 보내주겠습니다.");
		System.out.println(KeyWord_Result);
		return KeyWord_Result;
		
	}
	
	@RequestMapping(value="SearchClick", method=RequestMethod.POST)
	public ModelAndView SearchClick(@RequestParam (value="keyword") String KeyWord) {
		System.out.println("클릭을 누른 후 검색어 메소트로 옴");
		System.out.println("클릭 검색어 - " + KeyWord);
		ModelAndView mav = new ModelAndView();
		List<Deal_Info> listc = service.SearchClick(KeyWord);
		for(Deal_Info each : listc) {
			
			System.out.println("&&&& - " + each.getDi_name() + " - " + each.getDi_category());
			
		}
		mav.addObject("KeyWord", KeyWord);
		mav.addObject("listc", listc);
		mav.addObject("center", centerPath + "searchList.jsp");
		mav.setViewName("home");
		System.out.println("검색어 클릭에 대한 결과를 보내주겠습니다.");
		return mav;
	}
	
	@RequestMapping(value="KeyWordChoice", method=RequestMethod.GET)
	public ModelAndView KeyWordChoice(@RequestParam (value="key") Integer KeyWord) {
		System.out.println("자동완성 검색어 선택 !!! 메소트로 옴");
		System.out.println("자동완성 선택 검색어 - " + KeyWord);
		ModelAndView mav = new ModelAndView();
		Deal_Info dealInfo = service.KeyWordChoice01(KeyWord);
		Deal_Info di = service.KeyWordChoice01(KeyWord);
		List<Deal_Detail> dealDetail = service.KeyWordChoice02(KeyWord);
		int num = dealInfo.getDi_num();
//		[후기정보넘겨주기]
		List<ReviewBean> reviewList = reviewService.reviewList(num);
				
//		[후기정보담아서 보내기]
		mav.addObject("reviewList", reviewList);
		System.out.println("Deal_Info - " + dealInfo);
		System.out.println("Deal_Detail - " + dealDetail);
		
		List<MemberBean> reMemList = dealService.selectDealReviewMem(di.getDi_num());
		mav.addObject("reMemList", reMemList);
		
		List<DealQnaBean> dqList = dealService.selectDQList(di.getDi_num());
		mav.addObject("dqList", dqList);
		
		List<MemberBean> qnaMemList = dealService.selectDQMemList(di.getDi_num());
		mav.addObject("dqMemList", qnaMemList);
		mav.addObject("exp", di.getDi_exp());
		System.out.println("111111..."+di.getDi_exp());
		mav.addObject("dealInfo", dealInfo);
		mav.addObject("dealDetail", dealDetail);
		mav.addObject("center", centerPath + "searchOne.jsp");
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
		mav.addObject("key", di_num);
		mav.setViewName("redirect:/searchKeyWord/KeyWordChoice");
		
		return mav;
	}
}
