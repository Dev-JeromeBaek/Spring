package spring.mvc.spring13;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.spring13.bean.PeopleBean;
import spring.mvc.spring13.module.FileWorks;
import spring.mvc.spring13.service.PeopleService;

//	파일 업로드 시 필요 jar
//	- 필요 bean : multipartResolver -> 스프링에서 파일업로드를 인식하는 bean
//	- pom.xml : commons-fileupload 

@Controller
public class PeopleController {
	
	@Autowired
	private PeopleService service;
	
	@Autowired
	private FileWorks fileWorks;
	
	@RequestMapping(value="insertOne", method=RequestMethod.GET)
	public String getInsertOne() {
		return "j01_insertForm";
	}
	
	@RequestMapping(value="insertOne", method=RequestMethod.POST)
	public String postInserOne(
					MultipartHttpServletRequest mulRequest) {
		// @@@@@@@@@@@@@MultipartHttpServletRequest mulRequest@@@@@@@@@@@@@
		
		System.out.println("name : " + mulRequest.getParameter("name"));
		System.out.println("age : " + mulRequest.getParameter("age"));
		
		String name = mulRequest.getParameter("name");
		int age = Integer.parseInt(mulRequest.getParameter("age"));
		PeopleBean peoBean = new PeopleBean(name, age);
		
		//MultipartFile : 얘를 통해 파일을 받는다!
		MultipartFile upfile = mulRequest.getFile("upfile");
		String sysName = fileWorks.upLoadAndGetSysName(upfile);
		
		peoBean.setSysName(sysName);
		peoBean.setOrgName(upfile.getOriginalFilename());
		
		service.insertOne(peoBean);
		
		return "redirect:selectList";
	}
	
	@RequestMapping("selectList")
	public ModelAndView selectList() {
		
		ModelAndView mav = new ModelAndView();
		
		List<PeopleBean> listc = service.selectList();
		// generic을 Object로 설정해도 무방하다! 대신 형변환이 필요하겠쥬?
		mav.addObject("listc", listc);
		mav.setViewName("j02_selectList");
		
		return mav;
	}
	
	
}// (Controller) class END
