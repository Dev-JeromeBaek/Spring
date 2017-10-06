package spring.mvc.aaa.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.junit.runner.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.aaa.bean.Deal_Detail;
import spring.mvc.aaa.bean.Deal_Info;
import spring.mvc.aaa.bean.LocalBean;
import spring.mvc.aaa.bean.ReviewBean;
import spring.mvc.aaa.module.FileWorks;
import spring.mvc.aaa.service.CorpService;
import spring.mvc.aaa.service.DealService;
import spring.mvc.aaa.service.LocalService;
import spring.mvc.aaa.service.ReviewService;

@Controller
@RequestMapping("/local/")
public class LocaController {

	@Autowired
	private LocalService service;
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private FileWorks fileWorks;

	private String logPath = "/WEB-INF/views/adminPage/top/beforeLog.jsp";
	private String leftPath = "/WEB-INF/views/yeob/left/leftIndex.jsp";
	private String centerPath = "/WEB-INF/views/localPage/";
	private String rightPath = "/WEB-INF/views/yeob/right/rightIndex.jsp";

	//경로 뭐해야할지몰라서 center만 했다요
	
	@RequestMapping("/AllLocal")
	public ModelAndView AllLocal(@RequestParam("num") int num, HttpSession session){
		ModelAndView mav =new ModelAndView();
		Deal_Info info = service.AllLocal2(num);
		mav.addObject("di", info);
		List<Deal_Detail> detail = service.AllLocal(num);
		System.out.println("넘어온 num "+num);
		mav.addObject("center", "/WEB-INF/views/dealPage/detail.jsp");
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
		
//		mav.addObject("left", "/WEB-INF/views/yeob/left/leftIndex.jsp");
//		mav.addObject("center", "/WEB-INF/views/yeob/center/centerIndex.jsp");
//		mav.addObject("right", "/WEB-INF/views/yeob/right/rightIndex.jsp");
		mav.setViewName("/home");
		return mav;
	}
	
	@RequestMapping("/Gangnam")
	public ModelAndView Gangnam(){
		ModelAndView mav =new ModelAndView();
		List<Deal_Info> info = service.Gangnam();
		mav.addObject("center", centerPath+"Gangnam.jsp");
		mav.addObject("info", info);
		mav.setViewName("/home");
		return mav;
	}
	
	@RequestMapping("HongikUniv_Hapjeong_Sangsu")
	public ModelAndView HongikUniv_Hapjeong_Sangsu(){
		ModelAndView mav =new ModelAndView();
		List<Deal_Info> info = service.HongikUniv_Hapjeong_Sangsu();
		mav.addObject("center", centerPath+"HongikUniv_Hapjeong_Sangsu.jsp");
		mav.addObject("info", info);
//		mav.addObject("left", "/WEB-INF/views/yeob/left/leftIndex.jsp");
//		mav.addObject("center", "/WEB-INF/views/yeob/center/centerIndex.jsp");
//		mav.addObject("right", "/WEB-INF/views/yeob/right/rightIndex.jsp");
		mav.setViewName("/home");
		return mav;
	}
	
	@RequestMapping("Myeongdong_Cityhall_Junggu")
	public ModelAndView Myeongdong_Cityhall_Junggu(){
		ModelAndView mav =new ModelAndView();
		List<Deal_Info> info = service.Myeongdong_Cityhall_Junggu();
		mav.addObject("center", centerPath+"Myeongdong_Cityhall_Junggu.jsp");
		mav.addObject("info", info);
//		mav.addObject("left", "/WEB-INF/views/yeob/left/leftIndex.jsp");
//		mav.addObject("center", "/WEB-INF/views/yeob/center/centerIndex.jsp");
//		mav.addObject("right", "/WEB-INF/views/yeob/right/rightIndex.jsp");
		mav.setViewName("/home");
		return mav;
	}
	@RequestMapping("Jamsill_Sincheon")
	public ModelAndView Jamsill_Sincheon(){
		ModelAndView mav =new ModelAndView();
		List<Deal_Info> info = service.Jamsill_Sincheon();
		mav.addObject("center", centerPath+"Jamsill_Sincheon.jsp");
		mav.addObject("info", info);
		mav.setViewName("/home");
		return mav;
	}
	
	@RequestMapping("Seocho_Bangbae_Yangjae")
	public ModelAndView Seocho_Bangbae_Yangjae(){
		ModelAndView mav =new ModelAndView();
		List<Deal_Info> info = service.Seocho_Bangbae_Yangjae();
		mav.addObject("center", centerPath+"Seocho_Bangbae_Yangjae.jsp");
		mav.addObject("info", info);
		mav.setViewName("/home");
		return mav;
	}
	
	
	@RequestMapping("Daehangno_Suyu")
	public ModelAndView Daehangno_Suyu(){
		ModelAndView mav =new ModelAndView();
		List<Deal_Info> info = service.Daehangno_Suyu();
		mav.addObject("center", centerPath+"Daehangno_Suyu.jsp");
		mav.addObject("info", info);
		mav.setViewName("/home");
		return mav;
	}
	
	
	@RequestMapping("Apgujeong_Garosugil")
	public ModelAndView Apgujeong_Garosugil(){
		ModelAndView mav =new ModelAndView();
		List<Deal_Info> info = service.Apgujeong_Garosugil();
		mav.addObject("center", centerPath+"Apgujeong_Garosugil.jsp");
		mav.addObject("info", info);
		mav.setViewName("/home");
		return mav;
	}
	
	@RequestMapping("Sinchon_EwhaUniv_Gongdeok")
	public ModelAndView Sinchon_EwhaUniv_Gongdeok(){
		ModelAndView mav =new ModelAndView();
		List<Deal_Info> info = service.Sinchon_EwhaUniv_Gongdeok();
		mav.addObject("center", centerPath+"Sinchon_EwhaUniv_Gongdeok.jsp");
		mav.addObject("info", info);
		mav.setViewName("/home");
		return mav;
	}
	
	@RequestMapping("Jongno_Gwanghwamun")
	public ModelAndView Jongno_Gwanghwamun(){
		ModelAndView mav =new ModelAndView();
		List<Deal_Info> info = service.Jongno_Gwanghwamun();
		mav.addObject("center", centerPath+"Jongno_Gwanghwamun.jsp");
		mav.addObject("info", info);
		mav.setViewName("/home");
		return mav;
	}
	
	@RequestMapping("songpa_Bangi_Garak")
	public ModelAndView songpa_Bangi_Garak(){
		ModelAndView mav =new ModelAndView();
		List<Deal_Info> info = service.songpa_Bangi_Garak();
		mav.addObject("center", centerPath+"songpa_Bangi_Garak.jsp");
		mav.addObject("info", info);
		mav.setViewName("/home");
		return mav;
	}
	
	@RequestMapping("Gangseo_Yangcheon")
	public ModelAndView Gangseo_Yangcheon(){
		ModelAndView mav =new ModelAndView();
		List<Deal_Info> info = service.Gangseo_Yangcheon();
		mav.addObject("center", centerPath+"Gangseo_Yangcheon.jsp");
		mav.addObject("info", info);
		mav.setViewName("/home");
		return mav;
	}
	
	@RequestMapping("Nowon_Dobong")
	public ModelAndView Nowon_Dobong(){
		ModelAndView mav =new ModelAndView();
		List<Deal_Info> info = service.Nowon_Dobong();
		mav.addObject("center", centerPath+"Nowon_Dobong.jsp");
		mav.addObject("info", info);
		mav.setViewName("/home");
		return mav;
	}
	
	@RequestMapping("Cheongdam_Hakdong_Nonhyeon")
	public ModelAndView Cheongdam_Hakdong_Nonhyeon(){
		ModelAndView mav =new ModelAndView();
		List<Deal_Info> info = service.Cheongdam_Hakdong_Nonhyeon();
		mav.addObject("center", centerPath+"Cheongdam_Hakdong_Nonhyeon.jsp");
		mav.addObject("info", info);
		mav.setViewName("/home");
		return mav;
	}
	
	@RequestMapping("Sangam_Eunpyeong")
	public ModelAndView Sangam_Eunpyeong(){
		ModelAndView mav =new ModelAndView();
		List<Deal_Info> info = service.Sangam_Eunpyeong();
		mav.addObject("center", centerPath+"Sangam_Eunpyeong.jsp");
		mav.addObject("info", info);
		mav.setViewName("/home");
		return mav;
	}
	@RequestMapping("Itaewon_Hannam")
	public ModelAndView Itaewon_Hannam(){
		ModelAndView mav =new ModelAndView();
		List<Deal_Info> info = service.Itaewon_Hannam();
		mav.addObject("center", centerPath+"Itaewon_Hannam.jsp");
		mav.addObject("info", info);
		mav.setViewName("/home");
		return mav;
	}
	@RequestMapping("Gangdong_Cheonho_Gildong")
	public ModelAndView Gangdong_Cheonho_Gildong(){
		ModelAndView mav =new ModelAndView();
		List<Deal_Info> info = service.Gangdong_Cheonho_Gildong();
		mav.addObject("center", centerPath+"Gangdong_Cheonho_Gildong.jsp");
		mav.addObject("info", info);
		mav.setViewName("/home");
		return mav;
	}
	@RequestMapping("Gwanak_Dongjak_Sadang")
	public ModelAndView Gwanak_Dongjak_Sadang(){
		ModelAndView mav =new ModelAndView();
		List<Deal_Info> info = service.Gwanak_Dongjak_Sadang();
		mav.addObject("center", centerPath+"Gwanak_Dongjak_Sadang.jsp");
		mav.addObject("info", info);
		mav.setViewName("/home");
		return mav;
	}
	@RequestMapping("Seongdong_Dongdaemun")
	public ModelAndView Seongdong_Dongdaemun(){
		ModelAndView mav =new ModelAndView();
		List<Deal_Info> info = service.Seongdong_Dongdaemun();
		mav.addObject("center", centerPath+"Seongdong_Dongdaemun.jsp");
		mav.addObject("info", info);
		return mav;
	}
	@RequestMapping("Samseong_Yeoksam_Daechi")
	public ModelAndView Samseong_Yeoksam_Daechi(){
		ModelAndView mav =new ModelAndView();
		List<Deal_Info> info = service.Samseong_Yeoksam_Daechi();
		mav.addObject("center", centerPath+"Samseong_Yeoksam_Daechi.jsp");
		mav.addObject("info", info);
		mav.setViewName("/home");
		return mav;
	}
	@RequestMapping("Guro_Yeongdeungpo")
	public ModelAndView Guro_Yeongdeungpo(){
		ModelAndView mav =new ModelAndView();
		List<Deal_Info> info = service.Guro_Yeongdeungpo();
		mav.addObject("center", centerPath+"Guro_Yeongdeungpo.jsp");
		mav.addObject("info", info);
		mav.setViewName("/home");
		return mav;
	}
	@RequestMapping("Konkuk_Guui_Jungnang")
	public ModelAndView Konkuk_Guui_Jungnang(){
		ModelAndView mav =new ModelAndView();
		List<Deal_Info> info = service.Konkuk_Guui_Jungnang();
		mav.addObject("center", centerPath+"Konkuk_Guui_Jungnang.jsp");
		mav.addObject("info", info);
		mav.setViewName("/home");
		return mav;
	}
	
	
	
	
}
