package spring.mvc.aaa.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;

import spring.mvc.aaa.bean.BuyBean;
import spring.mvc.aaa.bean.BuyDetailBean;
import spring.mvc.aaa.bean.Corp;
import spring.mvc.aaa.bean.CorpBean;
import spring.mvc.aaa.bean.CorpSellingBean;
import spring.mvc.aaa.bean.DealQnaBean;
import spring.mvc.aaa.bean.Deal_Detail;
import spring.mvc.aaa.bean.Deal_Info;
import spring.mvc.aaa.bean.MemberBean;
import spring.mvc.aaa.bean.ReviewBean;
import spring.mvc.aaa.bean.mapperBean;
import spring.mvc.aaa.module.FileWorks;
import spring.mvc.aaa.service.BuyService;
import spring.mvc.aaa.service.CorpService;
import spring.mvc.aaa.service.DealService;
import spring.mvc.aaa.service.LocalService;
import spring.mvc.aaa.service.MemberService;
import spring.mvc.aaa.service.ReviewService;

@Controller
@RequestMapping("/idvCorp/")
public class IndividualCorpController {
	
	@Autowired
	private FileWorks fileWorks;
	
	@Autowired
	private CorpService corpService;
	
	@Autowired
	private DealService dealService;
	
	@Autowired
	private BuyService buyService;
	
	@Autowired
	private MemberService memService;
	
	@Autowired
	private LocalService localService;
	
	@Autowired
	private ReviewService reviewService;
	
//	[기업 개인페이지 홈 경로]
	private String corpHome = "/corpPage/individual/corpHome";
	
//	[기업 개인페이지 경로]
	private String corpTopPath = "/WEB-INF/views/corpPage/individual/top/";
	private String corpCenterPath = "/WEB-INF/views/corpPage/individual/center/";
	private String corpLeftPath = "/WEB-INF/views/corpPage/individual/left/";
	
	
	@RequestMapping("/corpHome")
	public ModelAndView corpHome(HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
			
		Corp corp = (Corp) session.getAttribute("corpLogin");
			
		List<Deal_Info> myDealList = dealService.showDealListAll(corp.getC_num());
			
		mav.addObject("myDealList", myDealList);
		mav.addObject("corpTop", "/WEB-INF/views/corpPage/individual/top/corpTopIndex.jsp");
		mav.addObject("corpCenter", corpCenterPath + "showDealListAll.jsp");
		mav.addObject("corpLeft", "/WEB-INF/views/corpPage/individual/left/corpLeftIndex.jsp");
		
		mav.setViewName(corpHome);
		return mav;
	}
	
//	[딜 신청하기 폼으로 이동]
	@RequestMapping(value = "/dealInsert", method = RequestMethod.GET)
	public ModelAndView corpLog() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("corpCenter", corpCenterPath + "dealInsert.jsp");

		mav.setViewName(corpHome);
		return mav;
	}
	
//	[딜 신청하기]
	@RequestMapping("/dealSuccess")
	public ModelAndView administrator(MultipartHttpServletRequest multiRequest) {

		ModelAndView mav = new ModelAndView();

		String di_name = multiRequest.getParameter("name");
		String di_category = multiRequest.getParameter("category");
		String di_exp = multiRequest.getParameter("exp");
		int di_price = Integer.parseInt(multiRequest.getParameter("price"));
		int di_c_num = Integer.parseInt(multiRequest.getParameter("num"));
		
		System.out.println("di_name : " + di_name);
		System.out.println("di_category : " + di_category);
		System.out.println("di_Exp : " + di_exp);
		System.out.println("di_price : " + di_price);
		System.out.println("di_c_num : " + di_c_num);
		
		String di_orgName = "";
		String di_sysName = "";
		Map<String, MultipartFile> fileMap = multiRequest.getFileMap();

		Set<String> keys = fileMap.keySet();
		for (String key : keys) {
			MultipartFile upfileContents = fileMap.get(key);
			di_orgName += upfileContents.getOriginalFilename();
			di_sysName += fileWorks.upLoadAndGetSysName(upfileContents) + ",";
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

		Map<String, String> paramMap = multiRequest.getParameterMap();
		for (String paramName : paramMap.keySet()) {
			String paramValue = multiRequest.getParameter(paramName);
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
			listc.add(dd);
			dd = null;
		}
		int res1 = corpService.dealInfo(info);
		if (res1 >= listc.size()) {
			mav.addObject("msg", " 관리자에게 요청완료1");
		} else {
			mav.addObject("msg", " 관리자에게 요청실패1");
		}
		int res = corpService.dealInsert(listc);
		if (res >= listc.size()) {
			mav.addObject("msg", " 관리자에게 요청완료");
		} else {
			mav.addObject("msg", " 관리자에게 요청실패");
		}

		mav.setViewName(corpHome);
		return mav;
	}
	
//	[나의 딜 보기(모아보기)]
	@RequestMapping("showDealListAll")
	public ModelAndView showDealListAll(HttpSession session) {
		
		Corp corp = (Corp) session.getAttribute("corpLogin");
		
		List<Deal_Info> myDealList = dealService.showDealListAll(corp.getC_num());
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("myDealList", myDealList);
		mav.addObject("corpCenter", corpCenterPath + "showDealListAll.jsp");
		mav.setViewName(corpHome);
		return mav;
	}
	
//	[나의 딜 보기(판매중 딜)]
	@RequestMapping("showApproveDealList")
	public ModelAndView showApproveDealList(HttpSession session) {
		
		Corp corp = (Corp) session.getAttribute("corpLogin");
		mapperBean mb = new mapperBean();
		mb.setInte1(corp.getC_num());
		mb.setStr1("YES");
		List<Deal_Info> approveDealList = dealService.showStatusDealList(mb);
		ModelAndView mav = new ModelAndView();
		mav.addObject("approveDealList", approveDealList);
		mav.addObject("corpCenter", corpCenterPath + "showApproveDealList.jsp");
		mav.setViewName(corpHome);
		return mav;
	}
	
//	[나의 딜 보기(승인 대기 딜)]
	@RequestMapping("showWaitDealList")
	public ModelAndView showWaitDealList(HttpSession session) {
		
		Corp corp = (Corp) session.getAttribute("corpLogin");
		mapperBean mb = new mapperBean();
		mb.setInte1(corp.getC_num());
		mb.setStr1(null);
		System.out.println("NULL ? : " + mb.getStr1());
		List<Deal_Info> waitDealList = dealService.showStatusDealList(mb);
		ModelAndView mav = new ModelAndView();
		mav.addObject("waitDealList", waitDealList);
		mav.addObject("corpCenter", corpCenterPath + "showWaitDealList.jsp");
		mav.setViewName(corpHome);
		return mav;
	}
	
//	[나의 딜 보기(승인 취소 딜]
	@RequestMapping("showCancelDealList")
	public ModelAndView showCancelDealList(HttpSession session) {
		Corp corp = (Corp) session.getAttribute("corpLogin");
		mapperBean mb = new mapperBean();
		mb.setInte1(corp.getC_num());
		mb.setStr1("NO");
		List<Deal_Info> cancelDealList = dealService.showStatusDealList(mb);
		ModelAndView mav = new ModelAndView();
		mav.addObject("cancelDealList", cancelDealList);
		mav.addObject("corpCenter", corpCenterPath + "showCancelDealList.jsp");
		mav.setViewName(corpHome);
		return mav;
	}
//	============================================================
//	[판내현황 - 매출관리]
//	[전체매출 보기]
	@RequestMapping("showSalesAll")
	public ModelAndView showSalesAll(HttpSession session) {
		
		// 기업 정보 가져오기
		Corp corp = (Corp) session.getAttribute("corpLogin");
		System.out.println("로그인된 기업번호 : " + corp.getC_num());
		
		// 구매내역 정보 가져오기
		List<BuyBean> buyList = buyService.selectMySalesList(corp.getC_num());		
		
		System.out.println("구매내역 갯수 : " + buyList.size());
		
		// 기업 판매리스트
		ArrayList<CorpSellingBean> corpSelList = new ArrayList<>();
		if(!buyList.isEmpty()) {
			for(BuyBean each : buyList) {
				Deal_Info di = dealService.selectDIOne(each.getB_di_num());
//				System.out.println("카테고리 : " + di.getDi_category());
				if(di != null) {
					CorpSellingBean cs = new CorpSellingBean();
					cs.setCs_b_num(each.getB_num());
					cs.setCs_di_category(di.getDi_category());
					cs.setCs_di_name(di.getDi_name());
					List<BuyDetailBean> bdb = dealService.selectBuyDetailList(each.getB_num());
					if(!bdb.isEmpty()) {
						cs.setBuyDetail(bdb);
					}
					cs.setCs_b_status(each.getB_status());
					cs.setCs_b_price(each.getB_price());
					cs.setCs_b_date(each.getB_date());
					corpSelList.add(cs);
				}
			}
		}
		
		// 총 매출 구하기
		Integer totalSales = 0;
		if(!buyList.isEmpty()) {
			for(BuyBean each : buyList) {
				if(corp.getC_grade() == 6) {
					totalSales += (int)(each.getB_price() * 0.85);
				} else if(corp.getC_grade() == 5) {
					totalSales += (int)(each.getB_price() * 0.86);
				} else if(corp.getC_grade() == 4) {
					totalSales += (int)(each.getB_price() * 0.87);
				} else if(corp.getC_grade() == 3) {
					totalSales += (int)(each.getB_price() * 0.88);
				} else if(corp.getC_grade() == 2) {
					totalSales += (int)(each.getB_price() * 0.89);
				} else if(corp.getC_grade() == 1) {
					totalSales += (int)(each.getB_price() * 0.90);
				}
			}
		}
		corp.setC_sellingprice(totalSales);
		
		SimpleDateFormat sdfYear = new SimpleDateFormat("yy");
		SimpleDateFormat sdfMonth = new SimpleDateFormat("MM");
		SimpleDateFormat sdfDay = new SimpleDateFormat("dd");
		String thisYear = sdfYear.format(new Date());
		String thisMonth = sdfMonth.format(new Date());
		String thisDay = sdfDay.format(new Date());
		
		System.out.println("년 : " + thisYear);
		System.out.println("월 : " + thisMonth);
		System.out.println("일 : " + thisDay);
		
		
		// 이번 년도 매출 구하기
		Integer yearSales = 0;
		if(!buyList.isEmpty()) {
			for(BuyBean each : buyList) {
				if(each.getB_date_string().split("/")[0].equals(thisYear)) {
					if(corp.getC_grade() == 6) {
						yearSales += (int)(each.getB_price() * 0.85);
					} else if(corp.getC_grade() == 5) {
						yearSales += (int)(each.getB_price() * 0.86);
					} else if(corp.getC_grade() == 4) {
						yearSales += (int)(each.getB_price() * 0.87);
					} else if(corp.getC_grade() == 3) {
						yearSales += (int)(each.getB_price() * 0.88);
					} else if(corp.getC_grade() == 2) {
						yearSales += (int)(each.getB_price() * 0.89);
					} else if(corp.getC_grade() == 1) {
						yearSales += (int)(each.getB_price() * 0.90);
					}
				}
			}
		}
		
		// 이번 달 매출 구하기
		Integer monthSales = 0;
		if(!buyList.isEmpty()) {
			for(BuyBean each : buyList) {
				if(each.getB_date_string().split("/")[0].equals(thisYear)) {
					if(each.getB_date_string().split("/")[1].equals(thisMonth)) {
						if(corp.getC_grade() == 6) {
							monthSales += (int)(each.getB_price() * 0.85);
						} else if(corp.getC_grade() == 5) {
							monthSales += (int)(each.getB_price() * 0.86);
						} else if(corp.getC_grade() == 4) {
							monthSales += (int)(each.getB_price() * 0.87);
						} else if(corp.getC_grade() == 3) {
							monthSales += (int)(each.getB_price() * 0.88);
						} else if(corp.getC_grade() == 2) {
							monthSales += (int)(each.getB_price() * 0.89);
						} else if(corp.getC_grade() == 1) {
							monthSales += (int)(each.getB_price() * 0.90);
						}
					}
				}
			}
		}
		// 금일 매출 구하기
		Integer daySales = 0;
		if(!buyList.isEmpty()) {
			for(BuyBean each : buyList) {
				if(each.getB_date_string().split("/")[0].equals(thisYear)) {
					if(each.getB_date_string().split("/")[1].equals(thisMonth)) {
						if(each.getB_date_string().split("/")[2].equals(thisDay)) {
							if(corp.getC_grade() == 6) {
								daySales += (int)(each.getB_price() * 0.85);
							} else if(corp.getC_grade() == 5) {
								daySales += (int)(each.getB_price() * 0.86);
							} else if(corp.getC_grade() == 4) {
								daySales += (int)(each.getB_price() * 0.87);
							} else if(corp.getC_grade() == 3) {
								daySales += (int)(each.getB_price() * 0.88);
							} else if(corp.getC_grade() == 2) {
								daySales += (int)(each.getB_price() * 0.89);
							} else if(corp.getC_grade() == 1) {
								daySales += (int)(each.getB_price() * 0.90);
							}
						}
					}
				}
			}
		}
		
		System.out.println("총 매출 : " + corp.getC_sellingprice());
		System.out.println("이번년도 매출 : " + yearSales);
		System.out.println("이번달 매출 : " + monthSales);
		System.out.println("금일 매출 : " + daySales);
		System.out.println("판매리스트 갯수 : " + corpSelList.size());
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("totalSales", corp.getC_sellingprice());
		mav.addObject("yearSales", yearSales);
		mav.addObject("monthSales", monthSales);
		mav.addObject("daySales", daySales);
		mav.addObject("corpSelList", corpSelList);
		mav.addObject("corpCenter", corpCenterPath + "showSalesAll.jsp");
		mav.setViewName(corpHome);
		return mav;
	}
	
//	====================================================================
//	[구매 고객 리스트]
	@RequestMapping("memBuyListManagement")
	public ModelAndView memBuyListManagement(HttpSession session) {
		
		// 기업 정보 가져오기
		Corp corp = (Corp) session.getAttribute("corpLogin");
		System.out.println("로그인된 기업번호 : " + corp.getC_num());
		
		// 총 거래리스트
		List<BuyBean> buyList = buyService.selectMySalesList(corp.getC_num());		
		
		String YES = "YES";
		String NO = "NO";
		String WAIT = "WAIT";
		String ING = "ING";
		mapperBean mb = new mapperBean();
		// 거래 완료 목록
		mb.setInte1(corp.getC_num());
		mb.setStr1(YES);
		List<BuyBean> finishedDealingList = buyService.selectBuyListStatus(mb);
		System.out.println("거래 완료 목록 : " + finishedDealingList.size());
		// 거래 취소 목록
		mb.setStr1(NO);
		List<BuyBean> canceledDealingList = buyService.selectBuyListStatus(mb);
		System.out.println("거래 취소 목록 : " + canceledDealingList.size());
		// 거래 요청 목록
		mb.setStr1(WAIT);
		List<BuyBean> waitingDealingList = buyService.selectBuyListStatus(mb);
		System.out.println("거래 요청 목록 : " + waitingDealingList.size());
		// 거래 진행중 목록
		mb.setStr1(ING);
		List<BuyBean> continueDealingList = buyService.selectBuyListStatus(mb);
		System.out.println("거래 진행중 목록 : " + continueDealingList.size());
		
		
		Date finalStatus = buyService.finalStatus();
		
		// 현재 기업이 보유한 딜을 구매한 고객 리스트
		ArrayList<CorpSellingBean> memBuyList = new ArrayList<>();
		if(!buyList.isEmpty()) {
			for(BuyBean each : buyList) {
				Deal_Info di = dealService.selectDIOne(each.getB_di_num());
				if(di != null) {
					CorpSellingBean cs = new CorpSellingBean();
					cs.setCs_b_num(each.getB_num());
					cs.setCs_di_category(di.getDi_category());
					cs.setCs_di_name(di.getDi_name());
					List<BuyDetailBean> buyDetail = dealService.selectBuyDetailList(each.getB_num());
					if(!buyDetail.isEmpty()) {
						cs.setBuyDetail(buyDetail);
					}
					cs.setCs_b_status(each.getB_status());
					cs.setCs_b_price(each.getB_price());
					cs.setCs_b_date(each.getB_date());
					if(cs.getCs_b_status().equals("YES") || cs.getCs_b_status().equals("NO")) {
						cs.setCs_final_date(finalStatus);
					}
					memBuyList.add(cs);
				}
			}
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("buyList", buyList);
		mav.addObject("memBuyList", memBuyList);
		mav.addObject("finishedDealingList", finishedDealingList);
		mav.addObject("canceledDealingList", canceledDealingList);
		mav.addObject("waitingDealingList", waitingDealingList);
		mav.addObject("continueDealingList", continueDealingList);
		mav.addObject("corpCenter", corpCenterPath + "memBuyListManagement.jsp");
		mav.setViewName(corpHome);
		return mav;
	}
	
	// 상세보기 PopUp
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
		mav.setViewName("/corpPage/individual/center/showDealDetail");
		return mav;
	}
	
	// 구매상태 변경을 위한 PopUp
		@RequestMapping("changeBuyStatus")
		public ModelAndView changeBuyStatus(@RequestParam("b_num") Integer b_num) {
			ModelAndView mav = new ModelAndView();
			mav.addObject("b_num", b_num);
			System.out.println("b_num : "+b_num);
			BuyBean buy = buyService.buyOne(b_num);
			MemberBean mem = memService.showMember(buy.getB_m_num());
			mav.addObject("buy", buy);
			System.out.println("buy.getB_price() : " +buy.getB_price());
			mav.addObject("mem", mem);
			System.out.println("mem.getM_point() : " + mem.getM_point());
			mav.setViewName("/corpPage/individual/center/changeBuyStatus");
			return mav;
		}
		
		// 구매상태 변경처리
		@RequestMapping("chooseStatus")
		public String chooseStatus(@RequestParam("b_num") Integer b_num,
									@RequestParam("b_status") String buyStatus) {
			
			mapperBean mb = new mapperBean();
			mb.setInte1(b_num);
			mb.setStr1(buyStatus);
			int res = buyService.chooseStatus(mb);
			
			System.out.println(res > 0 ? "구매상태 변경 성공" : "구매상태 변경 실패");
			return "redirect:memBuyListManagement";
		}
		
		@RequestMapping("chooseStatusTwo")
		public String chooseStatusTwo(@RequestParam("b_num") Integer b_num,
									@RequestParam("b_status") String buyStatus,@RequestParam("m_num") int m_num,
									@RequestParam("point") int point) {
			
			mapperBean mb = new mapperBean();
			mb.setInte1(b_num);
			mb.setStr1(buyStatus);
			int res = buyService.chooseStatus(mb);
			System.out.println("m_num : "+m_num);
			System.out.println("point : "+point);
			MemberBean mem = new MemberBean(m_num, point);
			int memUpdate = memService.updatememPoint(mem);
			if (memUpdate > 0) {
				System.out.println("member point 감소 및 쌓기 성공");
			} else {
				System.out.println("member point 수정 실패");
			}

			System.out.println(res > 0 ? "구매상태 변경 성공" : "구매상태 변경 실패");
			return "redirect:memBuyListManagement";
		}
		
	
//	[딜 수정하기]
	@RequestMapping("goDealModifyPage")
	public ModelAndView goDealModifyPage(HttpSession session) {
		
		Corp corp = (Corp) session.getAttribute("corpLogin");
		
		List<Deal_Info> myDealList = dealService.showDealListAll(corp.getC_num());
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("myDealList", myDealList);
		mav.addObject("corpCenter", corpCenterPath + "dealModify.jsp");
		mav.setViewName(corpHome);
		return mav;
	}
	
//	[딜 수량 수정 선택페이지로 이동]
	
	@RequestMapping("modifyAmount")
	public ModelAndView modifyAmount(@RequestParam("di_num") Integer di_num) {
		
		List<Deal_Detail> detailList = dealService.selectDDList(di_num);
		ModelAndView mav = new ModelAndView();
		if(!detailList.isEmpty()) {
			mav.addObject("detailList", detailList);
		}
		mav.addObject("corpCenter", corpCenterPath + "modifyAmount.jsp");
		mav.setViewName(corpHome);
		return mav;
	}
	
//	[딜 수량 수정 후 DataBase수정 작업]
	@RequestMapping(value="detailAmountModify", produces="text/plain; charset=UTF-8")
	@ResponseBody
	public String detailAmountModify(@RequestParam(value="di_num", required=false) Integer di_num,
										@RequestParam(value="infos", required=false) String infos) {
		System.out.println("di_num : " + di_num);
		System.out.println("infos : "+infos);
//		if(infos.equals(""))
		String[] dds = infos.split("-");
		int res = 0;
		if(di_num != null) {
			for(int i=0;i<dds.length;i++){
				if(dds[i]!=""){
					System.out.println("dds[i] : "+dds[i]);
					String[] ddsa = dds[i].split(",");
					res += dealService.updateAmount(Integer.parseInt(ddsa[0]),Integer.parseInt(ddsa[1]));
					System.out.println("res : "+res);
				}
			}
		}
		String msg = res==dds.length ? "수정 완료." : "수정 오류.";
		
		return msg;
	}
	
	
//	[딜 삭제하기페이지로 gogo]
	@RequestMapping("dealDelete")
	public ModelAndView dealDelete(HttpSession session) {
		
		Corp corp = (Corp) session.getAttribute("corpLogin");
		
		List<Deal_Info> myDealList = dealService.showDealListAll(corp.getC_num());
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("myDealList", myDealList);
		mav.addObject("corpCenter", corpCenterPath + "dealDelete.jsp");
		mav.setViewName(corpHome);
		return mav;
	}
	
//	[딜 삭제확인 팝업]
	@RequestMapping("deleteDealCheck")
	public ModelAndView deleteDealCheck(@RequestParam("di_num") Integer di_num) {
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("di_num", di_num);
		mav.setViewName("/corpPage/individual/center/deleteDealCheck");
		return mav;
	}
	
//	[딜 삭제 진행]
	@RequestMapping(value="dealDeleteOk", produces="text/plain; charset=UTF-8")
	@ResponseBody
	public String dealDeleteOk(HttpSession session, 
								@RequestParam(value="c_pw", required=false) String c_pw,
								@RequestParam(value="di_num", required=false) Integer di_num) {
		String msg = null;
		if(c_pw != null && di_num != null) {
			Corp corp = (Corp) session.getAttribute("corpLogin");
			if(corp.getC_pw().equals(c_pw)) {
				System.out.println(di_num);
				int resDealDetail = dealService.deleteDealDetailAll(di_num);	
				System.out.println("BB");
				if (resDealDetail > 0) {
					System.out.println("CC");
					int resDealInfo = dealService.deleteDealInfo(di_num);
					System.out.println("DD");
					msg = resDealInfo > 0 ? "정삭적으로 삭제되었습니다." : "삭제 실패하였습니다.";
				} else {
					msg = "삭제가 정상적으로 이루어 지지 않았습니다. <br> 관리자에게 문의하세요.";
				}
			} else {
				msg = "비밀번호가 일치하지 않습니다.";
			}
		} else {
			msg = "입력 값이 없습니다.";
		}
		return msg;
	}
	
	
//	[기업회원탈퇴 페이지로 gogo]
	@RequestMapping("corpDelete")
	public ModelAndView corpDelete() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("corpCenter", corpCenterPath + "corpDelete.jsp");
		mav.setViewName(corpHome);
		return mav;
	}
	
//	[기업회원 탈퇴 정보 확인 작업]
	@RequestMapping(value="deleteCorpCheck", produces="text/plain; charset=UTF-8")
	@ResponseBody
	public String deleteCorpCheck(HttpSession session, @RequestParam(value="c_pw", required=false) String c_pw, 
										@RequestParam(value="c_ceo", required=false) String c_ceo) {
		if(c_pw != null && c_ceo != null) {
			Corp corp = (Corp) session.getAttribute("corpLogin");
			if(corp.getC_pw().equals(c_pw)) {
				if(corp.getC_ceo().equals(c_ceo)) {
					List<Deal_Info> diList = dealService.showDealListAll(corp.getC_num());
					if(!diList.isEmpty()) {
						for(Deal_Info each : diList) {
							int res = dealService.deleteDealDetailAll(each.getDi_num());
							if(res > 0) {
								System.out.println("딜 상세 삭제 성공");
							} else {
								System.out.println("딜 상세 삭제 실패");
							}
						}
					}
					int res = dealService.deleteDealInfoAll(corp.getC_num());
					if(res > 0) {
						System.out.println("딜 정보 삭제 성공");
					} else {
						System.out.println("딜 정보 삭제 실패");
					}
					return "정보가 올바르게 삭제되었습니다.";
				} else {
					return "대표자 정보가 일치하지 않습니다.";
				}
			} else {
				return "비밀번호가 일치하지 않습니다.";
			}
		} else {
			return "입력 값이 없습니다.";
		}
	}
	
//	[기업 정보 수정 페이지 이동]
	@RequestMapping("corpModifyPwCheck")
	public ModelAndView corpModifyPwCheck() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("corpCenter", corpCenterPath + "corpModifyPwCheck.jsp");
		mav.setViewName(corpHome);
		return mav;
	}
	
//	[기업 정보 비밀번호 체크]
	@RequestMapping(value="modifyGo", produces="text/plain; charset=UTF-8")
	@ResponseBody
	public String modifyGo(HttpSession session, @RequestParam(value="c_pw") String c_pw) {
		Corp corp = (Corp) session.getAttribute("corpLogin");
		String msg = null;
		if(corp.getC_pw().equals(c_pw)) {
			msg = "정보 수정 페이지로 이동합니다.";
		} else {
			msg = "비밀번호가 일치하지 않습니다.";
		}
		return msg;
	}
	
//	[기업회원 수정 하기 페이지 이동]
	@RequestMapping("modifyCorpPage")
	public ModelAndView modifyCorpPage() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("corpCenter", corpCenterPath + "corpModify.jsp");
		mav.setViewName(corpHome);
		return mav;
	}
	
//	[기업회원 수정 정보 확인 작업]
	@RequestMapping(value="modifyCorp", produces="text/plain; charset=UTF-8")
	@ResponseBody
	public String modifyCorp(HttpSession session, @RequestParam(value="c_ceo") String c_ceo,
													@RequestParam(value="c_pw") String c_pw, 
													@RequestParam(value="c_tel") String c_tel, 
													@RequestParam(value="c_phone") String c_phone, 
													@RequestParam(value="c_addr") String c_addr) {
		
		Corp corp = (Corp) session.getAttribute("corpLogin");
		mapperBean modiCorp = new mapperBean();
		modiCorp.setInte1(corp.getC_num());
		modiCorp.setStr2(c_ceo);
		modiCorp.setStr3(c_pw);
		modiCorp.setStr4(c_tel);
		modiCorp.setStr5(c_phone);
		modiCorp.setStr6(c_addr);
		
		int res = corpService.modifyCorp(modiCorp);
		if(res > 0) {
			return "정보가 성공적으로 수정되었습니다.";
		} else {
			return "수정에 실패하였습니다. 관리자에게 문의해주세요.";
		}
	}
///////////////////////////////////////////0324
//	[기업 회원 상품문의 딜리스트 페이지 gogo]
	@RequestMapping("dealQnAList")
	public ModelAndView dealQnAList(HttpSession session){
		ModelAndView mav = new ModelAndView();
		Integer corpNum = ((Corp)session.getAttribute("corpLogin")).getC_num();
		System.out.println("corpNum : "+corpNum);
		List<Deal_Info> diList = dealService.showDealListAll(corpNum);
		mav.addObject("diList", diList);
		List<mapperBean> DQCountList = dealService.countDQList(corpNum);
		mav.addObject("DQCountList",DQCountList);
		mav.addObject("corpCenter", corpCenterPath + "dealQnAList.jsp");
		mav.setViewName(corpHome);
		return mav;
	}

//	[기업 회원 해당상품 문의 리스트 페이지 gogo]
	@RequestMapping("dealQnA")
	public ModelAndView dealQnAList(HttpSession session,Integer num){
		ModelAndView mav = new ModelAndView();
		//Integer corpNum = ((Corp)session.getAttribute("corpLogin")).getC_num();
		List<DealQnaBean> dqList = dealService.selectCorpDQList(num);
		mav.addObject("dqList", dqList);
		Deal_Info di = dealService.selectDIOne(num);
		mav.addObject("di", di);
		mav.addObject("corpCenter", corpCenterPath + "dealQnA.jsp");
		mav.setViewName(corpHome);
		
		return mav;
	}

//	[기업회원 상품문의 해당질문 팝업]
	@RequestMapping("DQAnsPop")
	public ModelAndView DQAnsForm(@RequestParam("dqnum")String dqnum){
		ModelAndView mav = new ModelAndView();
		System.out.println(dqnum);
		DealQnaBean dq = dealService.selectDQOne(Integer.parseInt(dqnum));
		mav.addObject("dq", dq);
		mav.addObject("di", dealService.selectDIOne(dq.getDq_di_num()));
		mav.setViewName("/corpPage/individual/center/DQAnsPop");
		return mav;
	}

//	[기업회원 상품 문의 질문 답변 등록]
	@RequestMapping(value="DQAnsInsert",produces="text/plain; charset=UTF-8")
	@ResponseBody
	public String DQAnsInsert(String answer,Integer dqnum){
		return dealService.insertDQAns(dqnum,answer)>0 ? "답변 완료" : "답변 실패";		
	}

////////////////////////////////////////////////////////////0327

	@RequestMapping("dealReviewList")
	public ModelAndView dealReviewList(HttpSession session){
	ModelAndView mav = new ModelAndView();
	Integer corpNum = ((Corp)session.getAttribute("corpLogin")).getC_num();
	//System.out.println("corpNum : "+corpNum);
	List<Deal_Info> diList = dealService.showDealListAll(corpNum);
	mav.addObject("diList", diList);
	List<mapperBean> DRCountList = dealService.countDRList(corpNum);
	mav.addObject("DRCountList",DRCountList);
	mav.addObject("corpCenter", corpCenterPath + "dealReviewList.jsp");
	mav.setViewName(corpHome);
	
	return mav;
	}

	@RequestMapping("dealReviewManagement")
	public ModelAndView dealReview(HttpSession session, Integer num){
		ModelAndView mav = new ModelAndView();
		Integer corpNum = ((Corp)session.getAttribute("corpLogin")).getC_num();
		List<ReviewBean> DIReviewList = dealService.selectDealReview(num);
		mav.addObject("drList", DIReviewList);
		Deal_Info di = dealService.selectDIOne(num);
		mav.addObject("di", di);
		List<ReviewBean> drList = dealService.selectDealReview(num);
		mav.addObject("drList",drList);
		mav.addObject("corpCenter",corpCenterPath+"dealReviewManagement.jsp");
		mav.setViewName(corpHome);
		return mav;
	}


	@RequestMapping(value="delReview",produces="text/plain; charset=UTF-8")
	@ResponseBody
	public String delReview(Integer dr_num){
		return ((dealService.delReview(dr_num)>0 ? "리뷰 삭제 완료" : "리뷰 삭제 실패")+","+dr_num);
	}

	@RequestMapping("/AllLocal")
	public ModelAndView AllLocal(@RequestParam("num") int num, HttpSession session){
		ModelAndView mav =new ModelAndView();
		Deal_Info info = localService.AllLocal2(num);
		mav.addObject("di", info);
		List<Deal_Detail> detail = localService.AllLocal(num);
		System.out.println("넘어온 num "+num);
		mav.addObject("corpCenter", "/WEB-INF/views/dealPage/detail.jsp");
		mav.addObject("ddList", detail);
		
//		[후기정보넘겨주기]
		List<ReviewBean> reviewList = reviewService.reviewList(num);
		
//		[후기정보담아서 보내기]
		mav.addObject("reviewList", reviewList);
		
		ArrayList<Deal_Info> recent = (ArrayList<Deal_Info>)session.getAttribute("recent");
		HashMap<Integer, Deal_Info> arrange = new HashMap<>();
		int nn = 1;
		ArrayList<Deal_Info> newRecent = new ArrayList<>();
		arrange.put(nn++, info);
		if(recent!=null){
			for(Deal_Info each : recent){
				if(info.getDi_num()!=each.getDi_num()){System.out.println("nn : " + nn);
					arrange.put(nn++, each);System.out.println("nn : " + nn);}
//				if(nn>9)	break;
			}
		}
		for(int i=1;i<nn/*<=(arrange.size()<9 ? arrange.size() : 9)*/;i++)
			newRecent.add(arrange.get(i));
		session.setAttribute("recent", newRecent);
		
		mav.setViewName(corpHome);
		return mav;
	}
	
	@RequestMapping("dealCancelMsg")
	public ModelAndView dealCancelMsg(@RequestParam("di_num") Integer di_num) {
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
		mav.setViewName("/corpPage/individual/center/dealCancelMsg");
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
		mav.setViewName("/corpPage/individual/center/showDealBuyDetail");
		return mav;
	}
	
}
