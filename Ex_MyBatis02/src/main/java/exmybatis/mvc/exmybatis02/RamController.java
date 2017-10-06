package exmybatis.mvc.exmybatis02;

import org.apache.log4j.nt.NTEventLogAppender;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import exmybatis.mvc.exmybatis02.bean.RamBean;
import exmybatis.mvc.exmybatis02.module.FileWorks;
import exmybatis.mvc.exmybatis02.repository.RamRepository;

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
	
	@RequestMapping(value="insertOne", method=RequestMethod.POST)
	public ModelAndView postInsertOne(MultipartHttpServletRequest mulReq) {
		
		String name = mulReq.getParameter("name");
		int price = Integer.parseInt(mulReq.getParameter("price"));
		String expl = mulReq.getParameter("expl");
		RamBean rbean = new RamBean(name, price, expl);
		
		MultipartFile upfile = mulReq.getFile("upfile");
		String sysname = fileWorks.upLoadAndGetSysName(upfile);
		
		rbean.setSysname(sysname);
		rbean.setOrgname(upfile.getOriginalFilename());
		
		int res = repository.insertOne(rbean);
		ModelAndView mav = new ModelAndView();
		
		String msg = res > 0 ? "등록 완료" : "등록 실패";
		
		mav.addObject("msg", msg);
		mav.setViewName("home");
		
		return mav;
	}
}
