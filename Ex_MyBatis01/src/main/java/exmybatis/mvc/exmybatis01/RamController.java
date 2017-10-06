package exmybatis.mvc.exmybatis01;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import exmybatis.mvc.exmybatis01.bean.RamBean;
import exmybatis.mvc.exmybatis01.module.FileWorks;
import exmybatis.mvc.exmybatis01.repository.RamRepository;

@Controller
public class RamController {
	
	@Autowired
	private RamRepository repository;
	
	@Autowired
	private FileWorks fileWorks;
	
	@RequestMapping(value="insertOne", method=RequestMethod.GET)
	public String getInsertOne() {
		return "insertOne";
	}
	
	@RequestMapping(value="insertOne")
	public ModelAndView postInsertOne(MultipartHttpServletRequest mulRequest) {
		
		String name = mulRequest.getParameter("name");
		int price = Integer.parseInt(mulRequest.getParameter("price"));
		String expl = mulRequest.getParameter("expl");
		RamBean rbean = new RamBean(name, price, expl);
		
		MultipartFile upfile = mulRequest.getFile("upfile");
		String sysName = fileWorks.upLoadAndGetSysName(upfile);
		
		rbean.setSysName(sysName);
		rbean.setOrgName(upfile.getOriginalFilename());
		
		int res = repository.insertOne(rbean);
		ModelAndView mav = new ModelAndView();
		
		String msg = res > 0 ? "등록 완료" : "등록 실패";
		
		mav.addObject("msg", msg);
		mav.setViewName("home");
		
		return mav;
	}
}
