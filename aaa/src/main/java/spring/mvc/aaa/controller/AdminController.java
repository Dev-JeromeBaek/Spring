package spring.mvc.aaa.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.aaa.bean.BuyBean;
import spring.mvc.aaa.bean.BuyDetailBean;
import spring.mvc.aaa.bean.Corp;
import spring.mvc.aaa.bean.CorpBean;
import spring.mvc.aaa.bean.DealApproveBean;
import spring.mvc.aaa.bean.Deal_Detail;
import spring.mvc.aaa.bean.Deal_Info;
import spring.mvc.aaa.bean.ManageBean;
import spring.mvc.aaa.bean.MemberBean;
import spring.mvc.aaa.bean.NoticeBean;
import spring.mvc.aaa.bean.QnaBean;
import spring.mvc.aaa.bean.mapperBean;
import spring.mvc.aaa.module.FileWorks;
import spring.mvc.aaa.module.PageDTO;
import spring.mvc.aaa.service.AdminService;
import spring.mvc.aaa.service.BuyService;
import spring.mvc.aaa.service.CorpService;
import spring.mvc.aaa.service.DealService;
import spring.mvc.aaa.service.MemberService;
import spring.mvc.aaa.service.NoticeService;

@Controller
@RequestMapping("/admin/")
public class AdminController {
	
	@Autowired
	private AdminService service;
	
	@Autowired
	private MemberService memService;
	
	@Autowired
	private NoticeService noService;
	
	@Autowired
	private CorpService corpService;
	
	@Autowired
	private DealService dealService;
	
	@Autowired
	private BuyService buyService;
	
	@Autowired
	private FileWorks fileWorks;
		
//	private String logPath = "/WEB-INF/views/adminPage/top/";
//	private String leftPath = "/WEB-INF/views/adminPage/left/";
	private String centerPath = "/WEB-INF/views/adminPage/center/";
//	private String rightPath = "/WEB-INF/views/adminPage/right/";

	@RequestMapping("/home")
	public ModelAndView home() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("notice",noService.selectList());
		mav.setViewName("home");
		return mav;
	}
	
	@RequestMapping("deleteQna")
	public String deleteQna(@RequestParam("q_num")Integer q_num){
		int res = service.deleteQna(q_num);
		System.out.println(res>0 ? "1:1삭제 완료" : "1:1삭제 실패");
		
		return "redirect:adminQnaList";
	}
	
	
	@RequestMapping("adminLogin")
	public ModelAndView adminLogin(HttpSession session){
		List<MemberBean> totalMemList = service.showMemList();
		Integer totalCount = 0;
		for (MemberBean each : totalMemList) {
			totalCount += each.getM_logcount();
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
		String today = sdf.format(new Date());
		System.out.println("totalCount : " + totalCount);
		Integer todaysCount = service.countTodays(today);
//		System.out.println("today : " + today);
		ModelAndView mav = new ModelAndView();
		session.setAttribute("totalCount", totalCount);
		session.setAttribute("todaysCount", todaysCount);
		session.setAttribute("adminLogin", "admin");
		mav.setViewName("/yeob/goHome");
		return mav;
	}
	
	@RequestMapping("adminLogout")
	public ModelAndView adminLogout(HttpSession session){
		ModelAndView mav = new ModelAndView();
		session.removeAttribute("totalCount");
		session.removeAttribute("todaysCount");
		session.removeAttribute("adminLogin");
		mav.addObject("msg", "관리자 로그이웃되었습니다.");
		mav.setViewName("/yeob/goHome");
		return mav;
	}
	
	@RequestMapping("adminQnaList")
	public ModelAndView adminQnaList(){
		ModelAndView mav = new ModelAndView();
		List<QnaBean> ansList = service.selectQnaAnsList();
		List<QnaBean> noAnsList = service.selectQnaNoAnsList();
		mav.addObject("noList", noAnsList);
		mav.addObject("ansList", ansList);
//		mav.addObject("top","/WEB-INF/views/adminPage/top/topIndex.jsp");
		mav.addObject("center", centerPath + "qnaList.jsp");
		mav.setViewName("home");
		return mav;
	}
	
	@RequestMapping(value="answerQna",method=RequestMethod.GET)
	public ModelAndView answerQnaForm(@RequestParam("q_num") Integer q_num){
		ModelAndView mav = new ModelAndView();
		QnaBean qna = memService.selectQna(q_num);
		mav.addObject("qna", qna);
//		mav.addObject("top","/WEB-INF/views/adminPage/top/topIndex.jsp");
		mav.addObject("center", centerPath + "answerQna.jsp");
		mav.setViewName("home");
		return mav;
	}
	
	@RequestMapping(value="answerQna",method=RequestMethod.POST)
	public String answerQna(@RequestParam("q_num")Integer q_num, @RequestParam("answer")String answer){
		QnaBean qna = new QnaBean();
		qna.setQ_num(q_num);
		qna.setQ_ans(answer);
		service.answerQna(qna);
		
		return "redirect:adminQnaList";
	}
	
	@RequestMapping("showMemList")
	public ModelAndView showMemList() {
		List<MemberBean> memList = service.showMemList();
		String contact = "o";
		List<MemberBean> nowMemOx = service.nowMemOxCount(contact);
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("memList", memList);
		mav.addObject("nowMemOx", nowMemOx);
		
		System.out.println("현재 회원 통계 : " + memList.size());
//		mav.addObject("memTotal", memList.size());
		
		System.out.println("현재 접속 회원 수 : " + nowMemOx.size());
//		mav.addObject("nowMemOxCount", nowMemOx.size());
		
		mav.addObject("center", centerPath + "showMemList.jsp");
		mav.setViewName("home");
		return mav;
	}
	
//	=================================================================
//	[기업회원관리]
	@RequestMapping("corpManagement")
	public ModelAndView corpManagement() {
		
//		기업목록
		List<CorpBean> corpList = corpService.showCorpList();
		
		for(CorpBean each : corpList) {
			System.out.println("기업 번호 : " + each.getC_num());
		}
		
//		딜 목록
		List<Deal_Info> dealInfoList = corpService.showDealInfoList();
		
//		오늘 가입한 기업 수
		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
		String today = sdf.format(new Date());
		ArrayList<CorpBean> todaysJoinCorp = new ArrayList<>();
		for(CorpBean each : corpList) {
			if(each.getC_string_date().equals(today)) {
				todaysJoinCorp.add(each);
			}
		}
		System.out.println("오늘 가입한 기업 수 : " + todaysJoinCorp.size());
//		cc.c_num, cc.c_name, cc.c_ceo, dd.cou
//		구매 처리 완료 된 구매 내역 리스트에서 기업 갯수 뽑아오기
		List<mapperBean> salesTopCorp = buyService.salesTopCorp();
		List<mapperBean> topDealCorp = buyService.topDealCorp();
		List<mapperBean> topCancelCorp = buyService.topCancelCorp();
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("corpList", corpList);
		mav.addObject("dealInfoList", dealInfoList);
		mav.addObject("todaysJoinCorp", todaysJoinCorp);
		mav.addObject("salesTopCorp", salesTopCorp);
		mav.addObject("topDealCorp", topDealCorp);
		mav.addObject("topCancelCorp", topCancelCorp);
		mav.addObject("center", centerPath + "corpManagement.jsp");
		mav.setViewName("home");
		return mav;
	}
//	=========================================================================
//	[입점 & 제휴 관리]
	
	@RequestMapping("dealManagement")
	public ModelAndView dealManagement() {
		
		Calendar cal = Calendar.getInstance();
		
		System.out.println(" 월 : " + cal.get(Calendar.MONTH)+1);
		System.out.println(" 일 : " + cal.get(Calendar.DATE));
		
		List<Deal_Info> approveNullInfoList = corpService.approveNullInfo();
		
		System.out.println("--- : " + approveNullInfoList);
		for(Deal_Info each : approveNullInfoList) {
			System.out.println("딜상태 null인 기업 : " + each.getDi_c_num());
		}
		
		String YES = "YES";
		String NO = "NO";
		List<Deal_Info> dealApproveList = corpService.dealApproveList(YES);
		
		System.out.println("AAA : " + dealApproveList.size());
		
		List<Deal_Info> dealCancelList = corpService.dealCancelList(NO);
		
		System.out.println("BBB : " + dealCancelList.size());
		
		
		List<CorpBean> corpDealList = null;
		ArrayList<DealApproveBean> dealApprove = new ArrayList<>();
		for(Deal_Info eachDeal : approveNullInfoList) {
			corpDealList = corpService.upDealCorp(eachDeal.getDi_c_num());
			for(CorpBean eachCorp : corpDealList) {
				if(eachDeal.getDi_c_num() == eachCorp.getC_num()) {
					DealApproveBean dab = new DealApproveBean(
												eachDeal.getDi_num(), 
												eachCorp.getC_name(), 
												eachCorp.getC_ceo(),
												eachDeal.getDi_category(),
												eachDeal.getDi_exp_sub(),
												eachDeal.getDi_date());
					SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
					dab.setDi_string_date(sdf.format(dab.getDi_date()));
					dealApprove.add(dab);
					break;
				}
			}
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("approveNullInfoTotal", approveNullInfoList);
		mav.addObject("dealApproveList", dealApproveList);
		mav.addObject("dealCancelList", dealCancelList);
		mav.addObject("TotaldealInfo", approveNullInfoList.size()
										+ dealApproveList.size() 
										+ dealCancelList.size());
		mav.addObject("dealApprove", dealApprove);
		mav.addObject("center", centerPath + "dealManagement.jsp");
		mav.setViewName("home");
		return mav;
	}
	
//	======================================================================
	
	
	@RequestMapping("upStatusDeal")
	public String upStatusDeal(@RequestParam("di_num") Integer di_num,
								@RequestParam("di_approve") String di_approve) {
		
		mapperBean mb = new mapperBean();
		mb.setInte1(di_num);
		mb.setStr1(di_approve);
		int res = corpService.upStatusDeal(mb);
		System.out.println(res > 0 ? "승인상태 변경 완료" : "승인상태 변경 실패");
		return "redirect:dealManagement";
	}
	
	@RequestMapping("showNullDealAllex")
	public ModelAndView showNullDealAllex() {
		
//		List<Deal_Info> nullInfoList = corpService.approveNullInfo();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("center", centerPath + "showNullDealAllex.jsp");
		mav.setViewName("home");
		return mav;
	}
	
	
	
//	=================================================================================
//	[공지사항]
	
	@RequestMapping(value="noticeView", produces="text/plain; charset=UTF-8")
	@ResponseBody
	public Object noticeView(@RequestParam (value="notice_num",required=false)Integer notice_num
			,@RequestParam (value="notice_num",required=false)String notice_content){

		ModelAndView mav = new ModelAndView();
		
		NoticeBean notice = service.selectOne(notice_num);
		
		mav.addObject("notice",notice);
//		mav.addObject("center", "/WEB-INF/views/noticeList.jsp");
		
		mav.setViewName("noticeSelect");
		
		return mav;
	}
	
	@RequestMapping(value="noticeAnyView", produces="text/plain; charset=UTF-8")
	@ResponseBody
	public Object noticeAnyView(@RequestParam (value="notice_num",required=false)Integer notice_num){
		ModelAndView mav = new ModelAndView();
		NoticeBean notice = service.selectOne(notice_num);
		mav.addObject("notice",notice);
		mav.setViewName("adminPage/center/noticeSelectAny");
		return mav;
	}
	
	@RequestMapping(value="noticeSearchKey", method=RequestMethod.GET)
	public ModelAndView noticeSearchKey(NoticeBean notice){
		ModelAndView mav = new ModelAndView();
		
		List<NoticeBean> list = service.searchKey(notice);
		
		mav.addObject("list",list);
		
		mav.addObject("center", centerPath + "noticeList.jsp");
		
		mav.setViewName("home");
		
		return mav;
	}
	
	@RequestMapping(value="noticeMod", method = RequestMethod.GET)
	public ModelAndView mod(@RequestParam (value="notice_num",required=false)Integer notice_num){
		ModelAndView mav = new ModelAndView();
		
		System.out.println("mod"+notice_num);
		
		NoticeBean notice = service.selectOne(notice_num);
		
		mav.addObject("notice",notice);
		
		mav.addObject("center", centerPath + "noticeMod.jsp");
		
		mav.setViewName("home");
		
		return mav;
	}
	
	@RequestMapping(value="noticeModi", method = RequestMethod.POST)
	public ModelAndView modi(NoticeBean notice){
		ModelAndView mav = new ModelAndView();
		
		int res = service.modi(notice);
		if(res>0){
			mav.addObject("msg","수정 완료");
		}else{
			mav.addObject("msg","수정 실패");
		}
		mav.setViewName("redirect:noticeList");
		
		return mav;
	}
	
	@RequestMapping(value="noticeDel", method = RequestMethod.GET)
	public ModelAndView del(@RequestParam (value="notice_num",required=false)Integer notice_num){
		ModelAndView mav = new ModelAndView();
		
		System.out.println("del"+notice_num);
		
		int res = service.del(notice_num);
		if(res>0){
			mav.addObject("msg","삭제 완료");
		}else{
			mav.addObject("msg","삭제 실패");
		}
		mav.setViewName("redirect:noticeList");
		
		return mav;
	}

	
	@RequestMapping(value="noticeList", method=RequestMethod.GET)
	public ModelAndView jusoPopup(HttpSession session, PageDTO pageDTO){
		ModelAndView mav = new ModelAndView();
		 
		
		List<NoticeBean> list = noService.selectList(pageDTO);
		SimpleDateFormat sdf2;
		
		sdf2 = new SimpleDateFormat("yy년 MM월 dd일 E요일");
		
		for(NoticeBean each : list){
			System.out.println();
			each.setNotice_fordate((sdf2.format(each.getNotice_date())));
			
		}
		
		mav.addObject("pageDTO",pageDTO);
		
		mav.addObject("list",list);
		
		mav.addObject("center", centerPath + "noticeList.jsp");
		
		mav.setViewName("home");
		
		return mav;
	}
	

	@RequestMapping(value="noticeInsertForm", method=RequestMethod.GET)
	public ModelAndView noticeInsertForm(){
		ModelAndView mav = new ModelAndView();
		System.out.println("aaaaaaaaaaa");
		mav.addObject("center", centerPath + "noticeInsertForm.jsp");
		
		mav.setViewName("home");
		
		return mav;
	}
	
	@RequestMapping(value="noticeInsert", method = RequestMethod.POST)
	public ModelAndView noticeInsert(NoticeBean notice
			,@RequestParam (value="admin")String admin){
		ModelAndView mav = new ModelAndView();
		notice.setNotice_writer(admin);
		
		if(notice.getNotice_title() == "" || notice.getNotice_content() == ""){
			
			mav.addObject("msg","제목 또는 내용을 입력하세요.");
			
			mav.addObject("center", centerPath + "noticeInsertForm.jsp");
			
			mav.setViewName("home");
			
			return mav;
		}
		
		int res = service.insert(notice);
		if(res>0){
			mav.addObject("msg","성공적으로 등록했습니다.");
		}else{
			mav.addObject("msg","등록 실패");
		}
		
		mav.setViewName("redirect:noticeList");
		return mav;
	}
	
	
	
	
	
//	=================================================================================
//	[2017.03.17 백팀장]
	
//	[관리자가 딜 취소 버튼 눌렀을 때 떠야하는 팝업]
	@RequestMapping("beforeCancelMsg")
	public ModelAndView beforeCancelMsg(@RequestParam("di_num") Integer di_num) {
		
		Deal_Info di = dealService.selectDIOne(di_num);
		System.out.println("di : " + di.getDi_num());
		CorpBean co = corpService.getCorpInfoOne(di.getDi_c_num());
		System.out.println("co : " + co.getC_num());
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("di", di);
		mav.addObject("co", co);
		mav.setViewName("/adminPage/center/cancelMsg");
		return mav;
	}
	@RequestMapping("showDealBuyDetail")
	public ModelAndView showDealBuyDetail(@RequestParam("b_num") Integer b_num) {
		ModelAndView mav = new ModelAndView();
		List<BuyDetailBean>  buyDetailList = buyService.buyDetailList(b_num);
		if(!buyDetailList.isEmpty()) {
			mav.addObject("buyDetailList", buyDetailList);
		}
		BuyBean buyOne = buyService.buyOne(b_num);
		if( buyOne != null) {
			mav.addObject("buyOne", buyOne);
		}
		
		MemberBean mem = memService.showMember(buyOne.getB_m_num());
		if(mem != null) {
			mav.addObject("mem", mem);
		}
		Deal_Info dealInfo = dealService.selectDIOne(buyOne.getB_di_num());
		if(dealInfo != null) {
			mav.addObject("dealInfo", dealInfo);
		}
		mav.setViewName("/adminPage/center/showDealBuyDetail");
		return mav;
	}
	@RequestMapping("showCorpDetail")
	public ModelAndView showCorpDetail(@RequestParam("c_num") Integer c_num) {
		
		Corp corp = corpService.selectCorpOne(c_num);
		ModelAndView mav = new ModelAndView();
		if(corp != null) {
			mav.addObject("corp", corp);
		}
		mav.setViewName("/adminPage/center/showCorpDetail");
		return mav;
	}
	
	
	
	@RequestMapping("sendCancelMsg")
	public String sendCancelMsg(@RequestParam("di_num") Integer di_num,
									@RequestParam("di_exp") String di_exp) {
//		(엔터 <br>로 변환)
		System.out.println(di_exp);
		String di_exp_sub = "취소완료";
		mapperBean mapBean = new mapperBean();
		mapBean.setInte1(di_num);
		mapBean.setStr1(di_exp);
		mapBean.setStr2(di_exp_sub);
		mapBean.setStr3("NO");
		System.out.println("취소메시지 저장시킬 딜 번호 : " + di_num);
		System.out.println("취소메시지 : " + mapBean.getStr1());
		System.out.println("취소완료상태 : " + mapBean.getStr2());
		
		dealService.updateDealExplain(mapBean);
		
		return "redirect:dealManagement";
	}
	

//	==============================================================
//	[매출관리]
	
	@RequestMapping("adminSalesManagement")
	public ModelAndView adminSalesManagement() {
		
		// 구매내역 뽑아오기
		List<BuyBean> buyList = buyService.buyAllList();
		
		// 기업내역 뽑아오기
//		List<CorpBean> corpList = corpService.showCorpList();
//		System.out.println("c_num : " + buyList.get(0).getB_c_num());
		// 총 매출 구하기
		Integer totalAdminSales = 0;
		if(!buyList.isEmpty()) {
			for(BuyBean each : buyList) {
				if(each.getB_status().equals("YES")) {
					CorpBean corp = corpService.getCorpInfoOne(each.getB_c_num());
					System.out.println("corpGrade : " + corp.getC_grade());
					if(corp.getC_grade() == 6) {
						totalAdminSales += (int)((each.getB_price() * 0.15) - each.getB_discount());
					} else if(corp.getC_grade() == 5) {
						totalAdminSales += (int)((each.getB_price() * 0.14) - each.getB_discount());
					} else if(corp.getC_grade() == 4) {
						totalAdminSales += (int)((each.getB_price() * 0.13) - each.getB_discount());
					} else if(corp.getC_grade() == 3) {
						totalAdminSales += (int)((each.getB_price() * 0.12) - each.getB_discount());
					} else if(corp.getC_grade() == 2) {
						totalAdminSales += (int)((each.getB_price() * 0.11) - each.getB_discount());
					} else if(corp.getC_grade() == 1) {
						totalAdminSales += (int)((each.getB_price() * 0.10) - each.getB_discount());
					}
				}
			}
		}
		
		SimpleDateFormat sdfYear = new SimpleDateFormat("yy");
		SimpleDateFormat sdfMonth = new SimpleDateFormat("MM");
		SimpleDateFormat sdfDay = new SimpleDateFormat("dd");
		String thisYear = sdfYear.format(new Date());
		String thisMonth = sdfMonth.format(new Date());
		String thisDay = sdfDay.format(new Date());
		
		// 이번 년도 매출 구하기
		Integer yearAdminSales = 0;
		if(!buyList.isEmpty()) {
			for(BuyBean each : buyList) {
				if(each.getB_status().equals("YES")) {
					if(each.getB_date_string().split("/")[0].equals(thisYear)) {
						CorpBean corp = corpService.getCorpInfoOne(each.getB_c_num());
						if(corp.getC_grade() == 6) {
							yearAdminSales += (int)((each.getB_price() * 0.15) - each.getB_discount());
						} else if(corp.getC_grade() == 5) {
							yearAdminSales += (int)((each.getB_price() * 0.14) - each.getB_discount());
						} else if(corp.getC_grade() == 4) {
							yearAdminSales += (int)((each.getB_price() * 0.13) - each.getB_discount());
						} else if(corp.getC_grade() == 3) {
							yearAdminSales += (int)((each.getB_price() * 0.12) - each.getB_discount());
						} else if(corp.getC_grade() == 2) {
							yearAdminSales += (int)((each.getB_price() * 0.11) - each.getB_discount());
						} else if(corp.getC_grade() == 1) {
							yearAdminSales += (int)((each.getB_price() * 0.10) - each.getB_discount());
						}
					}
				}
			}
		}
		
		// 이번 달 매출 구하기
		Integer monthAdminSales = 0;
		if(!buyList.isEmpty()) {
			for(BuyBean each : buyList) {
				if(each.getB_status().equals("YES")) {
					if(each.getB_date_string().split("/")[0].equals(thisYear)) {
						if(each.getB_date_string().split("/")[1].equals(thisMonth)) {
							CorpBean corp = corpService.getCorpInfoOne(each.getB_c_num());
							if(corp.getC_grade() == 6) {
								monthAdminSales += (int)((each.getB_price() * 0.15) - each.getB_discount());
							} else if(corp.getC_grade() == 5) {
								monthAdminSales += (int)((each.getB_price() * 0.14) - each.getB_discount());
							} else if(corp.getC_grade() == 4) {
								monthAdminSales += (int)((each.getB_price() * 0.13) - each.getB_discount());
							} else if(corp.getC_grade() == 3) {
								monthAdminSales += (int)((each.getB_price() * 0.12) - each.getB_discount());
							} else if(corp.getC_grade() == 2) {
								monthAdminSales += (int)((each.getB_price() * 0.11) - each.getB_discount());
							} else if(corp.getC_grade() == 1) {
								monthAdminSales += (int)((each.getB_price() * 0.10) - each.getB_discount());
							}
						}
					}
				}
			}
		}
		
		// 금일 매출 구하기
		Integer dayAdminSales = 0;
		if(!buyList.isEmpty()) {
			for(BuyBean each : buyList) {
				if(each.getB_status().equals("YES")) {
					if(each.getB_date_string().split("/")[0].equals(thisYear)) {
						if(each.getB_date_string().split("/")[1].equals(thisMonth)) {
							if(each.getB_date_string().split("/")[2].equals(thisDay)) {
								CorpBean corp = corpService.getCorpInfoOne(each.getB_c_num());
								if(corp.getC_grade() == 6) {
									dayAdminSales += (int)((each.getB_price() * 0.15) - each.getB_discount());
								} else if(corp.getC_grade() == 5) {
									dayAdminSales += (int)((each.getB_price() * 0.14) - each.getB_discount());
								} else if(corp.getC_grade() == 4) {
									dayAdminSales += (int)((each.getB_price() * 0.13) - each.getB_discount());
								} else if(corp.getC_grade() == 3) {
									dayAdminSales += (int)((each.getB_price() * 0.12) - each.getB_discount());
								} else if(corp.getC_grade() == 2) {
									dayAdminSales += (int)((each.getB_price() * 0.11) - each.getB_discount());
								} else if(corp.getC_grade() == 1) {
									dayAdminSales += (int)((each.getB_price() * 0.10) - each.getB_discount());
								}
							}
						}
					}
				}
			}
		}
		
		// 회원 구매내역 전체 보기
		// 구매 번호 / 구매자 이름 / 상품 종류 / 상품 이름 / 상세 이름 / 상세 수량 / 총 금액 / 구매 날짜
		// 거래 완료 리스트(YES)
		ArrayList<ManageBean> buyYesMemList = new ArrayList<>();
		if(buyList != null) {
			for(BuyBean each : buyList) {
//				System.out.println("num : " + each.getB_m_num());
//				System.out.println("???? : " + memService.showMember(each.getB_m_num()).getM_name());
				if(each.getB_status().equals("YES")) {
					ManageBean manage = new ManageBean();
					manage.setMa_b_num(each.getB_num());
					MemberBean mem = memService.showMember(each.getB_m_num());
					if(mem != null) {
						manage.setMa_m_name(mem.getM_name());
					}
					Deal_Info di = dealService.selectDIOne(each.getB_di_num());
					if(di != null) {
						manage.setMa_di_category(di.getDi_category());
					}
					manage.setMa_di_name(each.getB_di_name());
					List<BuyDetailBean> buyDetailList = buyService.buyDetailList(each.getB_num());
					if(!buyDetailList.isEmpty()) {
						manage.setBuyDetail(buyDetailList);
					}
					manage.setMa_b_price(each.getB_price());
					manage.setMa_b_date(each.getB_date());
					manage.setMa_di_num(each.getB_di_num());
					buyYesMemList.add(manage);
				}
			}
		}
		
		// 결제 대기 리스트 (WAIT)
		ArrayList<ManageBean> buyWaitMemList = new ArrayList<>();
		if(buyList != null) {
			for(BuyBean each : buyList) {
				if(each.getB_status().equals("WAIT")) {
					ManageBean manage = new ManageBean();
					manage.setMa_b_num(each.getB_num());
					MemberBean mem = memService.showMember(each.getB_m_num());
					if(mem != null) {
						manage.setMa_m_name(mem.getM_name());
					}
					Deal_Info di = dealService.selectDIOne(each.getB_di_num());
					if(di != null) {
						manage.setMa_di_category(di.getDi_category());
					}
					manage.setMa_di_name(each.getB_di_name());
					List<BuyDetailBean> buyDetailList = buyService.buyDetailList(each.getB_num());
					if(!buyDetailList.isEmpty()) {
						manage.setBuyDetail(buyDetailList);
					}
					manage.setMa_b_price(each.getB_price());
					manage.setMa_b_date(each.getB_date());
					manage.setMa_di_num(each.getB_di_num());
					buyWaitMemList.add(manage);
				}		
			}
		}
		
		// 구매 진행중 리스트 (ING)
		ArrayList<ManageBean> buyIngMemList = new ArrayList<>();
		if(buyList != null) {
			for(BuyBean each : buyList) {
				if(each.getB_status().equals("ING")) {
					ManageBean manage = new ManageBean();
					manage.setMa_b_num(each.getB_num());
					MemberBean mem = memService.showMember(each.getB_m_num());
					if(mem != null) {
						manage.setMa_m_name(mem.getM_name());
					}
					Deal_Info di = dealService.selectDIOne(each.getB_di_num());
					if(di != null) {
						manage.setMa_di_category(di.getDi_category());
					}
					manage.setMa_di_name(each.getB_di_name());
					List<BuyDetailBean> buyDetailList = buyService.buyDetailList(each.getB_num());
					if(!buyDetailList.isEmpty()) {
						manage.setBuyDetail(buyDetailList);
					}
					manage.setMa_b_price(each.getB_price());
					manage.setMa_b_date(each.getB_date());
					manage.setMa_di_num(each.getB_di_num());
					buyIngMemList.add(manage);
				}		
			}
		}
		
		// 구매 취소 리스트 (NO)
		ArrayList<ManageBean> buyNoMemList = new ArrayList<>();
		if(buyList != null) {
			for(BuyBean each : buyList) {
				if(each.getB_status().equals("NO")) {
					ManageBean manage = new ManageBean();
					manage.setMa_b_num(each.getB_num());
					MemberBean mem = memService.showMember(each.getB_m_num());
					if(mem != null) {
						manage.setMa_m_name(mem.getM_name());
					}
					Deal_Info di = dealService.selectDIOne(each.getB_di_num());
					if(di != null) {
						manage.setMa_di_category(di.getDi_category());
					}
					manage.setMa_di_name(each.getB_di_name());
					List<BuyDetailBean> buyDetailList = buyService.buyDetailList(each.getB_num());
					if(!buyDetailList.isEmpty()) {
						manage.setBuyDetail(buyDetailList);
					}
					manage.setMa_b_price(each.getB_price());
					manage.setMa_b_date(each.getB_date());
					manage.setMa_di_num(each.getB_di_num());
					buyNoMemList.add(manage);
				}
			}
		}
		
		ModelAndView mav = new ModelAndView();
		
//		System.out.println("totalAdminSales : " + totalAdminSales);
//		System.out.println("yearAdminSales : " + yearAdminSales);
//		System.out.println("monthAdminSales : " + monthAdminSales);
//		System.out.println("dayAdminSales : " + dayAdminSales);
//		System.out.println("buyList : " + buyList.size());
//		System.out.println("buyYesMemList : " + buyYesMemList.size());
//		System.out.println("buyWaitMemList : " + buyWaitMemList.size());
//		System.out.println("buyIngMemList : " + buyIngMemList.size());
//		System.out.println("buyNoMemList : " + buyNoMemList.size());
		
		mav.addObject("totalAdminSales", totalAdminSales);
		mav.addObject("yearAdminSales", yearAdminSales);
		mav.addObject("monthAdminSales", monthAdminSales);
		mav.addObject("dayAdminSales", dayAdminSales);
		mav.addObject("buyList", buyList);
		mav.addObject("buyYesMemList", buyYesMemList);
		mav.addObject("buyWaitMemList", buyWaitMemList);
		mav.addObject("buyIngMemList", buyIngMemList);
		mav.addObject("buyNoMemList", buyNoMemList);
		
		mav.addObject("center", centerPath + "adminSalesManagement.jsp");
		mav.setViewName("home");
		return mav;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//	========================================================================
//	=================================================================================
//	관리자 자주하는질문(신정훈)
	
	@RequestMapping("adminMemo")
	public ModelAndView adminMemo(PageDTO pageDTO){
		
		ModelAndView mav = new ModelAndView();
		List<MemberBean> memoList = service.getMemMemo(pageDTO);
		
		SimpleDateFormat sdf2;
		
		sdf2 = new SimpleDateFormat("yy년 MM월 dd일 E요일");
		
		for(MemberBean each : memoList){
			System.out.println();
			each.setM_fordate((sdf2.format(each.getM_date())));
		}
		
		mav.addObject("pageDTO",pageDTO);
		mav.addObject("memoList",memoList);
		mav.addObject("center", centerPath + "adminMemo.jsp");
		
		mav.setViewName("home");
		return mav;
		
	}
	
//	@RequestMapping("getMemMemo")
//	public ModelAndView getMemMemo(){
//		
//		ModelAndView mav = new ModelAndView();
//		
//		List<MemberBean> memoList = service.getMemMemo();
//		
//		
//		mav.addObject("memoList",memoList);
//		mav.addObject("center", centerPath + "adminMemo.jsp");
//		
//		mav.setViewName("home");
//		return mav;
//		
//	}
	
	@RequestMapping("saveMemo")
	public ModelAndView saveMemo(MemberBean mem,
			@RequestParam (value="m_memoRe",required=false)String m_memoRe,
			@RequestParam (value="m_title",required=false)String m_title,
			@RequestParam (value="m_content",required=false)String m_content
			){
		
		String reWord = "";
		String beStr = "";
		String afStr = "";
//		if(){
//			
//		}
		ModelAndView mav = new ModelAndView();
		
		MemberBean memCheck = service.getCheckMemMemo(mem);
		System.out.println(memCheck.getM_id());
//		${info.getDi_sysName().split(',')[0]}
		for(int i=0;i<memCheck.getM_memo().split("///").length ;i++){
			
			if(memCheck.getM_memo().split("///")[i].equals(",/,"+m_title+",,,"+m_content)){
				System.out.println("if="+i);
				reWord = m_memoRe+",/,"+m_title+",,,"+m_content+"///";
				System.out.println("i============="+i);
				
				System.out.println("reWord======"+reWord);
				
				for(int j=0;j<i ;j++){
					beStr += memCheck.getM_memo().split("///")[j]+"///";
					System.out.println("beStr====="+beStr);
				}
				for(int k=i+1 ; k<memCheck.getM_memo().split("///").length ;k++){
					afStr += memCheck.getM_memo().split("///")[k]+"///";
					System.out.println("afStr====="+afStr);
				}
			}
		}
		
		String total = beStr+reWord+afStr;
		mem.setM_memo(total);
		
		int res = service.insertAdminMemo(mem);
		
		System.out.println("total======"+total);
//		int res = service.saveMemo();
		
		if(res > 0){
			mav.addObject("msg","답변 등록 완료");
		}else{
			mav.addObject("msg","답변 등록 실패");
		}
		
		mav.setViewName("redirect:adminMemo");
		
		return mav;
		
	}
	
	@RequestMapping("modiRe")
	public ModelAndView ModiRe(MemberBean mem,
			@RequestParam (value="review",required=false)String review,
			@RequestParam (value="m_title",required=false)String m_title,
			@RequestParam (value="m_content",required=false)String m_content,
			@RequestParam (value="m_memoModi",required=false)String m_memoModi){
		ModelAndView mav = new ModelAndView();
		
		MemberBean memCheck = service.getCheckMemMemo(mem);
		
		String reWord = "";
		String beStr = "";
		String afStr = "";
		
		
		System.out.println(review);
		System.out.println(m_title);
		System.out.println(m_content);
		System.out.println(m_memoModi);
		
		
		for(int i=0;i<memCheck.getM_memo().split("///").length ;i++){
			
			if(memCheck.getM_memo().split("///")[i].equals(review+",/,"+m_title+",,,"+m_content)){
				System.out.println("if="+i);
				
				reWord = m_memoModi+",/,"+m_title+",,,"+m_content+"///";
				
				System.out.println("i============="+i);
				
				System.out.println("reWord======"+reWord);
				
				for(int j=0;j<i ;j++){
					beStr += memCheck.getM_memo().split("///")[j]+"///";
					System.out.println("beStr====="+beStr);
				}
				for(int k=i+1 ; k<memCheck.getM_memo().split("///").length ;k++){
					afStr += memCheck.getM_memo().split("///")[k]+"///";
					System.out.println("afStr====="+afStr);
				} 
			}
		}
		String total = beStr+reWord+afStr;
		mem.setM_memo(total);
		
		System.out.println("total=========================="+total);
		
		int res = service.insertAdminMemo(mem);
		
		if(res > 0){
			mav.addObject("msg","수정 완료");
		}else{
			mav.addObject("msg","수정 실패");
		}
		
		
		mav.setViewName("redirect:adminMemo");
		
		return mav;
	}
	
	
	@RequestMapping("delRe")
	public ModelAndView ModiRe(MemberBean mem,
			@RequestParam (value="review",required=false)String review,
			@RequestParam (value="m_title",required=false)String m_title,
			@RequestParam (value="m_content",required=false)String m_content){
		ModelAndView mav = new ModelAndView();
		String reWord = "";
		String beStr = "";
		String afStr = "";
		
		MemberBean memCheck = service.getCheckMemMemo(mem);
		
			for(int i=0;i<memCheck.getM_memo().split("///").length ;i++){
			
			if(memCheck.getM_memo().split("///")[i].equals(review+",/,"+m_title+",,,"+m_content)){
				
				reWord = ",/,"+m_title+",,,"+m_content+"///";
				
				for(int j=0;j<i ;j++){
					beStr += memCheck.getM_memo().split("///")[j]+"///";
					System.out.println("beStr====="+beStr);
				}
				for(int k=i+1 ; k<memCheck.getM_memo().split("///").length ;k++){
					afStr += memCheck.getM_memo().split("///")[k]+"///";
					System.out.println("afStr====="+afStr);
				} 
			}
		}
		
		String total = beStr+reWord+afStr;
		mem.setM_memo(total);
		
		System.out.println("total=========================="+total);
		
		int res = service.insertAdminMemo(mem);
		
		if(res > 0){
			mav.addObject("msg","답변 삭제 완료");
		}else{
			mav.addObject("msg","답변 삭제 실패");
		}
		
		mav.setViewName("redirect:adminMemo");
		
		return mav;
	}
	
	@RequestMapping("delQnA2")
	public ModelAndView ModiRe2(MemberBean mem,
			@RequestParam (value="m_title",required=false)String m_title,
			@RequestParam (value="m_content",required=false)String m_content){
		ModelAndView mav = new ModelAndView();
		String reWord = "";
		String beStr = "";
		String afStr = "";
		String total = "";
		MemberBean memCheck = service.getCheckMemMemo(mem);
		if((memCheck.getM_memo().split("///").length) != 1 ){
			
				for(int i=0;i<memCheck.getM_memo().split("///").length ;i++){
				
				if(memCheck.getM_memo().split("///")[i].equals(",/,"+m_title+",,,"+m_content)){
					
					reWord = "";
					
					for(int j=0;j<i ;j++){
						beStr += memCheck.getM_memo().split("///")[j]+"///";
						System.out.println("beStr====="+beStr);
					}
					for(int k=i+1 ; k<memCheck.getM_memo().split("///").length ;k++){
						afStr += memCheck.getM_memo().split("///")[k]+"///";
						System.out.println("afStr====="+afStr);
					} 
				}
			}
				total = beStr+reWord+afStr;
				
		}
		
		mem.setM_memo(total);
		
		int res = service.insertAdminMemo(mem);
		
		if(res > 0){
			mav.addObject("msg","답변 삭제 완료");
		}else{
			mav.addObject("msg","답변 삭제 실패");
		}
		
		mav.setViewName("redirect:adminMemo");
		
		return mav;
	}
	
	
	
	
	@RequestMapping("delQnARe")
	public ModelAndView delQnARe(MemberBean mem,
			@RequestParam (value="review",required=false)String review,
			@RequestParam (value="m_title",required=false)String m_title,
			@RequestParam (value="m_content",required=false)String m_content){
		ModelAndView mav = new ModelAndView();
		String reWord = "";
		String beStr = "";
		String afStr = "";
		String total="";
		MemberBean memCheck = service.getCheckMemMemo(mem);
		
		if((memCheck.getM_memo().split("///").length) != 1 ){
			
		
				for(int i=0;i<memCheck.getM_memo().split("///").length ;i++){
				
					
				if(memCheck.getM_memo().split("///")[i].equals(review+",/,"+m_title+",,,"+m_content)){
					
					reWord = "";
					
					for(int j=0;j<i ;j++){
						beStr += memCheck.getM_memo().split("///")[j]+"///";
						System.out.println("beStr====="+beStr);
					}
					for(int k=i+1 ; k<memCheck.getM_memo().split("///").length ;k++){
						afStr += memCheck.getM_memo().split("///")[k]+"///";
						System.out.println("afStr====="+afStr);
					} 
				}
			}
				System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
				total = beStr+reWord+afStr;
				
		}
		mem.setM_memo(total);
		
		System.out.println("total=========================="+total);
		
		int res = service.insertAdminMemo(mem);
		
		if(res > 0){
			mav.addObject("msg","질문 삭제 완료");
		}else{
			mav.addObject("msg","질문 삭제 실패");
		}
		
		mav.setViewName("redirect:adminMemo");
		
		return mav;
	}
	
	@RequestMapping("showDealDetail")
	public ModelAndView showDealDetail(@RequestParam("di_num") Integer di_num) {
		
		Deal_Info di = dealService.selectDIOne(di_num);
		System.out.println("di : " + di.getDi_num());
		CorpBean co = corpService.getCorpInfoOne(di.getDi_c_num());
		System.out.println("co : " + co.getC_num());
		List<Deal_Detail> dd = dealService.selectDDList(di_num);
		System.out.println(dd.get(0).getDd_kind());
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("di", di);
		mav.addObject("co", co);
		mav.addObject("dd", dd);
		mav.setViewName("/adminPage/center/showDealDetail");
		return mav;
	}
	
}// (Controller) class END
