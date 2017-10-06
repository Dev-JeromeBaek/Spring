package spring.mvc.aaa.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.aaa.bean.Deal_Detail;
import spring.mvc.aaa.bean.Deal_Info;
import spring.mvc.aaa.service.FashionService;

@Controller
@RequestMapping("fashion")
public class FashionController {
	
	@Autowired
	private FashionService service ;
	
	private String logPath = "/WEB-INF/views/dealPage/top/";
	private String centerPath = "/WEB-INF/views/dealPage/center/";
	
	@RequestMapping("/home")
	public ModelAndView home() {
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("center", "/WEB-INF/views/yeob/center/centerIndex.jsp");
		
		mav.setViewName("home");
		return mav;
	}
	
	
	@RequestMapping(value="fashion_beauty", method=RequestMethod.GET)
	public ModelAndView selectList(@RequestParam (value="fashion_woman", required=false)String fashion_woman
								,@RequestParam (value="fashion_man_uni", required=false)String fashion_man_uni
								,@RequestParam (value="fashion_brand_woman", required=false)String fashion_brand_woman
								,@RequestParam (value="fashion_brand_man", required=false)String fashion_brand_man
								,@RequestParam (value="fashion_sports", required=false)String fashion_sports
								,@RequestParam (value="fashion_beauty", required=false)String fashion_beauty){
		
		ModelAndView mav = new ModelAndView();
		Deal_Info info = new Deal_Info();
		
		info.setDi_category("패션 뷰티");
		String kinds = null;
		
		
		if(fashion_woman != null){
			info.setDi_category("여성패션");
			kinds = fashion_woman;
			
		}
		if(fashion_man_uni != null){
			info.setDi_category("남성·유니섹스페션");
			kinds = fashion_man_uni;
			
		}
		if(fashion_brand_woman != null){
			info.setDi_category("여성 브랜드 패션");
			kinds = fashion_brand_woman;
			
		}	
		if(fashion_brand_man != null){
			info.setDi_category("남성 브랜드 패션");
			kinds = fashion_brand_man;
			
		}
		if(fashion_sports != null){
			info.setDi_category("스포츠 페션");
			kinds = fashion_sports;
			
		}
		if(fashion_beauty != null){
			info.setDi_category("뷰티");
			kinds = fashion_beauty;
		}
		
		List<Deal_Info> InfoListCheck = service.infoList(info);
		mav.addObject("kinds",kinds);
		
		System.out.println("정보 갯수는? : " + InfoListCheck.size());
		
//		승인 = yes 전송
		ArrayList<Deal_Info> InfoList = new ArrayList<>();
		
		if(!InfoListCheck.isEmpty()){
			for(Deal_Info each : InfoListCheck){
				if(each.getDi_approve() == null){
					continue;
				}
				if(each.getDi_approve().equals("YES")){
					InfoList.add(each);
					System.out.println(InfoList);
				}
			}
		}else{
			
			mav.addObject("msg","입력된 값이 없습니다.");
			
			mav.addObject("center", centerPath + "fashion_beauty.jsp");
			mav.setViewName("home");
			return mav;
			}
		
		System.out.println("YES인 상태의 딜 리스트 갯수 : " + InfoList.size());		
		
		mav.addObject("InfoList",InfoList);
		mav.addObject("center", centerPath + "fashion_beauty.jsp");
		mav.setViewName("home");
		return mav;
	}
	
	@RequestMapping("fashion_beauty_SelectOne")
	public ModelAndView selectOne(@RequestParam (value="di_num", required=false)Integer di_num){
		
		ModelAndView mav = new ModelAndView();
		Deal_Info info = new Deal_Info();
		Deal_Detail detail = new Deal_Detail();
		
		info = service.infoSelectOne(di_num);
		List<Deal_Detail> detailList = service.detailSelectList(di_num);
		
		mav.addObject("di",info);
		mav.addObject("detailList",detailList);
		mav.addObject("ddList",detailList);
		mav.addObject("center", centerPath + "fashion_beauty_SelectOne.jsp");
		mav.setViewName("home");
		
		return mav;
	}
	
	@RequestMapping(value="fashion_SelectData",method=RequestMethod.POST,produces="text/json; charset=UTF-8")
	public ModelAndView fashion_SelectData(
			@RequestParam (value="goUsingName", required=false)String goUsingName,
			@RequestParam (value="di_num", required=false)Integer di_num){
		
		System.out.println(goUsingName);
		System.out.println(di_num);
		
		ModelAndView mav = new ModelAndView();
		Deal_Info info = new Deal_Info();
		
		info = service.infoSelectOne(di_num);
		mav.addObject("di",info);
		List<Deal_Detail> detailList = service.detailSelectList(di_num);
		HashMap<Integer,Deal_Detail> hmap  = new HashMap<>();
		
//		mav.addObject("ddList",detailList);
		
		int i = -1;
		
		for(Deal_Detail each : detailList){
			
			i++;
			if( i<info.getDi_sysName().split(",").length){
				hmap.put(i,each);
			}
		}
		
		for(int j=0; j<info.getDi_sysName().split(",").length;j++){
			if(info.getDi_sysName().split(",")[j].equals(goUsingName)){
	
				mav.addObject("msg",j);
				Deal_Detail detail = hmap.get(j);
				mav.addObject("detail",detail);
			                                   	
				String detailName = detail.getDd_name();
				mav.addObject("detailName",detailName);
				//한글 깨짐 현상 인코딩
//				
			}	
		}
		
		mav.addObject("center", centerPath + "fashion_beauty_SelectOne.jsp");
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	
	
	
	@RequestMapping("fashionPaging")
	public ModelAndView fashionPaging(@RequestParam (value="num", required=false)Integer num) {
		
		ModelAndView mav = new ModelAndView();
		
		HashMap<Integer,String> hmap = new HashMap<>();
		Deal_Info info = new Deal_Info();
		info.setDi_category("여성패션");
		List<Deal_Info> InfoListCheck = service.infoList(info);
		
		int i=-1;
		String stringImage= "";
		for(Deal_Info each : InfoListCheck){
			
			i++;
			stringImage =  each.getDi_sysName().split(",")[0];
				hmap.put(i,stringImage);
			
		}
		
		HashMap<Integer,String> hmap2 = new HashMap<>();
		int j = -1;
		for( j = num;j<num+3 ; j++){
			
			hmap2.put(j,hmap.get(j));
			System.out.println(hmap2.get(j));
			
		}
		
		mav.addObject("num",j-2);
		mav.addObject("hmap2",hmap2);
		mav.addObject("center", centerPath + "fashion_beauty.jsp");
		
		mav.setViewName("jsonView");
		return mav;
	}
	
	
	
}




























