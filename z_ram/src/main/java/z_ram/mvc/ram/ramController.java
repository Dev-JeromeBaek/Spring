package z_ram.mvc.ram;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import z_ram.mvc.ram.bean.ramBean;
import z_ram.mvc.ram.module.FileWorks;
import z_ram.mvc.ram.service.ramService;

@Controller
public class ramController {

	@Autowired
	private ramService service;
	@Autowired
	private FileWorks fileModule;
	
	
	@RequestMapping(value="/yeobInfo", method=RequestMethod.GET)
	public String gogogoyeobInfo() {
		return "yeobInfo";
	}
	
//	[insertOne 페이지로 go~!]
	@RequestMapping(value="/insertOne", method=RequestMethod.GET)
	public String getInsertOne() {
		return "insertOne";
	}
	
//	[정보 입력]
	@RequestMapping(value="/insertOne", method=RequestMethod.POST)
	public ModelAndView postInsertOne(MultipartHttpServletRequest mreq) {
		
		String name = mreq.getParameter("name");
		Integer price = Integer.parseInt(mreq.getParameter("price"));
		String expl = mreq.getParameter("expl");
		ramBean ram = new ramBean(name, price, expl);
		
		if(!mreq.getFile("upfile").isEmpty()) {
			MultipartFile upfile = mreq.getFile("upfile");
			String sysName = fileModule.upLoadAndGetSysName(upfile);
			ram.setOrgName(upfile.getOriginalFilename());
			ram.setSysName(sysName);
		} else {
			ram.setOrgName(null);
			ram.setSysName(null);
		}
		
		int res = service.insertOne(ram);
		ModelAndView mav = new ModelAndView();
		String msg = res > 0 ? "저장 성공" : "저장 실패";
		
		mav.addObject("msg", msg);
		mav.setViewName("home");
		return mav;
	}
	
	@RequestMapping("selectList")
	public ModelAndView selectList() {
		List<ramBean> listc = service.selectList();
		ModelAndView mav = new ModelAndView();
		mav.addObject("listc", listc);
		mav.setViewName("selectList");
		return mav;
	}
	
	@RequestMapping("selectOne")
	public ModelAndView selectOne(@RequestParam Integer num) {
		
		ramBean ram = service.selectOne(num);
		ModelAndView mav = new ModelAndView();
		mav.addObject("ram", ram);
		mav.setViewName("selectOne");
		return mav;
	}
	
	@RequestMapping(value="updateOne", method=RequestMethod.GET)
	public ModelAndView getUpdateOne(@RequestParam Integer num) {
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("ram", service.selectOne(num));
		mav.setViewName("updateOne");
		return mav;
	}
	
	@RequestMapping(value="updateOne", method=RequestMethod.POST)
	public ModelAndView postUpdateOne(MultipartHttpServletRequest mreq) {
		
		System.out.println("num : " + mreq.getParameter("num"));
		
		Integer num = Integer.parseInt(mreq.getParameter("num"));
		String newName = mreq.getParameter("name");
		Integer newPrice = Integer.parseInt(mreq.getParameter("price"));
		String newExpl = mreq.getParameter("expl");
		ramBean newRam = new ramBean(newName, newPrice, newExpl);
		
		String sysName = mreq.getParameter("sysName");
		
		MultipartFile upfile = mreq.getFile("upfile");
		sysName = fileModule.updateAndGetSysName(upfile, sysName);
		newRam.setOrgName(upfile.getOriginalFilename());
		newRam.setSysName(sysName);
		
		newRam.setNum(num);
		
		int res = service.updateOne(newRam);
		List<ramBean> listc = service.selectList();
		ModelAndView mav = new ModelAndView();
		String msg = res > 0 ? "수정 성공" : "수정 실패";
		
		mav.addObject("msg", msg);
		mav.addObject("listc", listc);
		mav.setViewName("selectList");
		return mav;
	}
	
	@RequestMapping("deleteOne")
	public ModelAndView deleteOne(@RequestParam Integer num) {
		String sysName = service.selectOne(num).getSysName();
		int res = service.deleteOne(num);
		String msg = "";
		if(res > 0) {
			msg = "삭제 성공";
			fileModule.deleteFile(sysName);
		} else {
			msg = "삭제 실패";
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("listc", service.selectList());
		mav.setViewName("selectList");
		return mav;
	}
	
	@RequestMapping("downLoad")
	public void downLoad(
			@RequestParam Integer num, HttpServletResponse response) {
		ramBean ram = service.selectOne(num);
		String orgName = ram.getOrgName();
		String sysName = ram.getSysName();
		fileModule.downLoad(orgName, sysName, response);
	}
	
//	@RequestMapping("downLoad")
//	public ModelAndView downLoad(
//			@RequestParam Integer num, HttpServletResponse response) {
//		ramBean ram = service.selectOne(num);
//		String orgName = ram.getOrgName();
//		String sysName = ram.getSysName();
//		fileModule.downLoad(orgName, sysName, response);
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName("selectList");
//		return mav;
//	}
	
	
}// (Controller) class END
