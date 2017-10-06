package exdb05.mvc.exdb05;

import java.util.ArrayList;
import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import exdb05.mvc.exdb05.bean.BeefBean;
import exdb05.mvc.exdb05.service.BeefService;

@Controller
public class BeefController {
	
	@Autowired
	private BeefService service;
	
	private String gogoSSing;
	private String maSSage;
	
	@RequestMapping(value="/yeobInfo", method=RequestMethod.GET)
	public String gogogoyeobInfo() {
		return "yeobInfo";
	}
	
	@RequestMapping(value="/insertOne", method=RequestMethod.GET)
	public String getInsertOne() {
		return "insertOne";
	}
	
	@RequestMapping(value="/insertOne", method=RequestMethod.POST)
	public ModelAndView postInsertOne(BeefBean pp) {
		
		int res = service.insertOne(pp);
		ModelAndView mav = new ModelAndView();
		maSSage = res > 0 ? "저장 성공" : "저장 실패";
		
		mav.addObject("maSSage", maSSage);
		mav.setViewName("home");
		return mav;
	}
	
	@RequestMapping("/selectList")
	public ModelAndView selectList() {
		
		ModelAndView mav = new ModelAndView();
		ArrayList<BeefBean> listc = service.selectList();
		mav.setViewName("selectList");
		mav.addObject("listc", listc);
		return mav;
	}
	
	@RequestMapping("/selectOne")
	public ModelAndView selectOne(@RequestParam(value="num") Integer num) {
		
		ModelAndView mav = new ModelAndView();
		BeefBean bb = service.selectOne(num);
		mav.setViewName("selectOne");
		mav.addObject("bb", bb);
		return mav;
	}
	
	@RequestMapping(value="/updateOne", method=RequestMethod.GET)
	public ModelAndView getUpdateOne(
						@RequestParam(value="num") Integer num) {
		ModelAndView mav = new ModelAndView();
//		BeefBean bb = new BeefBean(num, name, price, used);
//		@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
//		@@@@@@Today's 핵심코드@@@@@@@@@@
		mav.addObject("bb", service.selectOne(num));
//		@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		mav.setViewName("updateOne");
		return mav;
	}
	
	@RequestMapping(value="/updateOne", method=RequestMethod.POST)
	public ModelAndView postUpdateOne(BeefBean oldbb, 
									String name, Integer price, String used) {
		Integer num = oldbb.getNum();
		System.out.println("name : " + name);
		BeefBean newbb = new BeefBean(name, price, used);
		int res = service.updateOne(newbb, num);
//		@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		newbb = service.selectOne(num);
//		@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		newbb.setNum(num);
		ModelAndView mav = new ModelAndView();
		maSSage = res > 0 ? "수정 성공" : "수정 실패";
		
		mav.addObject("maSSage", maSSage);
		mav.addObject("bb", newbb);
		mav.setViewName("selectOne");
		return mav;
	}
	
	@RequestMapping("/deleteOne")
	public ModelAndView deleteOne(@RequestParam(value="num") Integer num) {
		int res = service.deleteOne(num);
		ModelAndView mav = new ModelAndView();
		maSSage = res > 0 ? "삭제 성공" : "삭제 실패";
		
		mav.addObject("maSSage", maSSage);
		mav.setViewName("home");
		return mav;
	}
	
	
	
}// (Controller) class END
