package spring.mvc.aaa.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.aaa.bean.Deal_Info;
import spring.mvc.aaa.bean.MemberBean;
import spring.mvc.aaa.bean.ReviewBean;
import spring.mvc.aaa.service.ReviewService;

@Controller
@RequestMapping("/review/")
public class ReviewController {
	
	@Autowired
	private ReviewService service;
	
	@RequestMapping(value="reviewPop", method=RequestMethod.GET)
	public ModelAndView popUpView(@RequestParam(value="di_num") Integer di_num,
						@RequestParam(value="m_num") Integer m_num) {
		System.out.println("상품 번호 : " + di_num);
		System.out.println("회원 m_num : " + m_num);
		Deal_Info di = service.diNameSearch(di_num);
		System.out.println("상품이름 : " + di.getDi_name());
		ModelAndView mav = new ModelAndView();
		mav.addObject("dealName", di.getDi_name());
		mav.addObject("di_num", di_num);
		mav.addObject("m_num", m_num);
		mav.setViewName("memPage/center/reviewPop");
		return mav;
	}
	
	@RequestMapping(value="reviewSubmit", method=RequestMethod.POST)
	public ModelAndView reviewSubmit(HttpServletRequest request) {
		ReviewBean review = new ReviewBean();
		
		String di_name = request.getParameter("dealName");
		int dr_m_num = Integer.parseInt(request.getParameter("dr_m_num"));
		String dr_title = request.getParameter("dr_title");
		String dr_content = request.getParameter("dr_content");
		int dr_di_num = Integer.parseInt(request.getParameter("di_num"));
		System.out.println("1. " + di_name);
		System.out.println("1. " + dr_m_num);
		System.out.println("1. " + dr_title);
		System.out.println("1. " + dr_content);
		
		
		
		System.out.println("2. " + dr_di_num);
		
		review.setDr_m_num(dr_m_num);
		review.setDr_title(dr_title);
		review.setDr_content(dr_content);
		review.setDr_di_num(dr_di_num);
		
//		[후기제목 4글자만 보여주고 나머지는 ... 으로 박아줄거임! 그래서 bean안에 dr_title_sub만들어서 출력때 그걸 사용하겠음.]
		String dr_title_sub = "";
		if(dr_title.length() < 5) {
			review.setDr_title_sub(dr_title);
		} else {
			review.setDr_title_sub(review.getDr_title().substring(0, 4) + "...");
		}
//		[후기내용 4글자만 보여주고 나머지는 ... 으로 박아줄거임! 그래서 bean안에 dr_title_sub만들어서 출력때 그걸 사용하겠음.]
		String dr_content_sub = "";
		if(dr_content.length() < 5) {
			review.setDr_content_sub(dr_content);
		} else {
			review.setDr_content_sub(review.getDr_content().substring(0, 4) + "...");
		}
		System.out.println("3. " + review.getDr_title_sub() );
		System.out.println("3. " + review.getDr_content_sub());
		
		int res = service.insertReview(review);
		System.out.println("3. " + res);
		ModelAndView mav = new ModelAndView();
		if(res > 0 ) {
			String msg = "상품후기등록완료-!";
			mav.addObject("msg", msg);
		}
		mav.setViewName("memPage/center/reviewPop");
		return mav;
	}
	
	@RequestMapping(value="ShowReviewDetail",method=RequestMethod.GET)
	public ModelAndView showReviewDetail(@RequestParam("dr_num") Integer dr_num
									, @RequestParam("dr_score") Integer score ){
		
		System.out.println(" 후기 상세보기 : " + dr_num);
		System.out.println(" 후기 조회수 : " + score);
		ReviewBean scorePlus = new ReviewBean();
		int dr_score = score +1;
		scorePlus.setDr_score(dr_score);
		scorePlus.setDr_num(dr_num);
		int res = service.reviewScorePlus(scorePlus);
		System.out.println("조회수 업그레이드 결과 : " + res);
		ReviewBean reviewDetail = service.reviewDetail(dr_num);
		int di_num = reviewDetail.getDr_di_num();
		int m_num = reviewDetail.getDr_m_num();
		System.out.println("- 상품번호 : " + di_num);
		System.out.println("- 회원번호 : " + m_num);
		Deal_Info di = service.dealInfo(di_num);
		MemberBean mem = service.memberInfo(m_num);
		System.out.println("상품정보확인 : " + di);
		ModelAndView mav = new ModelAndView();
		mav.addObject("di", di);
		mav.addObject("mem", mem);
		mav.addObject("reviewDetail", reviewDetail);
//		mav.addObject("top","/WEB-INF/views/adminPage/top/topIndex.jsp");
//		mav.addObject("center", centerPath + "answerQna.jsp");
		mav.setViewName("/memPage/center/reviewDetailPop");
		return mav;
	}
}
