package spring.mvc.aaa.controller;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.aaa.bean.Corp;
import spring.mvc.aaa.bean.Deal_Detail;
import spring.mvc.aaa.bean.Deal_Info;
import spring.mvc.aaa.module.FileWorks;
import spring.mvc.aaa.service.CorpService;
import spring.mvc.aaa.service.DealService;
import spring.mvc.aaa.service.NoticeService;

@Controller
@RequestMapping("/corp/") // 프로젝트명을 명시할 것임.
public class CorpController {

	@Autowired
	private CorpService service;
	@Autowired
	private NoticeService noService;
	@Autowired
	private FileWorks fileWorks;
	@Autowired
	private DealService dealService;

	private String logPath = "/WEB-INF/views/corpPage/top/";
//	private String leftPath = "/WEB-INF/views/corpPage/left/";
	private String centerPath = "/WEB-INF/views/corpPage/center/";
//	private String rightPath = "/WEB-INF/views/corpPage/right/";
	
	
	@RequestMapping("/home")
	public ModelAndView home() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("notice",noService.selectList());
		
		mav.setViewName("home");
		return mav;
	}
	
//	@RequestMapping("corpLogin")
//	public ModelAndView corpLogin(HttpSession session){
//		ModelAndView mav = new ModelAndView();
//		session.setAttribute("corpLogin", "쿠팡(기업회원)");
//		JOptionPane.showMessageDialog(null, "쿠팡(기업회원) 로그인 되었습니다.");
//		mav.setViewName("home");
//		return mav;
//	}
	
//	[그냥 로그아웃 or 딜 삭제 후 로그아웃 후 팝업 닫고 홈이동]
	@RequestMapping("corpLogout")
	public ModelAndView corpLogout(HttpSession session, @RequestParam(value="deleteCorp",required=false)String deleteCorp){
		Corp corp = (Corp) session.getAttribute("corpLogin");
		ModelAndView mav = new ModelAndView();
		session.removeAttribute("corpLogin");
		String msg = null;
		if(deleteCorp.equals("YES")) {
			int res = service.deleteCorp(corp.getC_num());
			msg = res > 0 ? "그동안 이용해주셔서 감사합니다." : "우리를 벗어날 수 없습니다.";
		} else {
			msg = "로그이웃되었습니다.";
		}
		mav.addObject("msg", msg);
		mav.setViewName("/yeob/goHome");
		return mav;
	}
	

	@RequestMapping(value = "/dealInsert", method = RequestMethod.GET)
	public ModelAndView corpLog() {
		ModelAndView mav = new ModelAndView();
//		mav.addObject("top", topPath + "topIndex.jsp");
//		mav.addObject("left", leftPath + "leftIndex.jsp");
		mav.addObject("center", centerPath + "dealInsert.jsp");
//		mav.addObject("right", rightPath + "rightIndex.jsp");

		mav.setViewName("home");
		return mav;
	}
	
	
	@RequestMapping("/dealSuccess")
	public ModelAndView administrator(MultipartHttpServletRequest multiRequest) {

		ModelAndView mav = new ModelAndView();
		// mav.addObject("top", topPath + "topIndex.jsp");
		// mav.addObject("left", leftPath + "leftIndex.jsp");
		mav.addObject("center", centerPath + "dealSuccess.jsp");
		// mav.addObject("right", rightPath + "rightIndex.jsp");

		String di_name = multiRequest.getParameter("name");
		String di_category = multiRequest.getParameter("category");
		String di_exp = multiRequest.getParameter("exp");
//		String di_approve = null;
		int di_price = Integer.parseInt(multiRequest.getParameter("price"));
		int di_c_num = Integer.parseInt(multiRequest.getParameter("num"));
		System.out.println("넘어온 num >> " + di_c_num);

		String di_orgName = "";
		String di_sysName = "";
		Map<String, MultipartFile> fileMap = multiRequest.getFileMap();

		Set<String> keys = fileMap.keySet();
		for (String key : keys) {
			MultipartFile upfileContents = fileMap.get(key);
			System.out.println("key : " + key + "  ,  value = " + upfileContents);
			System.out.println(upfileContents.getOriginalFilename());
			di_orgName += upfileContents.getOriginalFilename();
			di_sysName += fileWorks.upLoadAndGetSysName(upfileContents) + ",";
			System.out.println(di_sysName);
		}

//		[deal_approve 삭제 null값 을 적용하기위함.]
		Deal_Info info = new Deal_Info(di_name, di_category, di_orgName, di_sysName, di_exp, di_c_num, di_price);
			
//		[딜 설명 4글자만 보여주고 나머지는 ... 으로 박아줄거임! 그래서 bean안에 di_exp_sub만들어서 출력때 그걸 사용하겠음.]
		String di_exp_sub = "";
		if(di_exp.length() < 5) {
			info.setDi_exp_sub(di_exp);
		} else {
			info.setDi_exp_sub(info.getDi_exp().substring(0, 4) + "...");
		}
		
		int cnt = Integer.parseInt(multiRequest.getParameter("cnt"));
		System.out.println("cnt : " + cnt);

		Map<String, String> paramMap = multiRequest.getParameterMap();
		for (String paramName : paramMap.keySet()) {
			String paramValue = multiRequest.getParameter(paramName);
			System.out.println("paramName : " + paramName + ", paramVal ue : " + paramValue);

			// dd_kind / dd_name / dd_amount / dd_price
		}

		ArrayList<Deal_Detail> listc = new ArrayList<>();
		Deal_Detail dd = null;

		for (int i = 11; i <= cnt; i++) {

			for (String paramName : paramMap.keySet()) {

				if (dd == null) {
					dd = new Deal_Detail();
				}

				if (paramName.contains("dd_kind") && paramName.contains(i + "")) {
					dd.setDd_kind(multiRequest.getParameter(paramName));

				} else if (paramName.contains("dd_name") && paramName.contains(i + "")) {
					dd.setDd_name(multiRequest.getParameter(paramName));

				} else if (paramName.contains("dd_amount") && paramName.contains(i + "")) {
					dd.setDd_amount(Integer.parseInt(multiRequest.getParameter(paramName)));

				} else if (paramName.contains("dd_price") && paramName.contains(i + "")) {
					dd.setDd_price(Integer.parseInt(multiRequest.getParameter(paramName)));

				}

			}
			// dd.setDd_di_num(Integer.parseInt(multiRequest.getParameter("num2")));
			listc.add(dd);
			dd = null;
		}
		System.out.println("listc : " + listc);
		int res1 = service.dealInfo(info);
		System.out.println("info등록 완료");
		System.out.println("AA : " + listc);
		System.out.println("listc등록 완료");
		if (res1 >= listc.size()) {
			mav.addObject("msg", " 관리자에게 요청완료1");
		} else {
			mav.addObject("msg", " 관리자에게 요청실패1");
		}
		int res = service.dealInsert(listc);
		if (res >= listc.size()) {
			mav.addObject("msg", " 관리자에게 요청완료");
		} else {
			mav.addObject("msg", " 관리자에게 요청실패");
		}

		mav.setViewName("home");

		return mav;
	}
	
	
	

	@RequestMapping("/selectdeal")
	public ModelAndView selectDeal() {
		System.out.println("들어옴");
		ModelAndView mav = new ModelAndView();
//		mav.addObject("top", topPath + "topIndex.jsp");
//		mav.addObject("left", leftPath + "leftIndex.jsp");
		mav.addObject("center", centerPath + "selectDeal.jsp");
//		mav.addObject("right", rightPath + "rightIndex.jsp");
		List<Deal_Info> info = service.selectInfo();
		List<Deal_Detail> detail = service.selectDetail();
		mav.addObject("info", info);
		mav.addObject("detail", detail);
		mav.setViewName("home");

		return mav;
	}
}// (Controller) class END

