package spring.mvc.aaa.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.aaa.bean.MemberBean;
import spring.mvc.aaa.bean.QnaBean;
import spring.mvc.aaa.module.FileWorks;
import spring.mvc.aaa.service.AaaService;

@Controller
@RequestMapping("/yeob/")	// �봽濡쒖젥�듃紐낆쓣 紐낆떆�븷 寃껋엫.
public class AaaController {
	
	@Autowired
	private AaaService service;
	
	@Autowired
	private FileWorks fileWorks;
		
	private String topPath = "/WEB-INF/views/yeob/top/";
	private String leftPath = "/WEB-INF/views/yeob/left/";
	private String centerPath = "/WEB-INF/views/yeob/center/";
	private String rightPath = "/WEB-INF/views/yeob/right/";
	
	@RequestMapping("/home")
	public ModelAndView home() {
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("top", topPath + "topIndex.jsp");
		mav.addObject("left", leftPath + "leftIndex.jsp");
		mav.addObject("center", centerPath + "centerIndex.jsp");
		mav.addObject("right", rightPath + "rightIndex.jsp");
		
		mav.setViewName("home");
		return mav;
	}
	
	
	@RequestMapping("login")
	public ModelAndView login(HttpSession session){
		ModelAndView mav = new ModelAndView();
		MemberBean bb = new MemberBean("aabbid", "aabbpw", "aabbname" , "aabbaddr", "aabbphone", "aabbgender");
		bb.setM_num(11);
		session.setAttribute("memLogin", bb);
		JOptionPane.showMessageDialog(null, "로그인 되었습니다.");
		mav.addObject("top","/WEB-INF/views/memPage/top/topIndex.jsp");
		mav.setViewName("home");
		return mav;
	}
	
	
	@RequestMapping("needlogin")
	public ModelAndView needlogin(){
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("top", topPath + "topIndex.jsp");
		mav.addObject("left", leftPath + "leftIndex.jsp");
		mav.addObject("center", centerPath + "login.jsp");
		mav.addObject("right", rightPath + "rightIndex.jsp");
		mav.setViewName("home");
		return mav;
	}
	
	@RequestMapping("logout")
	public ModelAndView logout(HttpSession session){
		ModelAndView mav = new ModelAndView();
		session.removeAttribute("memLogin");
		JOptionPane.showMessageDialog(null, "로그이웃되었습니다.");
		mav.setViewName("home");
		return mav;
	}
	
	@RequestMapping("insertQnaForm")
	public ModelAndView insertQnaForm(HttpSession session){
		ModelAndView mav = new ModelAndView();
		
//		Member mem = service.selectOne();
		MemberBean mem = (MemberBean)session.getAttribute("memLogin");
		
		mav.addObject("member",mem);
		
		mav.addObject("top","/WEB-INF/views/memPage/top/topIndex.jsp");
		mav.addObject("center","/WEB-INF/views/memPage/center/writeQna.jsp");
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
		
		mav.addObject("top","/WEB-INF/views/memPage/top/topIndex.jsp");
		mav.addObject("center","/WEB-INF/views/memPage/center/qnaList.jsp");
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
		mav.addObject("top","/WEB-INF/views/memPage/top/topIndex.jsp");
		mav.addObject("center","/WEB-INF/views/memPage/center/qnaModify.jsp");
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
	
	
	@RequestMapping("adminLogin")
	public ModelAndView adminLogin(HttpSession session){
		ModelAndView mav = new ModelAndView();
		session.setAttribute("adminLogin", "admin55");
		JOptionPane.showMessageDialog(null, "관리자 로그인 되었습니다.");
		mav.addObject("top","/WEB-INF/views/adminPage/top/topIndex.jsp");
		mav.setViewName("home");
		return mav;
	}
	
	@RequestMapping("adminLogout")
	public ModelAndView adminLogout(HttpSession session){
		ModelAndView mav = new ModelAndView();
		session.removeAttribute("adminLogin");
		JOptionPane.showMessageDialog(null, "관리자 로그이웃되었습니다.");
		mav.setViewName("home");
		return mav;
	}
	
	@RequestMapping("adminQnaList")
	public ModelAndView adminQnaList(){
		ModelAndView mav = new ModelAndView();
		List<QnaBean> ansList = service.selectQnaAnsList();
		List<QnaBean> noAnsList = service.selectQnaNoAnsList();
		mav.addObject("noList",noAnsList);
		mav.addObject("ansList",ansList);
		mav.addObject("top","/WEB-INF/views/adminPage/top/topIndex.jsp");
		mav.addObject("center","/WEB-INF/views/adminPage/center/qnaList.jsp");
		mav.setViewName("home");
		return mav;
	}
	
	@RequestMapping(value="answerQna",method=RequestMethod.GET)
	public ModelAndView answerQnaForm(@RequestParam("q_num") Integer q_num){
		ModelAndView mav = new ModelAndView();
		QnaBean qna = service.selectQna(q_num);
		mav.addObject("qna", qna);
		mav.addObject("top","/WEB-INF/views/adminPage/top/topIndex.jsp");
		mav.addObject("center", "/WEB-INF/views/adminPage/center/answerQna.jsp");
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
	
}// (Controller) class END
