package spring.mvc.aaa.controller;

import java.text.SimpleDateFormat;
import java.time.Year;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import spring.mvc.aaa.bean.CartBean;
import spring.mvc.aaa.bean.Deal_Detail;
import spring.mvc.aaa.bean.Deal_Info;
import spring.mvc.aaa.bean.MemLogBean;
import spring.mvc.aaa.bean.MemberBean;
import spring.mvc.aaa.bean.QnaBean;
import spring.mvc.aaa.bean.mapperBean;
import spring.mvc.aaa.module.FileWorks;
import spring.mvc.aaa.service.AdminService;
import spring.mvc.aaa.service.BuyService;
import spring.mvc.aaa.service.CartService;
import spring.mvc.aaa.service.DealService;
import spring.mvc.aaa.service.MemberService;
import spring.mvc.aaa.service.NoticeService;

@Controller
@RequestMapping("/mem/")
public class MemberController {
	
	@Autowired
	private CartService cartService;
	@Autowired
	private MemberService service;
	@Autowired
	private NoticeService noService;
	@Autowired
	private BuyService buyService;
	@Autowired
	private FileWorks fileWorks;
	@Autowired
	private DealService dealService;
	
	
//	private Integer cartNum(Integer num){
//		Integer cartNum = 0;
//		cartNum = cartService.cartList(num).size();
//		return cartNum;
//	}
	
	
	private String logPath = "/WEB=INF/views/memPage/top/";
//	private String leftPath = "/WEB-INF/views/memPage/left/";
	private String centerPath = "/WEB-INF/views/memPage/center/";
//	private String rightPath = "/WEB-INF/views/memPage/right/";
	
	@RequestMapping("/home")
	public ModelAndView home() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("notice",noService.selectList());
		
		mav.setViewName("home");
		return mav;
	}
//	[로그인선택 페이지로 이동]
	@RequestMapping("login")
	public ModelAndView login() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("center", "/WEB-INF/views/yeob/center/login.jsp");
		mav.setViewName("home");
		return mav;
	}
	
//	[로그인선택 페이지로 이동]
	@RequestMapping(value="registration", method=RequestMethod.GET)
	public ModelAndView getRegistration() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("center", centerPath + "mem_registration.jsp");
		mav.setViewName("home");
		return mav;
	}
	
//	[회원가입 작업 DB gogo]
	@RequestMapping(value="registration", method=RequestMethod.POST)
	public ModelAndView postRegistration(MemberBean mem, HttpServletRequest request) {
		System.out.println("회원가입 양식 넘어옴");
		  
		String tel01 = request.getParameter("tel01");
		String tel02 = request.getParameter("tel02");
		String tel03 = request.getParameter("tel03");
		String addr01 = request.getParameter("postCode");
		String addr02 = request.getParameter("roadAddress");
		String addr03 = request.getParameter("detailAddress");
		 
		String m_phone = tel01+"-"+tel02+"-"+tel03;
		String m_addr = addr01+addr02+addr03;
		  
		mem.setM_addr(m_addr);
		mem.setM_phone(m_phone); 
		
		System.out.println(m_addr);
		System.out.println(m_phone);
		
		int res = service.registration(mem);
		
		ModelAndView mav = new ModelAndView();
		if(res > 0) {
			mav.addObject("msg", "회원 가입 완료");
		} else {
			mav.addObject("msg", "회원 가입 실패");
		}
		
//		mav.addObject("center", centerPath + "mem_login_page.jsp");
		mav.setViewName("home");	// 이동하려는 jsp 페이지의 이름을 입력
		return mav;
	}
	
//	[일반회원 로그인 페이지로 이동]
	@RequestMapping(value="loginForm", method=RequestMethod.GET)
	public ModelAndView loginForm() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("center", centerPath + "loginForm.jsp");
		mav.setViewName("home");
		return mav;
	}
//	[일반회원 로그인 작업]
	@RequestMapping(value="loginFormm")
	public ModelAndView login(HttpSession session, String m_id, String m_pw, @RequestParam(value="cart",required=false)String cart_info) {
		System.out.println("들어온 m_id : " + m_id);
		MemberBean logMem = service.selectMem(m_id);
		ModelAndView mav = new ModelAndView();
		if(logMem != null) {
			if(logMem.getM_pw().equals(m_pw)) {
				logMem.setM_ox("o");
				
				SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
				String today = sdf.format(new Date());
				System.out.println("today : " + today);
				mapperBean mb = new mapperBean();
				mb.setInte1(logMem.getM_num());
				mb.setStr1(today);
				
				MemLogBean memLogHistory = service.visitHistory(mb);
				
				if(memLogHistory == null 
								|| (memLogHistory.getMl_m_num() != logMem.getM_num() 
										&& memLogHistory.getMl_date().equals(today))) {
					int res = service.insertLog(mb);  
					System.out.println(res > 0? "로그기록 저장완료" : "로그기록 저장실패");
					logMem.setM_logcount(logMem.getM_logcount()+1);
				}
				session.setAttribute("memLogin", logMem);
				
//				[로그인 시 접속여부 확인 && 로그인 횟수 증가]
				service.updateOxCount(logMem);
				mav.addObject("msg", logMem.getM_id() + "님 환영합니다");
				
				String showGrade = null;
				if(logMem.getM_grade() == 6) showGrade = "new";
				if(logMem.getM_grade() == 5) showGrade = "orange";
				if(logMem.getM_grade() == 4) showGrade = "silver";
				if(logMem.getM_grade() == 3) showGrade = "gold";
				if(logMem.getM_grade() == 2) showGrade = "vip";
				if(logMem.getM_grade() == 1) showGrade = "vvip";
				
				session.setAttribute("showGrade", showGrade);
				System.out.println(logMem.getM_ox());
				System.out.println(logMem.getM_logcount());
				System.out.println(logMem.getM_grade());
				
//				[로그인 횟수가 해당 숫자일 시 등급 올려주기]
				if(logMem.getM_logcount() == 5) {
					logMem.setM_grade(5);
					service.updateGrade(logMem);
					mav.addObject("gradeMsg", "등급이 [new]등급에서 -> [orange]등급으로 올랐습니다.!");
				} else if(logMem.getM_logcount() == 10) {
					logMem.setM_grade(4);
					service.updateGrade(logMem);
					mav.addObject("gradeMsg", "등급이 [orange]등급에서 -> [silver]등급으로 올랐습니다.!");
				} else if(logMem.getM_logcount() == 15) {
					logMem.setM_grade(3);
					service.updateGrade(logMem);
					mav.addObject("gradeMsg", "등급이 [silver]등급에서 -> [gold]등급으로 올랐습니다.!");
				} else if(logMem.getM_logcount() == 20) {
					logMem.setM_grade(2);
					service.updateGrade(logMem);
					mav.addObject("gradeMsg", "등급이 [gold]등급에서 -> [vip]등급으로 올랐습니다.!");
				} else if(logMem.getM_logcount() == 25) {
					logMem.setM_grade(1);
					service.updateGrade(logMem);
					mav.addObject("gradeMsg", "등급이 [vip]등급에서 -> [vvip]등급으로 올랐습니다.!");
				} 
				
				int res = 0;
				List<CartBean> cList = cartService.cartList(((MemberBean) session.getAttribute("memLogin")).getM_num());
				if(cart_info!=null)
				aa: for (String each : cart_info.split("-")) {
					String[] sp = each.split(",");
					if (each != "") {
						for (CartBean ctb : cList) {
							if (ctb.getCart_di_num() == Integer.parseInt(sp[0])
									&& ctb.getCart_dd_num() == Integer.parseInt(sp[1])
									&& ctb.getCart_m_num() == ((MemberBean) session.getAttribute("memLogin")).getM_num()) {
								ctb.setCart_amount(ctb.getCart_amount() + Integer.parseInt(sp[2]));
								res += cartService.updateAmount(ctb);
								continue aa;
							}
						}
						CartBean cb = new CartBean(Integer.parseInt(sp[0]), Integer.parseInt(sp[1]), Integer.parseInt(sp[2]),
								Integer.parseInt(sp[3]), ((MemberBean) session.getAttribute("memLogin")).getM_num());
						res += cartService.insertCart(cb);

					}
				}
//				System.out.println(res==cart_info.split("-").length-1 ? "장바구니 정보 저장 완료" : "장바구니 정보 저장 오류");
				session.setAttribute("cartNum", cartService.cartDIList(logMem.getM_num()).size());
				
			} else {
				mav.addObject("msg", "비밀번호가 일치하지 않습니다.");
				mav.addObject("center", centerPath + "loginForm.jsp");
			}
		} else {
			mav.addObject("msg", "로그인 실패");
			
		}
		mav.setViewName("/yeob/goHome");
		return mav;
	}
//	[일반회원 로그아웃]
	@RequestMapping("logOut")
	public ModelAndView logOut(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		MemberBean mem = (MemberBean)session.getAttribute("memLogin");
		session.getAttribute("showGrade");
//		System.out.println(mem.getM_ox());
		mem.setM_ox("x");
		Integer res =  service.logOut(mem);
		if(res != 0) {
			mav.addObject("msg", ""+ mem.getM_id() + "님 접속을 종료합니다.");
		}
		System.out.println("접속 여부 : " + mem.getM_ox());
		System.out.println("접속 횟수 : " + mem.getM_logcount());
		
		session.removeAttribute("memLogin");
		session.removeAttribute("showGrade");
		
		mav.setViewName("/yeob/goHome");
		return mav;
	}
//	==========================================================================================
//	[선영]
//	==========================================================================================
	
	@RequestMapping("insertQnaForm")
	public ModelAndView insertQnaForm(HttpSession session){
		ModelAndView mav = new ModelAndView();
		
//		Member mem = service.selectOne();
		MemberBean mem = (MemberBean)session.getAttribute("memLogin");
		
		mav.addObject("member",mem);
		
//		mav.addObject("top","/WEB-INF/views/memPage/top/topIndex.jsp");
		mav.addObject("center", centerPath + "writeQna.jsp");
		
		mav.setViewName("home");
		return mav;
	}
	
	@RequestMapping("insertQna")
	public String insertQna(
			@RequestParam("category1") String cate1,
			@RequestParam("title") String title,
			@RequestParam("content") String content,
			HttpSession session
			){
//		ModelAndView mav = new ModelAndView();
		QnaBean qna = new QnaBean(title, content, cate1, 
				((MemberBean)session.getAttribute("memLogin")).getM_num(), 
				((MemberBean)session.getAttribute("memLogin")).getM_id());
		int res = service.insertQna(qna);
//		mav.addObject("msg",res>0 ? "1:1문의 등록 완료" : "1:1문의 등록 실패");
		System.out.println(res>0 ? "1:1문의 등록 완료" : "1:1문의 등록 실패");
		
		return "redirect:memQnaList";
	}
	
	@RequestMapping("memQnaList")
	public ModelAndView memQnaList(HttpSession session){
		ModelAndView mav = new ModelAndView();
		List<QnaBean> listc = service.selectQnaList(((MemberBean)session.getAttribute("memLogin")).getM_num());
		mav.addObject("listc",listc);
		
//		mav.addObject("top","/WEB-INF/views/memPage/top/topIndex.jsp");
		mav.addObject("center", centerPath + "qnaList.jsp");
		mav.setViewName("home");
		return mav;
	}
	
	
	@RequestMapping(value="modifyQna",method=RequestMethod.GET)
	public ModelAndView selectQna(@RequestParam("q_num")Integer q_num,HttpSession session){
		ModelAndView mav = new ModelAndView();
		QnaBean qna = service.selectQna(q_num);
		mav.addObject("mem",(MemberBean)session.getAttribute("memLogin"));
		System.out.println(qna.getQ_num());
		mav.addObject("qna",qna);
//		mav.addObject("top","/WEB-INF/views/memPage/top/topIndex.jsp");
		mav.addObject("center", centerPath + "qnaModify.jsp");
		mav.setViewName("home");
		return mav;
	}
	
	@RequestMapping(value="modifyQna",method=RequestMethod.POST)
	public String modifyQna(
			@RequestParam("category1") String cate1,
			@RequestParam("title") String title,
			@RequestParam("content") String content,
			@RequestParam("num") Integer q_num,
			HttpSession session
			){
		QnaBean qna = new QnaBean(title, content, cate1, 
				((MemberBean)session.getAttribute("memLogin")).getM_num(), 
				((MemberBean)session.getAttribute("memLogin")).getM_id());
		qna.setQ_num(q_num);
		int res = service.modifyQna(qna);
		System.out.println(res>0 ? "1:1문의 수정 완료" : "1:1문의 수정 실패");
		
		return "redirect:memQnaList";
	}
	
	@RequestMapping("deleteQna")
	public String deleteQna(@RequestParam("q_num")Integer q_num){
		int res = service.deleteQna(q_num);
		System.out.println(res>0 ? "1:1삭제 완료" : "1:1삭제 실패");
		
		return "redirect:memQnaList";
	}
	
	@RequestMapping("notice")
	public ModelAndView noticeList(){
		ModelAndView mav = new ModelAndView();
		mav.addObject("list",noService.selectList());
		mav.addObject("center","/WEB-INF/views/adminPage/center/noticeList.jsp");
		mav.setViewName("home");
		return mav;
	}
	
//	=================================================================
//	[마이페이지 (Suin)]
	
//	[일반회원 마이페이지로 이동]
	// [일반회원 마이페이지로 이동]
	@RequestMapping("Myshipping")
	public ModelAndView Myshipping(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		MemberBean memberNum = (MemberBean) session.getAttribute("memLogin");
		if (memberNum != null ) {
			
		MemberBean mem = new MemberBean(memberNum.getM_num());
		List<BuyBean> listc = buyService.selectNoticket(mem);
		mav.addObject("listc", listc);
		mav.addObject("mnum", memberNum.getM_num());
		mav.addObject("center", centerPath + "Myshipping.jsp");
		mav.setViewName("home");
		
		}else{
			
			mav.addObject("center", centerPath + "Myshipping.jsp");
			mav.setViewName("home");
		}
		return mav;
	}

	@RequestMapping("MyCancel")
	public ModelAndView MyCancel(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		MemberBean memberNum = (MemberBean) session.getAttribute("memLogin");
		if (memberNum != null ) {
		MemberBean mem = service.showMember(memberNum.getM_num());
		List<BuyBean> buyInfoList = buyService.CancelBuySelect(mem.getM_num());
		mav.addObject("mnum", memberNum.getM_num());
		mav.addObject("mem", mem);
		mav.addObject("buyList", buyInfoList);
		mav.addObject("center", centerPath + "MyCancel.jsp");
		mav.setViewName("home");
		
		}else{
			
			mav.addObject("center", centerPath + "MyCancel.jsp");
			mav.setViewName("home");
		}
		return mav;
	}

	@RequestMapping("MyPoint")
	public ModelAndView MyPoint(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		MemberBean memberNum = (MemberBean) session.getAttribute("memLogin");
		if (memberNum != null ) {
		MemberBean mem = service.showMember(memberNum.getM_num());
		List<BuyBean> buyInfoList = buyService.buyInfoList(mem.getM_num());
		for (BuyBean each : buyInfoList) {
			System.out.println("된 건 가 " + each.getB_di_name() + "하하 : " + each.getB_discount());
		}
		mav.addObject("mnum", memberNum.getM_num());
		mav.addObject("mem", mem);
		mav.addObject("buyList", buyInfoList);
		mav.addObject("center", centerPath + "MyPoint.jsp");
		mav.setViewName("home");
		}else{
			mav.addObject("center", centerPath + "MyPoint.jsp");
			mav.setViewName("home");
		}
		return mav;
	}


	@RequestMapping("MyTicket")
	public ModelAndView MyTicket(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		MemberBean memberNum = (MemberBean) session.getAttribute("memLogin");
		if (memberNum != null ) {
		MemberBean mem = new MemberBean(memberNum.getM_num());
		List<BuyBean> listc = buyService.selectTicket(mem);
		mav.addObject("listc", listc);
		mav.addObject("mnum", memberNum.getM_num());
		mav.addObject("center", centerPath + "MyTicket.jsp");
		mav.setViewName("home");
		}else{
			mav.addObject("center", centerPath + "MyTicket.jsp");
			mav.setViewName("home");
		}
		return mav;
	}

	@RequestMapping("MyAll")
	public ModelAndView MyAll(HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		MemberBean memberNum = (MemberBean) session.getAttribute("memLogin");
		if (memberNum != null ) {
		MemberBean mem = new MemberBean(memberNum.getM_num());
		List<BuyBean> listc = buyService.AllBuySelect(mem);
		mav.addObject("listc", listc);
		mav.addObject("mnum", memberNum.getM_num());
		mav.addObject("center", centerPath + "MyAll.jsp");
		mav.setViewName("home");
			}else{
				mav.addObject("center", centerPath + "MyAll.jsp");
				mav.setViewName("home");
			}
		return mav;
	}
	
//	=================================================================
//	[경민형님]
	
	@RequestMapping(value="idCheck01", produces="text/plain; charset=UTF-8")
	@ResponseBody
	public String idCheck01(HttpServletRequest request, HttpServletResponse response) {
		
		System.out.println("idCheck01 - 넘어옴");
		String m_id = request.getParameter("key");
		System.out.println(m_id);
		String aaa = "불일치";

		List<MemberBean> search = service.idCheck01();
		for(MemberBean each : search) {
			System.out.println(each.getM_id());
			if(each.getM_id().equals(m_id)) {
				aaa = "일치";
			}
		}
		System.out.println(aaa);
		
		return aaa;
		
	}
	
	@RequestMapping(value="id_Find", method=RequestMethod.GET)
	public ModelAndView id_Find1() {
		System.out.println("아이디 찾기 화면으로 이동해주세요.");
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("center", centerPath + "id_Find.jsp");
		mav.setViewName("home");
		return mav;
	}
	
	
	@RequestMapping(value="id_Find", produces="text/plain; charset=UTF-8")
	@ResponseBody
	public String id_Find2(MemberBean mem_reg, HttpServletRequest request, HttpServletResponse response) {
		System.out.println("아이디찾기 양식 넘어옴");
		
		String m_name = request.getParameter("m_name");  
		String m_phone = request.getParameter("m_phone");
		System.out.println(m_name);
		System.out.println(m_phone);
		
		String s1 = String.valueOf((int)(Math.random()*10));
		String s2 = String.valueOf((int)(Math.random()*10));
		String s3 = String.valueOf((int)(Math.random()*10));
		String s4 = String.valueOf((int)(Math.random()*10));
		String s5 = String.valueOf((int)(Math.random()*10));
		String codeNum = s1+s2+s3+s4+s5;
		
		System.out.println("인증번호 : " + codeNum);
		
		List<MemberBean> listc = service.selectList11();
		
		String result = "일치하는 정보가 없습니다.";
		for(MemberBean each : listc) {
			if(each.getM_name().contains(m_name) ) {
				System.out.println(m_name + " - " + each.getM_name());
				
				if(each.getM_phone().contains(m_phone)) {
					System.out.println(m_phone + " - " + each.getM_phone());
					result = codeNum;
				}
			} 
		}
		return result;
	}
	
	@RequestMapping(value="pw_Find", method=RequestMethod.GET)
	public ModelAndView pw_Find1() {
		System.out.println("비밀번호 찾기 화면 바뀜 넘어옴");
	
		ModelAndView mav = new ModelAndView();
		mav.addObject("center", centerPath + "pw_Find.jsp");
		mav.setViewName("home");
		return mav;
	}
	
	@RequestMapping(value="pw_Find", produces="text/plain; charset=UTF-8")
	@ResponseBody
	public String pw_Find2(MemberBean mem_reg, HttpServletRequest request, HttpServletResponse response) {
		System.out.println("비밀번호찾기 양식 넘어옴");
		
		String m_id = request.getParameter("m_id");  
		String m_phone = request.getParameter("m_phone");
		System.out.println(m_id);
		System.out.println(m_phone);
		
		String s1 = String.valueOf((int)(Math.random()*10));
		String s2 = String.valueOf((int)(Math.random()*10));
		String s3 = String.valueOf((int)(Math.random()*10));
		String s4 = String.valueOf((int)(Math.random()*10));
		String s5 = String.valueOf((int)(Math.random()*10));
		String codeNum = s1+s2+s3+s4+s5;
		
		System.out.println("인증번호 : " + codeNum);
		
		List<MemberBean> listc = service.selectList22();
		
		String result = "일치하는 정보가 없습니다.";
		for(MemberBean each : listc) {
			if(each.getM_id().contains(m_id) ) {
				System.out.println("8888 : "+m_id + " - " + each.getM_id());
				
				if(each.getM_phone().contains(m_phone)) {
					System.out.println("8888 : "+m_phone + " - " + each.getM_phone());
					result = codeNum;
				}
			} 
		}
		return result;
	}
	
//  [ 인증번호 팝업 ]
	@RequestMapping("showpop")
	public ModelAndView popUpView(@RequestParam(value="codeNum") String codeNum) {
		System.out.println(codeNum);
		ModelAndView mav = new ModelAndView();
		mav.addObject("codeNum", codeNum);
		mav.setViewName("memPage/center/confirmPop");
		return mav;
	}
	
	@RequestMapping(value="FindID", method=RequestMethod.POST)
	public ModelAndView FindID(MemberBean mem, HttpServletRequest request) {
		System.out.println("회원가입 양식 넘어옴");
		  
		String tel01 = request.getParameter("tel01");
		String tel02 = request.getParameter("tel02");
		String tel03 = request.getParameter("tel03");
		 
		String m_phone = tel01+"-"+tel02+"-"+tel03;
		String m_name = request.getParameter("m_name");
		String checkNum = request.getParameter("checkNum");
		System.out.println(m_name);
		System.out.println(checkNum);
		System.out.println(m_phone);
		List<MemberBean> listc = service.selectList33();
		ModelAndView mav = new ModelAndView();
		
		for(MemberBean each : listc) {
			if(each.getM_name().contains(m_name) ) {
				System.out.println(m_name + " - " + each.getM_name());
				if(each.getM_phone().contains(m_phone)) {
					System.out.println(m_phone + " - " + each.getM_phone());
					mav.addObject("m_id", each.getM_id());
					mav.addObject("m_name", each.getM_name());
				}
			} 
		}
		
		mav.addObject("center", centerPath + "searchID.jsp");
		mav.setViewName("home");	// 이동하려는 jsp 페이지의 이름을 입력
		return mav;
	}
	
	@RequestMapping(value="FindPW", method=RequestMethod.POST)
	public ModelAndView FindPW(MemberBean mem, HttpServletRequest request) {
		System.out.println("비밀번호 찾기 양식 넘어옴");
		  
		String tel01 = request.getParameter("tel01");
		String tel02 = request.getParameter("tel02");
		String tel03 = request.getParameter("tel03");
		 
		String m_phone = tel01+"-"+tel02+"-"+tel03;
		String m_id = request.getParameter("m_id");
		String checkNum = request.getParameter("checkNum");
		System.out.println("@@"+m_id);
		System.out.println("@@"+checkNum);
		System.out.println("@@"+m_phone);
		List<MemberBean> listc = service.selectList44();
		ModelAndView mav = new ModelAndView();
		
		for(MemberBean each : listc) {
			if(each.getM_id().contains(m_id) ) {
				System.out.println(m_id + " - " + each.getM_id());
				if(each.getM_phone().contains(m_phone)) {
					System.out.println(m_phone + " - " + each.getM_phone());
					System.out.println("1111"+each.getM_id());
					System.out.println("!!!"+each.getM_pw());
					mav.addObject("m_pw", each.getM_pw());
					mav.addObject("m_id", each.getM_id());
				}
			} 
		}
		
		mav.addObject("center", centerPath + "searchPW.jsp");
		mav.setViewName("home");	// 이동하려는 jsp 페이지의 이름을 입력
		return mav;
	}
	
	
//	=================================================================
//	[03.21.수인]
	//바로결제 페이지 ---------------------------------------------------------
		@RequestMapping("directBuyPage")
		public ModelAndView directBuyPage(@RequestParam("num") int num, HttpSession session,
				@RequestParam("totalprice") int totalprice, @RequestParam(value = "coco", required = false) String coco) {
			ModelAndView mav = new ModelAndView();

			MemberBean memberNum = (MemberBean) session.getAttribute("memLogin");
//			System.out.println("멤버넘버" + memberNum);
			if (memberNum != null ) {
				
				Deal_Info info = service.showInfo(num); // 기업상품
				mav.addObject("info", info);
				MemberBean mem = service.showMember(memberNum.getM_num());
				mav.addObject("totalprice", totalprice);
				mav.addObject("mem", mem);
				mav.addObject("mnum", memberNum.getM_num());
				mav.addObject("coco", coco);
				mav.addObject("center", centerPath + "directBuyPage.jsp");
				mav.setViewName("home");
			} else {
				mav.addObject("center", centerPath + "directBuyPage.jsp");
				mav.setViewName("home");
			}

			return mav;
		}
		
		
		
		
		
		@RequestMapping("directBuySecess")
		public ModelAndView directBuySecess(@RequestParam("totalprice") int totalprice,
				@RequestParam("infonum") int infonum, @RequestParam("cbank") String cbank, HttpSession session,
				@RequestParam(value = "coco", required = false) String coco, @RequestParam("point") int point,
				@RequestParam("discountpoint") int discountpoint) {
			ModelAndView mav = new ModelAndView();
			MemberBean memberNum = (MemberBean) session.getAttribute("memLogin");
			if (memberNum != null ) {

				Deal_Info info = service.showInfo(infonum);
				mav.addObject("coco", coco);

				List<BuyDetailBean> listc = new ArrayList<>();
				String wait = "WAIT";
				String[] zz = coco.split("-");
				Date finalDate = null;
				BuyBean buyinfo = new BuyBean(memberNum.getM_num(), info.getDi_c_num(), infonum, info.getDi_name(),
						totalprice, discountpoint, wait,finalDate);
				int resinfo = buyService.InsertBuyInfo(buyinfo);
				
				BuyDetailBean buydetail = null;
				for (int i = 0; i < zz.length; i++) {
					String[] detail1 = zz[i].split(",");
					System.out.println(Integer.parseInt(detail1[0]));
					Deal_Detail buydetail1 = buyService.selectBuyName(Integer.parseInt(detail1[0]));

					System.out.println(buydetail1.getDd_name());
					if (buydetail == null) {
						buydetail = new BuyDetailBean(Integer.parseInt(detail1[0]), buydetail1.getDd_name(),
								Integer.parseInt(detail1[2]), Integer.parseInt(detail1[1]));
					}
					buydetail = new BuyDetailBean(Integer.parseInt(detail1[0]), buydetail1.getDd_name(),
							Integer.parseInt(detail1[2]), Integer.parseInt(detail1[1]));
					listc.add(buydetail);
					buydetail = null;
				}
				int updateAmount = buyService.minorAmount(listc);
				int resDetail = buyService.insertBuyDetail(listc);
				
			
				MemberBean mem = new MemberBean(memberNum.getM_num(), point);
				int memUpdate = service.updatememPoint(mem);
				if (memUpdate > 0) {
					System.out.println("member point 감소 및 쌓기 성공");
				} else {
					System.out.println("member point 수정 실패");
				}
				
				if (resDetail > 0) {
					System.out.println("detail 저장 완료");
				} else {
					System.out.println("detail 저장실패");
				}

				if (updateAmount > 0) {
					System.out.println("updateAmount 수정 완료");
				} else {
					System.out.println("updateAmount 수정 실패");
				}
				if (resinfo > 0) {
					System.out.println(" info 저장 완료");
				} else {
					System.out.println("info 저장실패");
				}
				mav.addObject("cbank", cbank);
				mav.addObject("discountpoint", discountpoint);
				mav.addObject("totalprice", totalprice);
				mav.addObject("center", centerPath + "directBuySecess.jsp");
				mav.setViewName("/home");
			} else {
				mav.addObject("center", centerPath + "directBuySecess.jsp");
				mav.setViewName("/yeob/goHome");
			}
			return mav;
		}

		@RequestMapping("directCardPopup")
		public ModelAndView directCardPopup(@RequestParam("totalprice") int totalprice,
				@RequestParam("cardCbank") String cardCbank, HttpSession session,
				@RequestParam("infonum") int infonum, @RequestParam(value = "coco", required = false) String coco,
				@RequestParam("point") int point, @RequestParam("discountpoint") int discountpoint) {
			ModelAndView mav = new ModelAndView();
			MemberBean memberNum = (MemberBean) session.getAttribute("memLogin");
			if (memberNum != null ) {

				mav.addObject("totalprice", totalprice);
				mav.addObject("cardCbank", cardCbank);
				mav.addObject("point", point);
				mav.addObject("mnum", memberNum.getM_num());
				mav.addObject("infonum", infonum);
				mav.addObject("discountpoint", discountpoint);
				mav.addObject("coco", coco);
				MemberBean mem = service.showMember(memberNum.getM_num());
				Deal_Info info = service.showInfo(infonum); // 기업상품
				mav.addObject("info", info);
				mav.addObject("mem", mem);
				mav.setViewName("/memPage/center/directCardPopup");
			} else {
				mav.setViewName("/memPage/center/directCardPopup");
			}
			return mav;
		}
		
		
		
		
		@RequestMapping("directPhonePopup")
		public ModelAndView directPhonePopup(@RequestParam("totalprice") int totalprice,
				HttpSession session, @RequestParam("infonum") int infonum,
				@RequestParam(value = "coco", required = false) String coco, @RequestParam("point") int point,
				@RequestParam("discountpoint") int discountpoint) {
			ModelAndView mav = new ModelAndView();
			MemberBean memberNum = (MemberBean) session.getAttribute("memLogin");
			if (memberNum != null ) {
				mav.addObject("totalprice", totalprice);
				mav.addObject("mnum", memberNum.getM_num());
				mav.addObject("point", point);
				mav.addObject("infonum", infonum);
				mav.addObject("discountpoint", discountpoint);
				mav.addObject("coco", coco);
				mav.setViewName("/memPage/center/directPhonePopup");
			} else {
				mav.setViewName("/memPage/center/directPhonePopup");
			}
			return mav;
		}
		
		
		@RequestMapping("directAccountPopup")
		public ModelAndView directAccountPopup(@RequestParam("totalprice") int totalprice,
				@RequestParam("cardCbank") String cardCbank, HttpSession session,
				@RequestParam("infonum") int infonum, @RequestParam(value = "coco", required = false) String coco,
				@RequestParam("point") int point, @RequestParam("discountpoint") int discountpoint) {
			ModelAndView mav = new ModelAndView();
			MemberBean memberNum = (MemberBean) session.getAttribute("memLogin");
			if (memberNum != null ) {

				mav.addObject("totalprice", totalprice);
				mav.addObject("cardCbank", cardCbank);
				mav.addObject("point", point);
				mav.addObject("mnum", memberNum.getM_num());
				mav.addObject("infonum", infonum);
				mav.addObject("discountpoint", discountpoint);
				mav.addObject("coco", coco);
				MemberBean mem = service.showMember(memberNum.getM_num());
				Deal_Info  info = service.showInfo(infonum); // 기업상품
				mav.addObject("info", info);
				mav.addObject("mem", mem);
				mav.setViewName("/memPage/center/directAccountPopup");
			} else {
				mav.setViewName("/memPage/center/directAccountPopup");
			}
			return mav;
		}

		@RequestMapping("directPhonePopupTwo")
		public ModelAndView directPhonePopupTwo(@RequestParam("totalprice") int totalprice,
				HttpSession session, @RequestParam("infonum") int infonum,
				@RequestParam(value = "coco", required = false) String coco, @RequestParam("point") int point,
				@RequestParam("discountpoint") int discountpoint) {
			ModelAndView mav = new ModelAndView();
			MemberBean memberNum = (MemberBean) session.getAttribute("memLogin");
			if (memberNum != null ) {
				mav.addObject("totalprice", totalprice);
				mav.addObject("mnum", memberNum.getM_num());
				mav.addObject("infonum", infonum);
				MemberBean mem = service.showMember(memberNum.getM_num());

				Deal_Info  info = service.showInfo(infonum); // 기업상품
				mav.addObject("info", info);
				mav.addObject("discountpoint", discountpoint);
				mav.addObject("mem", mem);
				mav.addObject("point", point);
				mav.addObject("coco", coco);
				mav.setViewName("/memPage/center/directPhonePopupTwo");
			} else {
				mav.setViewName("/memPage/center/directPhonePopupTwo");
			}
			return mav;
		}


		
		@RequestMapping("directBuyAllSuccess")
		public ModelAndView directBuyAllSuccess(@RequestParam("totalprice") int totalprice, 
				HttpSession session, @RequestParam("infonum") int infonum, @RequestParam("point") int point,
				@RequestParam("discountpoint") int discountpoint,
				@RequestParam(value = "coco", required = false) String coco) {
			ModelAndView mav = new ModelAndView();
			MemberBean memberNum = (MemberBean) session.getAttribute("memLogin");
			if (memberNum != null ) {
				
				
				Deal_Info info = service.showInfo(infonum);
				mav.addObject("coco", coco);

				List<BuyDetailBean> listc = new ArrayList<>();
				String wait = "WAIT";
				String[] zz = coco.split("-");
				System.out.println("zz0>>>" + zz[0]);

				MemberBean mem = new MemberBean(memberNum.getM_num(), point);
				int memUpdate = service.updatememPoint(mem);
				if (memUpdate > 0) {
					System.out.println("member point 감소 및 쌓기 성공");
				} else {
					System.out.println("member point 수정 실패");
				}
				Date finalDate = null;
				BuyBean buyinfo = new BuyBean(memberNum.getM_num(), info.getDi_c_num(), infonum, info.getDi_name(), totalprice,
						discountpoint, wait,finalDate);
				int resinfo = buyService.InsertBuyInfo(buyinfo);

				BuyDetailBean buydetail = null;
				for (int i = 0; i < zz.length; i++) {
					String[] detail1 = zz[i].split(",");
					System.out.println(Integer.parseInt(detail1[0]));
					Deal_Detail buydetail1 = buyService.selectBuyName(Integer.parseInt(detail1[0]));

					System.out.println(buydetail1.getDd_name());
					if (buydetail == null) {
						buydetail = new BuyDetailBean(Integer.parseInt(detail1[0]), buydetail1.getDd_name(),
								Integer.parseInt(detail1[2]), Integer.parseInt(detail1[1]));
					}
					System.out.println("됨되뫼되도디되뫼되ㅚㅗ미ㅚ되ㅣㅁ");
					buydetail = new BuyDetailBean(Integer.parseInt(detail1[0]), buydetail1.getDd_name(),
							Integer.parseInt(detail1[2]), Integer.parseInt(detail1[1]));
					listc.add(buydetail);
					buydetail = null;
				}
				int resDetail = buyService.insertBuyDetail(listc);
				
				int updateAmount = buyService.minorAmount(listc);
				if (updateAmount > 0) {
					System.out.println("updateAmount 수정 완료");
				} else {
					System.out.println("updateAmount 수정 실패");
				}

				if (resinfo > 0) {
					System.out.println(" info 저장 완료");
				} else {
					System.out.println("info 저장실패");
				}

				if (resDetail > 0) {
					System.out.println("detail 저장 완료");
				} else {
					System.out.println("detail 저장실패");
				}
				mav.setViewName("/home");
			} else {
				mav.setViewName("/home");
			}
			
			return mav;

		}
		
		
		
		
		
		//direct -----------------------------------------------------------------
		
		
		//장바구니 결제페이지 ------------------------------------------------------
		

		@RequestMapping("cartBuyPage")
		public ModelAndView cartBuyPage(HttpSession session,@RequestParam("di_nums") String di_nums,
				@RequestParam("totalprice") int totalprice) {
			ModelAndView mav = new ModelAndView();

			MemberBean memberNum = (MemberBean) session.getAttribute("memLogin");

			List<CartBean> buyList = new ArrayList<>();
			List<Deal_Info> info = new ArrayList<>();
			Deal_Info ii = null;
			if (memberNum != null ) {
				
				String[] splitdi = di_nums.split(",");
				for(int i=0;i<splitdi.length;i++){
					buyList = buyService.showCartList(Integer.parseInt(splitdi[i]));
					if(ii == null){
						ii =  buyService.infoOne(Integer.parseInt(splitdi[i]));
					}
					ii =  buyService.infoOne(Integer.parseInt(splitdi[i]));
					info.add(ii);
					ii = null;
				}
				for(Deal_Info each : info){
					System.out.println("each.getDi_name() : "+each.getDi_name());
				}
				mav.addObject("buyList", buyList);
				MemberBean mem = service.showMember(memberNum.getM_num());
				mav.addObject("info", info);
				mav.addObject("totalprice", totalprice);
				mav.addObject("mem", mem);
				mav.addObject("di_nums", di_nums);
				mav.addObject("mnum", memberNum.getM_num());
				mav.addObject("center", centerPath + "cartBuyPage.jsp");
				mav.setViewName("home");
			} else {
				mav.addObject("center", centerPath + "cartBuyPage.jsp");
				mav.setViewName("home");
			}
		
			return mav;
		}

		@RequestMapping("cartBuySecess")
		public ModelAndView BuySecess(@RequestParam("totalprice") int totalprice,@RequestParam("di_nums") String di_nums,
				HttpSession session, @RequestParam("point") int point,
				@RequestParam("discountpoint") int discountpoint,@RequestParam("cbank") String cbank) {
			ModelAndView mav = new ModelAndView();
			MemberBean memberNum = (MemberBean) session.getAttribute("memLogin");
			if (memberNum != null ) {
				
				
				Deal_Info  info = null;
//				Date finalDate = null;
				String wait = "WAIT";
				List<BuyDetailBean> listc = new ArrayList<>();
				BuyDetailBean buydetail =null;
				
				BuyBean buyinfo = null;
				List<BuyBean> buy = new ArrayList<>();
				String[] splitdi = di_nums.split(",");
				
				for(int i=0;i<splitdi.length;i++){
					System.out.println(i);
					System.out.println(splitdi);
					info =  service.showInfo(Integer.parseInt(splitdi[i]));
					System.out.println("Integer.parseInt(splitdi[i]) : "+Integer.parseInt(splitdi[i]));
					 List<CartBean> buyList = buyService.showCartList(Integer.parseInt(splitdi[i]));
					 
//					 if(buyinfo == null){
//						 System.out.println("info.getDi_num() : "+info.getDi_num());
//						 buyinfo  = new BuyBean(memberNum.getM_num(),info.getDi_c_num(), Integer.parseInt(splitdi[i]),info.getDi_name(), totalprice,
//								s	discountpoint, wait);
//					 }
					 
					buyinfo = new BuyBean(memberNum.getM_num(),info.getDi_c_num(), Integer.parseInt(splitdi[i]),info.getDi_name(), totalprice,
							discountpoint, wait);
					
					
					buy.add(buyinfo);
					buyinfo = null;
				
					for(CartBean each : buyList){
						
						Deal_Detail buydetail1 = buyService.selectdetailName(each.getCart_dd_num());
						if(buydetail == null){
							
						System.out.println("each.getCart_dd_num() : "+each.getCart_dd_num());
							buydetail = new BuyDetailBean(each.getCart_dd_num(), buydetail1.getDd_name(),
									each.getCart_price(), each.getCart_amount());
							System.out.println("buydetail1.getDd_name() : "+buydetail1.getDd_name());
						}
						
						System.out.println("each.getCart_dd_num()>>>>>"+each.getCart_dd_num());
						
						buydetail = new BuyDetailBean(each.getCart_dd_num(), buydetail1.getDd_name(),
								each.getCart_price(), each.getCart_amount());
						listc.add(buydetail);
						buydetail = null;
					}
				
				}
				//------------------------------------
				
				int resinfo = buyService.InsertBuyInfoList(buy);

				int resDetail = buyService.insertBuyDetail(listc);
				
				int updateAmount = buyService.minorAmount(listc);
				
				if (updateAmount > 0) {
					System.out.println("updateAmount 수정 완료");
				} else {
					System.out.println("updateAmount 수정 실패");
				}
				if (resinfo > 0) {
					System.out.println(" info 저장 완료");
				} else {
					System.out.println("info 저장실패");
				}

				if (resDetail > 0) {
					System.out.println("detail 저장 완료");
				} else {
					System.out.println("detail 저장실패");
				}
				
				MemberBean mem = new MemberBean(memberNum.getM_num(), point);
				int memUpdate = service.updatememPoint(mem);
				if (memUpdate > 0) {
					System.out.println("member point 감소 및 쌓기 성공");
				} else {
					System.out.println("member point 수정 실패");
				}
				//------------------------------------
				mav.addObject("totalprice", totalprice);
				mav.addObject("cbank", cbank);
				mav.addObject("center", centerPath+"cartBuySecess.jsp");
				mav.setViewName("/home");
			} else {
				mav.setViewName("/home");
			}
			
			return mav;
		}
		
		@RequestMapping("cartPhonePopup")
		public ModelAndView cartPhonePopup(@RequestParam("totalprice") int totalprice,
				HttpSession session, @RequestParam("di_nums") String di_nums, @RequestParam("point") int point,
				@RequestParam("discountpoint") int discountpoint ) {
			ModelAndView mav = new ModelAndView();
			MemberBean memberNum = (MemberBean) session.getAttribute("memLogin");
			if (memberNum != null ) {
				
				mav.addObject("mnum", memberNum.getM_num());
				mav.addObject("di_nums", di_nums);
				mav.addObject("totalprice", totalprice);
				mav.addObject("point", point);
				mav.addObject("discountpoint", discountpoint);
				mav.setViewName("/memPage/center/cartPhonePopup");
		
			} else {
				mav.setViewName("/memPage/center/cartPhonePopup");
			}
			return mav;
		}
	//	
		@RequestMapping("cartphonePopupTwo")
		public ModelAndView cartphonePopupTwo(@RequestParam("totalprice") int totalprice,
				HttpSession session,@RequestParam("di_nums") String di_nums, @RequestParam("point") int point,
				@RequestParam("discountpoint") int discountpoint) {
			ModelAndView mav = new ModelAndView();
			MemberBean memberNum = (MemberBean) session.getAttribute("memLogin");
			if (memberNum != null ) {
				
				MemberBean mem = service.showMember(memberNum.getM_num());
				List<CartBean> buyList = new ArrayList<>();
				List<Deal_Info> info = new ArrayList<>();
				
				String[] splitdi = di_nums.split(",");
				for(int i=0;i<splitdi.length;i++){
					buyList = buyService.showCartList(Integer.parseInt(splitdi[i]));
					info =  buyService.showInfoList(Integer.parseInt(splitdi[i]));
				}
				mav.addObject("mnum", memberNum.getM_num());
				mav.addObject("totalprice", totalprice);
				mav.addObject("di_nums", di_nums);
				mav.addObject("buyList", buyList);
				mav.addObject("info", info);
				mav.addObject("discountpoint", discountpoint);
				mav.addObject("mem", mem);
				mav.addObject("point", point);
				mav.setViewName("/memPage/center/cartphonePopupTwo");
			} else {
				mav.setViewName("/memPage/center/cartphonePopupTwo");
			}
			return mav;
		}
		
		@RequestMapping("cartAccountPopup")
		public ModelAndView cartAccountPopup(@RequestParam("totalprice") int totalprice, @RequestParam("cbank") String cbank,
				HttpSession session,@RequestParam("di_nums") String di_nums,
				@RequestParam("discountpoint") int discountpoint,
			@RequestParam("point") int point) {
			ModelAndView mav = new ModelAndView();
			MemberBean memberNum = (MemberBean) session.getAttribute("memLogin");
			if (memberNum != null ) {
				
				List<CartBean> buyList = new ArrayList<>();
				List<Deal_Info> info = new ArrayList<>();
				
				String[] splitdi = di_nums.split(",");
				for(int i=0;i<splitdi.length;i++){
					buyList = buyService.showCartList(Integer.parseInt(splitdi[i]));
					info =  buyService.showInfoList(Integer.parseInt(splitdi[i]));
				}
				mav.addObject("totalprice", totalprice);
				mav.addObject("cbank", cbank);
				MemberBean mem = service.showMember(memberNum.getM_num());
				mav.addObject("info", info);
				mav.addObject("mem", mem);
				mav.addObject("buyList", buyList);
				mav.addObject("mnum", memberNum.getM_num());
				System.out.println(">>>>>>>>>>>>>>>>>>>>>>"+memberNum.getM_num());
				mav.addObject("point", point);
				mav.addObject("discountpoint", discountpoint);
				mav.addObject("di_nums", di_nums);
				mav.setViewName("/memPage/center/cartAccountPopup");
			} else {
				mav.setViewName("/memPage/center/cartAccountPopup");
			}
			return mav;
		}
		
		@RequestMapping("cartCardPopup")
		public ModelAndView cartCardPopup(@RequestParam("totalprice") int totalprice,
				@RequestParam("cardCbank") String cardCbank, HttpSession session,
				@RequestParam("di_nums") String di_nums,
				@RequestParam("point") int point, @RequestParam("discountpoint") int discountpoint) {
			ModelAndView mav = new ModelAndView();
			MemberBean memberNum = (MemberBean) session.getAttribute("memLogin");
			if (memberNum != null ) {

				System.out.println(totalprice);
				List<CartBean> buyList = new ArrayList<>();
				List<Deal_Info> info = new ArrayList<>();
				
				String[] splitdi = di_nums.split(",");
				for(int i=0;i<splitdi.length;i++){
					buyList = buyService.showCartList(Integer.parseInt(splitdi[i]));
					info =  buyService.showInfoList(Integer.parseInt(splitdi[i]));
				}
				MemberBean mem = service.showMember(memberNum.getM_num());
				mav.addObject("info", info);
				mav.addObject("buyList", buyList);
				mav.addObject("totalprice", totalprice);
				mav.addObject("cardCbank", cardCbank);
				mav.addObject("point", point);
				mav.addObject("mnum", memberNum.getM_num());
				mav.addObject("di_nums", di_nums);
				mav.addObject("discountpoint", discountpoint);
				
				mav.addObject("di_nums", di_nums);
				mav.addObject("mem", mem);
				mav.setViewName("/memPage/center/cartCardPopup");
			} else {
				mav.setViewName("/memPage/center/cartCardPopup");
			}
			return mav;
		}
		
		
		@RequestMapping("cartBuyAllSuccess")
		public ModelAndView cartBuyAllSuccess(@RequestParam("totalprice") int totalprice,@RequestParam("di_nums") String di_nums,
				HttpSession session, @RequestParam("point") int point,
				@RequestParam("discountpoint") int discountpoint) {
			ModelAndView mav = new ModelAndView();
			MemberBean memberNum = (MemberBean) session.getAttribute("memLogin");
			if (memberNum != null ) {
				
				
				Deal_Info  info = null;
//				Date finalDate = null;
				String wait = "WAIT";
				List<BuyDetailBean> listc = new ArrayList<>();
				BuyDetailBean buydetail =null;
				
				BuyBean buyinfo = null;
				List<BuyBean> buy = new ArrayList<>();
				String[] splitdi = di_nums.split(",");
				
				for(int i=0;i<splitdi.length;i++){
					System.out.println(i);
					System.out.println(splitdi);
					info =  service.showInfo(Integer.parseInt(splitdi[i]));
					System.out.println("Integer.parseInt(splitdi[i]) : "+Integer.parseInt(splitdi[i]));
					 List<CartBean> buyList = buyService.showCartList(Integer.parseInt(splitdi[i]));
					buyinfo = new BuyBean(memberNum.getM_num(),info.getDi_c_num(), Integer.parseInt(splitdi[i]),info.getDi_name(), totalprice,
							discountpoint, wait);
					
					
					buy.add(buyinfo);
					buyinfo = null;
				
					for(CartBean each : buyList){
						
						Deal_Detail buydetail1 = buyService.selectdetailName(each.getCart_dd_num());
						if(buydetail == null){
							
						System.out.println("each.getCart_dd_num() : "+each.getCart_dd_num());
							buydetail = new BuyDetailBean(each.getCart_dd_num(), buydetail1.getDd_name(),
									each.getCart_price(), each.getCart_amount());
							System.out.println("buydetail1.getDd_name() : "+buydetail1.getDd_name());
						}
						
						System.out.println("each.getCart_dd_num()>>>>>"+each.getCart_dd_num());
						
						buydetail = new BuyDetailBean(each.getCart_dd_num(), buydetail1.getDd_name(),
								each.getCart_price(), each.getCart_amount());
						listc.add(buydetail);
						buydetail = null;
					}
				
				}
				//------------------------------------
				
				int resinfo = buyService.InsertBuyInfoList(buy);
				int updateAmount = buyService.minorAmount(listc);
				
				
				int resDetail = buyService.insertBuyDetail(listc);

				
				if (updateAmount > 0) {
					System.out.println("updateAmount 수정 완료");
				} else {
					System.out.println("updateAmount 수정 실패");
				}
				if (resinfo > 0) {
					System.out.println(" info 저장 완료");
				} else {
					System.out.println("info 저장실패");
				}

				if (resDetail > 0) {
					System.out.println("detail 저장 완료");
				} else {
					System.out.println("detail 저장실패");
				}
				
				MemberBean mem = new MemberBean(memberNum.getM_num(), point);
				int memUpdate = service.updatememPoint(mem);
				if (memUpdate > 0) {
					System.out.println("member point 감소 및 쌓기 성공");
				} else {
					System.out.println("member point 수정 실패");
				}
				//------------------------------------
				mav.setViewName("/home");
			} else {
				mav.setViewName("/home");
			}
			
			return mav;

		}
		
		//cart ------------------------------------------------------
		
		
//	=============================================================================================
//	=================================================================
//	[개인정보 수정 (신정훈)]
	
	@RequestMapping("memInfo")
	public ModelAndView memInfo() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("center", centerPath + "memInfo.jsp");
		mav.setViewName("home");
		return mav;
	}
	
	@RequestMapping("memModify")
	public ModelAndView goModi(MemberBean mem,
			@RequestParam(value="postCode", required=false) String postCode
			,@RequestParam(value="roadAddress", required=false) String roadAddress
			,@RequestParam(value="detailAddress", required=false) String detailAddress){
		
		 ModelAndView mav = new ModelAndView();
		 
		 if(mem.getM_name() == "" || mem.getM_phone2() == "" || mem.getM_phone3() == "" || mem.getM_name() == "" 
					|| postCode == "" || roadAddress == ""){
			 
				mav.addObject("msg","빠짐없이 값을 입력하세요.");
				
				mav.addObject("center", centerPath + "memModi.jsp");
				
				mav.setViewName("home");
				
				return mav;
			}
		
		 if(!mem.getM_pw().equals(mem.getM_pwCheck())){
			 	
			 	mav.addObject("msg","비밀번호를 일치 시켜 주세요.");
				
				mav.addObject("center", centerPath + "memModi.jsp");
				
				mav.setViewName("home");
		 }
		 
		 mem.setM_addr(postCode+") "+roadAddress+" "+detailAddress);
		 
		 String pwPtn = "^([a-zA-Z]+[0-9]+[a-zA-Z0-9]*|[0-9]+[a-zA-Z]+[a-zA-Z0-9]*)$";
		 Pattern p4 = Pattern.compile(pwPtn);
		 Matcher m4 = p4.matcher(mem.getM_pw());
		 if(!m4.matches()){
		 	mav.addObject("msg","패스워드 형식에 맞지 않습니다.");
		 	mav.addObject("center", centerPath + "memModi.jsp");
		 	mav.setViewName("home");
		 	return mav; 
		 }
		 String namePtn = "[가-힣]{2,4}";
			Pattern pcName = Pattern.compile(namePtn);
			Matcher mcName = pcName.matcher(mem.getM_name());
			if(!mcName.matches()){
				
				mav.addObject("msg","한글로 이름을 두글자 이상 네글자이하로 작성");
				
				mav.addObject("center", centerPath + "memModi.jsp");
				
				mav.setViewName("home");
				
				return mav; 
			}
			String phonePtn2 = "(?:\\d{3}|\\d{4})";
			 Pattern p2 = Pattern.compile(phonePtn2);
			 Matcher m2 = p2.matcher(mem.getM_phone2());
			 
			 if(!m2.matches()) {
				 mav.addObject("msg","전화번호 형식을 맞추어 주세요.");
				 mav.addObject("center", centerPath + "memModi.jsp");
				 mav.setViewName("home");
				 return mav;
			 }
			 
			 String phonePtn3 = "\\d{4}$";
			 Pattern p3 = Pattern.compile(phonePtn3);
			 Matcher m3 = p3.matcher(mem.getM_phone3());
			 
			 if(!m3.matches()) {
				 mav.addObject("msg","전화번호 형식을 맞추어 주세요.");
				 mav.addObject("center", centerPath + "memModi.jsp");
				 mav.setViewName("home");
				 return mav;
			 } 
			 
			 mem.setM_phone(mem.getM_phone1()+"-"+mem.getM_phone2()+"-"+mem.getM_phone3());
			 
			 System.out.println("num=========="+mem.getM_num()
					 +"  phone=========="+mem.getM_phone());
			 
			 int res = service.memUpdate(mem);
			 if(res > 0){
				 mav.addObject("msg","수정을 완료했습니다.");
			 }else{
				 mav.addObject("msg","수정 실패");
			 }
			 
			 mav.addObject("center", centerPath + "Myshipping.jsp");
			 mav.setViewName("home");
			 return mav; 
	}
	
	@RequestMapping("memPerModi")
	public ModelAndView gomodi(Integer m_num){
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("center", centerPath + "memModi.jsp");
		mav.setViewName("home");
		return mav;
		
	}
	
	@RequestMapping(value="pwCheck", method=RequestMethod.POST)
	public ModelAndView pwCheck(MemberBean mem){
		
		ModelAndView mav = new ModelAndView();
		
		 String pwPtn = "^([a-zA-Z]+[0-9]+[a-zA-Z0-9]*|[0-9]+[a-zA-Z]+[a-zA-Z0-9]*)$";
		 Pattern p4 = Pattern.compile(pwPtn);
		 Matcher m4 = p4.matcher(mem.getM_pw());
		 if(!m4.matches()){
		 	mav.addObject("msg","pwMismatch");
		 	mav.addObject("center", centerPath + "memModi.jsp");
		 	mav.setViewName("jsonView");
		 	return mav;  
		 }else{
			mav.addObject("msg","pwSucc");
			mav.addObject("center", centerPath + "memModi.jsp");
			mav.setViewName("jsonView");
			return mav;
		}
		 
	}
	
	
	@RequestMapping(value="modiName", method=RequestMethod.POST)
	public ModelAndView modiName(MemberBean mem){
		
		ModelAndView mav = new ModelAndView();
		
		String namePtn = "[가-힣]{2,4}";
		Pattern pcName = Pattern.compile(namePtn);
		Matcher mcName = pcName.matcher(mem.getM_name());
		if(!mcName.matches()){
			mav.addObject("msg","nameMismatch");
			
			mav.addObject("center", centerPath + "memModi.jsp");
			
			mav.setViewName("jsonView");
			
			return mav; 
		}else{
			mav.addObject("msg","nameSuc");
			mav.addObject("center", centerPath + "memModi.jsp");
			
			mav.setViewName("jsonView");
			
			return mav;
		}
	}
	
	@RequestMapping(value="modiPhone2", method=RequestMethod.POST)
	public ModelAndView phone2(MemberBean mem){
		
		ModelAndView mav = new ModelAndView();
		
		 String phonePtn2 = "(?:\\d{3}|\\d{4})";
		 Pattern p2 = Pattern.compile(phonePtn2);
		 Matcher m2 = p2.matcher(mem.getM_phone2());
		 
		 if(!m2.matches()) {
			 System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
			 mav.addObject("msg","phoneMis2");
			 mav.addObject("center", centerPath + "memModi.jsp");
			 mav.setViewName("jsonView");
			 return mav;
		 }else{
			 mav.addObject("msg","phoneSuc2");
			 mav.addObject("center", centerPath + "memModi.jsp");
			 mav.setViewName("jsonView");
			 return mav;
		 }
	}
	
	@RequestMapping(value="modiPhone3", method=RequestMethod.POST)
	public ModelAndView phone3(MemberBean mem){
		
		 ModelAndView mav = new ModelAndView();
		 
		 String phonePtn3 = "\\d{4}$";
		 Pattern p3 = Pattern.compile(phonePtn3);
		 Matcher m3 = p3.matcher(mem.getM_phone3());
		 
		 if(!m3.matches()) {
			 mav.addObject("msg","phoneMis3");
			 mav.addObject("center", centerPath + "corpJoin.jsp");
			 mav.setViewName("jsonView");
			 return mav;
		 }else{
			 mav.addObject("msg","phoneSuc3");
			 mav.addObject("center", centerPath + "corpJoin.jsp");
			 mav.setViewName("jsonView");
			 return mav;
		 }
	}
	
	
//	=================================================================
//	[자주묻는 질문 (신정훈)]
	
	@RequestMapping("everyQnA")
	public ModelAndView goEveryQnA(){
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("center", centerPath + "everyQnA.jsp");
		mav.setViewName("home");
		return mav;
	}
	
	@RequestMapping("phonePopupp")
	public ModelAndView goPhonePopup(){
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("memPage/center/phonePopupp");
		return mav;
		
	}
	@RequestMapping("phonePopup2")
	public ModelAndView goPhonePopup2(
			@RequestParam(value="title", required=false) String title
			,@RequestParam(value="content", required=false) String content
			){
		
		ModelAndView mav = new ModelAndView();
		
		
		mav.addObject("title",title);
		mav.addObject("content",content);
		mav.setViewName("memPage/center/phonePopupp");
		return mav;
		
	}
	
	@RequestMapping("insertMemo")
	public ModelAndView goInsertPhone(MemberBean mem,
			@RequestParam String m_memo1,@RequestParam String m_memo2,HttpSession session){
		String m_memo = "";
		
//		System.out.println(m_memo1);
//		System.out.println(m_memo2);
//		System.out.println(mem.getM_num());
		
		
		
//		if(m_memo1){
//			
//		}
		
		ModelAndView mav = new ModelAndView();
		
		mem = service.getMemo(mem.getM_num());
		
		if(mem.getM_memo() != null){
			m_memo = mem.getM_memo();
		}
		
		m_memo += ",/,"+m_memo1+",,,"+m_memo2+"///";
		
		mem.setM_memo(m_memo);
		
		
		int res = service.insertMemo(mem);
		
		if(res > 0){
			mav.addObject("msg","전화 등록 완료");
			MemberBean mmmm = (MemberBean)session.getAttribute("memLogin");
			session.setAttribute("memLogin", service.getCheckMemMemo(mmmm));
			System.out.println("bbbbbbbbbbbbbbbbb"+mmmm.getM_num());
		}else{
			mav.addObject("msg","전화 등록 실패");
		}
		
		mav.addObject("closer","closer");
		mav.addObject("center", centerPath + "phonePopupp.jsp");
		mav.setViewName("home");
		
		return mav;
		
	}
	
	@RequestMapping("DelQnA")
	public ModelAndView delQnARe(MemberBean mem,
			@RequestParam (value="review",required=false)String review,
			@RequestParam (value="title",required=false)String title,
			@RequestParam (value="content",required=false)String content
			, HttpSession session){
		ModelAndView mav = new ModelAndView();
		String reWord = "";
		String beStr = "";
		String afStr = "";
		String total = "";
		System.out.println(review);
		System.out.println(title);
		System.out.println(content);
		
		MemberBean memCheck = service.getCheckMemMemo(mem);
		if((memCheck.getM_memo().split("///").length) != 1 ){
				for(int i=0;i<memCheck.getM_memo().split("///").length ;i++){
				
				if(memCheck.getM_memo().split("///")[i].equals(review+",/,"+title+",,,"+content)){
					
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
				System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
				total = beStr+reWord+afStr;
		}	
			
		mem.setM_memo(total);
		
		System.out.println("total=========================="+total);
		
		int res = service.delMemo(mem);
		
		if(res > 0){
			mav.addObject("msg","질문 삭제 완료");
			
			MemberBean mmmm = (MemberBean)session.getAttribute("memLogin");
			session.setAttribute("memLogin", service.getCheckMemMemo(mmmm));
			System.out.println("bbbbbbbbbbbbbbbbb"+mmmm.getM_num());
		}else{
			mav.addObject("msg","질문 삭제 실패");
		}
		
		mav.setViewName("redirect:everyQnA");
		
		return mav;
	}
	
	
	@RequestMapping("DelQnA2")
	public ModelAndView delQnARe2(MemberBean mem,
			@RequestParam (value="title",required=false)String title,
			@RequestParam (value="content",required=false)String content
			, HttpSession session){
		ModelAndView mav = new ModelAndView();
		String reWord = "";
		String beStr = "";
		String afStr = "";
		String total = "";
//		System.out.println(mem.getM_num());
//		System.out.println(title);
//		System.out.println(content);
		
		MemberBean memCheck = service.getCheckMemMemo(mem);
		if((memCheck.getM_memo().split("///").length) != 1 )
		{
				for(int i=0;i<memCheck.getM_memo().split("///").length ;i++){
				
				if(memCheck.getM_memo().split("///")[i].equals(",/,"+title+",,,"+content)){
					
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
				
				System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
				total = beStr+reWord+afStr;
		}	
			
		mem.setM_memo(total);
		
		System.out.println("total=========================="+total);
		
		int res = service.delMemo(mem);
		
		if(res > 0){
			mav.addObject("msg","질문 삭제 완료");
			MemberBean mmmm = (MemberBean)session.getAttribute("memLogin");
			session.setAttribute("memLogin", service.getCheckMemMemo(mmmm));
		}else{
			mav.addObject("msg","질문 삭제 실패");
		}
		
		mav.setViewName("redirect:everyQnA");
		
		return mav;
	}
	
	
	
	
	
	
	@RequestMapping("modiQnA")
	public ModelAndView modiQnA(MemberBean mem,
			@RequestParam (value="title",required=false)String beTitle,
			@RequestParam (value="content",required=false)String afContent,
			@RequestParam String m_memo1,
			@RequestParam String m_memo2
			,HttpSession session){
		ModelAndView mav = new ModelAndView();
		String reWord = "";
		String beStr = "";
		String afStr = "";
		String total = "";
//		System.out.println(mem.getM_num());
//		
//		System.out.println(beTitle);
//		System.out.println(afContent);
//		System.out.println(m_memo1);
//		System.out.println(m_memo2);
		
		
		MemberBean memCheck = service.getCheckMemMemo(mem);
//		if((memCheck.getM_memo().split("///").length) != 1 ){
				for(int i=0;i<memCheck.getM_memo().split("///").length ;i++){
				
				if(memCheck.getM_memo().split("///")[i].equals(",/,"+beTitle+",,,"+afContent)){
					
					reWord = ",/,"+m_memo1+",,,"+m_memo2+"///";
					
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
				
				System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
				total = beStr+reWord+afStr;
//		}	
			
		mem.setM_memo(total);
		
		System.out.println("total=========================="+total);
		
		int res = service.delMemo(mem);
		
		if(res > 0){
			mav.addObject("msg","질문 수정 완료");
			MemberBean mmmm = (MemberBean)session.getAttribute("memLogin");
			session.setAttribute("memLogin", service.getCheckMemMemo(mmmm));
		}else{
			mav.addObject("msg","질문 수정 실패");
		}
		
		mav.addObject("closer","closer");
		mav.addObject("center", centerPath + "phonePopupp.jsp");
		mav.setViewName("home");
		
		return mav;
	}
	
	
	
	
	
}// (Controller) class END
