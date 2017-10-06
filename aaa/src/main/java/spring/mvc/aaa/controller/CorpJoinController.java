package spring.mvc.aaa.controller;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.aaa.bean.BuyBean;
import spring.mvc.aaa.bean.Corp;
import spring.mvc.aaa.bean.Deal_Info;
import spring.mvc.aaa.service.BuyService;
import spring.mvc.aaa.service.CorpService;
import spring.mvc.aaa.service.DealService;
import spring.mvc.aaa.service.NoticeService;

@Controller
@RequestMapping("corpJoin")
public class CorpJoinController {
	
	@Autowired
	private CorpService service;	
	@Autowired
	private NoticeService noService;
	@Autowired
	private DealService dealService;
	@Autowired
	private BuyService buyService;
	
	private String logPath = "/WEB-INF/views/corpPage/top/";
	private String leftPath = "/WEB-INF/views/corpPage/left/";
	private String centerPath = "/WEB-INF/views/corpPage/center/";
	private String rightPath = "/WEB-INF/views/corpPage/right/";
	
	@RequestMapping("/home")
	public ModelAndView home() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("notice",noService.selectList());
		
		mav.setViewName("home");
		return mav;
	}
	
	@RequestMapping("jusoPopup")
	public ModelAndView jusoPopup(){
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("corpPage/center/jusoPopup");
		return mav;
	}
	@RequestMapping("jusoPopup2")
	public ModelAndView jusoPopup2(){
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("jusoPopup2");
		return mav;
	}
	
	@RequestMapping(value="Home", method = RequestMethod.GET)
	public String Home(){
		
		return "home";
	}
	
	@RequestMapping(value="corpJoin", method = RequestMethod.GET)
	public ModelAndView corpJoinInform(){
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("center", centerPath + "corpJoin.jsp");
		
		mav.setViewName("home");
		
		return mav;
	}
	
	@RequestMapping(value="corpJoin", method = RequestMethod.POST)
	public ModelAndView corpJoin(Corp corp,
			@RequestParam(value="postCode", required=false) String postCode
			,@RequestParam(value="roadCode", required=false) String roadCode
			,@RequestParam(value="addrDetail", required=false) String addrDetail){
		
		ModelAndView mav = new ModelAndView();

		if(corp.getC_bn() == "" || corp.getC_pw() == "" || corp.getC_name() == "" || corp.getC_ceo() == "" 
				|| corp.getC_tel() == "" || corp.getC_phone() == "" || corp.getC_addr() == ""
				|| postCode == "" || roadCode == ""){
			mav.addObject("msg","빠짐없이 값을 입력하세요.");
			
			mav.addObject("center", centerPath + "corpJoin.jsp");
			
			mav.setViewName("home");
			
			return mav;
		}
		
		 
		 String c_name = "[가-힣a-zA-Z]{2,9}";
		 Pattern pName = Pattern.compile(c_name);
		 Matcher mName = pName.matcher(corp.getC_name());
		 if(!mName.matches()){
			 mav.addObject("msg","회사명을 정확히 입력하세요.");
			 
			 mav.addObject("center", centerPath + "corpJoin.jsp");
			 
			 mav.setViewName("home");
			 
			 return mav; 
		 }
		 
		 
		String c_ceo = "[가-힣]{2,4}";
		Pattern pcName = Pattern.compile(c_ceo);
		Matcher mcName = pcName.matcher(corp.getC_ceo());
		if(!mcName.matches()){
			mav.addObject("msg","대표자 성명을 정확히 입력하세요.");
			
			mav.addObject("center", centerPath + "corpJoin.jsp");
			
			mav.setViewName("home");
			
			return mav; 
		}
		String c_addr = postCode+")"+" "+roadCode+" "+addrDetail;
		corp.setC_addr(c_addr);
		
		Corp corpCheck = service.corpBnCheck(corp);
		
		if(corpCheck != null){
			mav.addObject("msg","중복된 사업자 번호 입니다.");
			
			mav.addObject("center", centerPath + "corpJoin.jsp");
			
			mav.setViewName("home");
			
			return mav;
		}

		if(!corp.getC_pw().equals(corp.getC_pwCheck())){
				mav.addObject("msg","비밀번호를 일시 시켜 입력해주세요.");
				mav.addObject("center", "/WEB-INF/views/corpJoin.jsp");
				
				mav.setViewName("home");
				
				return mav;
			}
		
		 String pwPtn = "^([a-zA-Z]+[0-9]+[a-zA-Z0-9]*|[0-9]+[a-zA-Z]+[a-zA-Z0-9]*)$";
		 Pattern p4 = Pattern.compile(pwPtn);
		 Matcher m4 = p4.matcher(corp.getC_pw());
		 if(!m4.matches()){
			 mav.addObject("msg","비밀번호에 알파벳과 숫자를 넣어 넣어주세요. ");
				mav.addObject("center", centerPath + "corpJoin.jsp");
				
				mav.setViewName("home");
				
				return mav; 
		 }
		
		 corp.setC_pw(corp.getC_pw());
		
		 String phonePtn2 = "(?:\\d{3}|\\d{4})";
		 Pattern p2 = Pattern.compile(phonePtn2);
		 Matcher m2 = p2.matcher(corp.getC_phone2());
		
		 String phonePtn3 = "\\d{4}$";
		 Pattern p3 = Pattern.compile(phonePtn3);
		 Matcher m3 = p3.matcher(corp.getC_phone3());
		 
		 if(!m2.matches() || !m3.matches()) {
			 mav.addObject("msg","핸드폰 번호를 형식에 맞게 입력하세요.");
			 mav.addObject("center", centerPath + "corpJoin.jsp");
			 mav.setViewName("home");
			 return mav;
		 }

		 String telPtn2 = "(?:\\d{3}|\\d{4})";
		 Pattern p22 = Pattern.compile(telPtn2);
		 Matcher m22 = p22.matcher(corp.getC_tel2());

		 String telPtn3 =  "\\d{4}$";
		
		 Pattern p33 = Pattern.compile(telPtn3);
		 Matcher m33 = p33.matcher(corp.getC_tel3());
		 System.out.println(corp.getC_tel3());
		 
		 if(!m22.matches() || !m33.matches()) {
			 mav.addObject("msg","회사 전화 번호를 형식에 맞게 입력하세요.");
			 mav.addObject("center", centerPath + "corpJoin.jsp");
			 mav.setViewName("home");
			 return mav;
		 }
		corp.setC_tel(corp.getC_tel1()+"-"+corp.getC_tel2()+"-"+corp.getC_tel3()); 
		corp.setC_phone(corp.getC_phone1()+"-"+corp.getC_phone2()+"-"+corp.getC_phone3());
		
		int res = service.corpJoin(corp);
		
		if(res>0){
			mav.addObject("msg","가입 완료");
		}else{
			mav.addObject("msg","가입 실패");
		}
		mav.addObject("center", centerPath + "corpLogin.jsp");
		
		mav.setViewName("home");
		
		return mav;
	}
	
	@RequestMapping(value="bnCheck", method = RequestMethod.POST)
	public ModelAndView bnCheck(Corp corp){
		ModelAndView mav = new ModelAndView();
		
		Corp corpCheck =  service.corpBnCheck(corp);
		if(corpCheck != null){
			System.out.println();
			mav.addObject("msg","overlab");
			mav.addObject("center", centerPath + "corpJoin.jsp");
			mav.setViewName("jsonView");
			return mav;
		}
		
		String bnPtn = "[0-9]{3}-?[0-9]{2}-?[0-9]{5}";
		Pattern pbn = Pattern.compile(bnPtn);
		Matcher mbn = pbn.matcher(corp.getC_bn());
		
		if(!mbn.matches()) {
			 mav.addObject("msg","misMath");
			 mav.addObject("center", centerPath + "corpJoin.jsp");
			 mav.setViewName("jsonView");
			 return mav;
		 }else{
			mav.addObject("msg","suc");
			mav.addObject("center", centerPath + "corpJoin.jsp");
			mav.setViewName("jsonView");
			return mav;
		 }
		
		
	}
	
	@RequestMapping(value="compName", method=RequestMethod.POST)
	public ModelAndView compName(Corp corp){
		
		ModelAndView mav = new ModelAndView();
		
		 String c_name = "[가-힣a-zA-Z]{2,9}";
		 Pattern pName = Pattern.compile(c_name);
		 Matcher mName = pName.matcher(corp.getC_name());
		 
		 if(!mName.matches()){
			 mav.addObject("msg","compNameCheck");
			 	
			 mav.addObject("center", centerPath + "corpJoin.jsp");
			 	
			 mav.setViewName("jsonView");
			 	
			 return mav; 
		 }else{
			 mav.addObject("msg","compSucc");
			 mav.addObject("center", centerPath + "corpJoin.jsp");
			 
			 mav.setViewName("jsonView");
			 
			 return mav;
		 }
	}
	
	@RequestMapping(value="ceoName", method=RequestMethod.POST)
	public ModelAndView ceoName(Corp corp){
		
		ModelAndView mav = new ModelAndView();
		
		String c_ceo = "[가-힣]{2,4}";
		Pattern pcName = Pattern.compile(c_ceo);
		Matcher mcName = pcName.matcher(corp.getC_ceo());
		if(!mcName.matches()){
			mav.addObject("msg","ceoMismatch");
			
			mav.addObject("center", centerPath + "corpJoin.jsp");
			
			mav.setViewName("jsonView");
			
			return mav; 
		}else{
			mav.addObject("msg","ceoSuc");
			mav.addObject("center", centerPath + "corpJoin.jsp");
			
			mav.setViewName("jsonView");
			
			return mav;
		}
	}
	
	
	@RequestMapping(value="comTel2", method=RequestMethod.POST)
	public ModelAndView comPhone21(Corp corp){
		
		ModelAndView mav = new ModelAndView();
		
		 String telPtn2 = "(?:\\d{3}|\\d{4})";
		 Pattern p22 = Pattern.compile(telPtn2);
		 Matcher m22 = p22.matcher(corp.getC_tel2());
		 
		 if(!m22.matches()) {
			 mav.addObject("msg","comTelMis2");
			 mav.addObject("center", centerPath + "corpJoin.jsp");
			 mav.setViewName("jsonView");
			 return mav;
		 }else{
			 mav.addObject("msg","comTelSuc2");
			 mav.addObject("center", centerPath + "corpJoin.jsp");
			 mav.setViewName("jsonView");
			 return mav;
		 }
	}
	
	@RequestMapping(value="comTel3", method=RequestMethod.POST)
	public ModelAndView comPhone2(Corp corp){
		
		ModelAndView mav = new ModelAndView();

		 String telPtn3 =  "\\d{4}$";
		 Pattern p33 = Pattern.compile(telPtn3);
		 Matcher m33 = p33.matcher(corp.getC_tel3());
		 
		 if(!m33.matches()) {
			 mav.addObject("msg","comTelMis3");
			 mav.addObject("center", centerPath + "corpJoin.jsp");
			 mav.setViewName("jsonView");
			 return mav;
		 }else{
			 mav.addObject("msg","comTelSuc3");
			 mav.addObject("center", centerPath + "corpJoin.jsp");
			 mav.setViewName("jsonView");
			 return mav;
		 }
	}
	
	@RequestMapping(value="phone2", method=RequestMethod.POST)
	public ModelAndView phone2(Corp corp){
		
		ModelAndView mav = new ModelAndView();
		
		 String phonePtn2 = "(?:\\d{3}|\\d{4})";
		 Pattern p2 = Pattern.compile(phonePtn2);
		 Matcher m2 = p2.matcher(corp.getC_phone2());
		 
		 if(!m2.matches()) {
			 mav.addObject("msg","phoneMis2");
			 mav.addObject("center", centerPath + "corpJoin.jsp");
			 mav.setViewName("jsonView");
			 return mav;
		 }else{
			 mav.addObject("msg","phoneSuc2");
			 mav.addObject("center", centerPath + "corpJoin.jsp");
			 mav.setViewName("jsonView");
			 return mav;
		 }
	}
	
	
	@RequestMapping(value="phone3", method=RequestMethod.POST)
	public ModelAndView phone3(Corp corp){
		
		 ModelAndView mav = new ModelAndView();
		 
		 String phonePtn3 = "\\d{4}$";
		 Pattern p3 = Pattern.compile(phonePtn3);
		 Matcher m3 = p3.matcher(corp.getC_phone3());
		 
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
	
	@RequestMapping(value="corpLogin", method=RequestMethod.GET)
	public ModelAndView corpLoginInform(@RequestParam(value="msg", required=false)String msg){
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("msg",msg);
		mav.addObject("center", centerPath + "corpLogin.jsp");
		
		mav.setViewName("home");
		
		return mav;
	}
	
	@RequestMapping("corpLoginn")
	public ModelAndView corpLogin(Corp corp, HttpSession session, @RequestParam(value="c_bn", required=false) String c_bn, @RequestParam(value="c_pw", required=false) String c_pw){
//		if(session.getAttribute("corpLogin") != null) {
//			session.removeAttribute("corpLogin");
//		}
//		
		ModelAndView mav = new ModelAndView();
		
		if(corp.getC_bn() == "" || corp.getC_pw() == ""){
			mav.addObject("msg","공백없이 입력하세요.");
			mav.addObject("center", centerPath + "corpLogin.jsp");
			
			mav.setViewName("home");
			return mav;
		}
		
		Corp corpLog = service.corpLogin(corp);
		if(corpLog != null){
			
			List<BuyBean> buyCount = buyService.selectMySalesList(corpLog.getC_num());
			System.out.println(buyCount.size());
			if(!buyCount.isEmpty()) {
				if(buyCount.size() < 5) corpLog.setC_grade(6);
				if(buyCount.size() < 10) corpLog.setC_grade(5);
				if(buyCount.size() < 15) corpLog.setC_grade(4);
				if(buyCount.size() < 20) corpLog.setC_grade(3);
				if(buyCount.size() < 25) corpLog.setC_grade(2);
				if(buyCount.size() < 30) corpLog.setC_grade(1);
			}
			int res = service.modifyCorpGrade(corpLog);
			if(res > 0) {
				System.out.println("등급 수정 완료");
			} else {
				System.out.println("등급 수정 실패");
			}
			session.setAttribute("corpLogin",service.selectCorpOne(corpLog.getC_num()));
			mav.addObject("msg",corpLog.getC_bn()+"님 환영해요.");
			mav.setViewName("redirect:Home");
			return mav;
		}else{
			mav.addObject("msg","일치하는 정보가 없습니다.");
			mav.addObject("center", centerPath + "corpLogin.jsp");
		}
		mav.setViewName("home");
		return mav;
	}
	
	@RequestMapping(value="pwCheck", method=RequestMethod.POST)
	public ModelAndView pwCheck(Corp corp){
		
		ModelAndView mav = new ModelAndView();
		
		 String pwPtn = "^([a-zA-Z]+[0-9]+[a-zA-Z0-9]*|[0-9]+[a-zA-Z]+[a-zA-Z0-9]*)$";
		 Pattern p4 = Pattern.compile(pwPtn);
		 Matcher m4 = p4.matcher(corp.getC_pw());
		 System.out.println("0000000000000000");
		 if(!m4.matches()){
			System.out.println("111111111111111");
		 	mav.addObject("msg","mismatch");
		 	mav.addObject("center", centerPath + "corpJoin.jsp");
		 	mav.setViewName("jsonView");
		 	return mav; 
		 	
		 }else{
			mav.addObject("msg","succ");
			mav.addObject("center", centerPath + "corpJoin.jsp");
			mav.setViewName("jsonView");
			return mav;
		
		}
	}
}

