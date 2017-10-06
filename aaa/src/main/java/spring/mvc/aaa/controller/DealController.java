package spring.mvc.aaa.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.aaa.bean.DealQnaBean;
import spring.mvc.aaa.bean.Deal_Detail;
import spring.mvc.aaa.bean.Deal_Info;
import spring.mvc.aaa.bean.MemberBean;
import spring.mvc.aaa.bean.ReviewBean;
import spring.mvc.aaa.service.DealService;

@Controller
@RequestMapping("/deal/{item1}/{item2}")
public class DealController {
	
	@Autowired
	private DealService dealService;
	
	@RequestMapping
	public ModelAndView showDealList(@PathVariable String item1, @PathVariable String item2,
			@RequestParam(value="keyword",required=false)String key,HttpSession session,@RequestParam(value="qnaCont",required=false)String qnaCont){
		ModelAndView mav = new ModelAndView();
		
		if(item1.equals("detail")){
			Deal_Info di = dealService.selectDIOne(Integer.parseInt(item2));
			List<Deal_Detail> ddList = dealService.selectDDList(Integer.parseInt(item2));
//			di 리스트가 필요하죠 
//			개수는 9개로 한정적이지 그러면 순서를 따져야 하는데 순서를 반영하는 arraylist가 되겠지./....?
			ArrayList<Deal_Info> recent = (ArrayList<Deal_Info>)session.getAttribute("recent");
			HashMap<Integer, Deal_Info> arrange = new HashMap<>();
			int nn = 1;
			ArrayList<Deal_Info> newRecent = new ArrayList<>();
			arrange.put(nn++, di);
			if(recent!=null){
				for(Deal_Info each : recent){
					if(di.getDi_num()!=each.getDi_num()){System.out.println("nn : " + nn);
						arrange.put(nn++, each);System.out.println("nn : " + nn);}
//					if(nn>9)	break;
				}
			}
			for(int i=1;i<nn/*<=(arrange.size()<9 ? arrange.size() : 9)*/;i++)
				newRecent.add(arrange.get(i));
			session.setAttribute("recent", newRecent);
			System.out.println("recent stored size : "+newRecent.size());
			List<ReviewBean> reviews = dealService.selectDealReview(di.getDi_num());
			mav.addObject("reviewList", reviews);
			/////////////////////////////////////0324////////////////////////////////
			List<MemberBean> reMemList = dealService.selectDealReviewMem(di.getDi_num());
			mav.addObject("reMemList", reMemList);
			
			List<DealQnaBean> dqList = dealService.selectDQList(di.getDi_num());
			mav.addObject("dqList", dqList);
			
			List<MemberBean> qnaMemList = dealService.selectDQMemList(di.getDi_num());
			mav.addObject("dqMemList", qnaMemList);
			////////////////////////////////////////////////////////////////////
			mav.addObject("di", di);
			mav.addObject("ddList", ddList);
			mav.addObject("center","/WEB-INF/views/dealPage/detail.jsp");
			
		
			
		}else if(item1.equals("insertQna")){///////////////////////////////////////////////////////
			System.out.println(qnaCont);
			DealQnaBean dq = new DealQnaBean();
			dq.setDq_content(qnaCont);
			dq.setDq_di_num(Integer.parseInt(item2));
			dq.setDq_m_num(((MemberBean)session.getAttribute("memLogin")).getM_num());
			int res = dealService.insertDealQna(dq);
			
			mav.setViewName("redirect:/deal/detail/"+item2);
			return mav;
		/////////////////////////////////////////////////////////////////////
		}else if(item1.equals("search")){
			List<Deal_Info> listc = dealService.searchList(key);
			mav.addObject("listc", listc);
			mav.addObject("headdd", "["+key+" 검색 결과]");
			mav.addObject("center","/WEB-INF/views/dealPage/dealList.jsp");
		}else {
		
			String kind = null;
			if(item1.equals("fashon")){
				if(item2.equals("woman"))				kind="여성패션";
				else if(item2.equals("man_uni"))		kind="남성·유니섹스패션";
				else if(item2.equals("brand_woman"))	kind="여성브랜드패션";
				else if(item2.equals("brand_man"))		kind="남성브랜드패션";
				else if(item2.equals("sports"))			kind="스포츠패션";
				else if(item2.equals("beauty"))			kind="뷰티";
			}else if(item1.equals("food")){
				if(item2.equals("fruit_vegetable"))		kind="과일·채소";
				else if(item2.equals("sea_meat_egg"))	kind="수산·정육·계란";
				else if(item2.equals("instant_processed"))	kind="즉석·가공식품";
				else if(item2.equals("kimchi_sidedish_pastes"))	kind="김치·반찬·장류";
				else if(item2.equals("snack"))	kind="스낵";
				else if(item2.equals("drink"))	kind="음료";
				else if(item2.equals("healthy_redginseng"))	kind="건강·홍삼";
				else if(item2.equals("diet"))	kind="다이어트";
				else if(item2.equals("imported"))	kind="수입식품";
			}else if(item1.equals("life")||item1.equals("deco")||item1.equals("home")){
				if(item2.equals("kitchen_dish"))		kind="주방용품·식기";
				else if(item2.equals("detergent_cleanser"))	kind="세제·세안";
				else if(item2.equals("storage_clean"))	kind="수납·정리";
				else if(item2.equals("cleaning_product"))	kind="청소용품";
				else if(item2.equals("wash_bath"))	kind="세탁·욕실용품";
				else if(item2.equals("bedroom"))	kind="침실가구";
				else if(item2.equals("living_storage"))	kind="거실·수납가구";
				else if(item2.equals("kitchen"))	kind="주방가구";
				else if(item2.equals("library_office"))	kind="서재·사무용가구";
				else if(item2.equals("bedroom_curtain"))	kind="침실·커튼";
				else if(item2.equals("candle_diffuser"))	kind="캔들·디퓨저";
				else if(item2.equals("build_diy_landscape"))	kind="시공·DIY·조경";
				else if(item2.equals("interior"))	kind="홈·인테리어소품";
			}else if(item1.equals("appliance")||item1.equals("digital")){
				if(item2.equals("tv_refrigerator_washing"))		kind="TV·냉장고·세탁기";
				else if(item2.equals("season"))	kind="계절가전";
				else if(item2.equals("life"))	kind="생활가전";
				else if(item2.equals("kitchen"))	kind="주방가전";
				else if(item2.equals("car"))	kind="차량용디지털기기";
				else if(item2.equals("notbook_tablet_pc"))	kind="노트북·태블릿·PC";
				else if(item2.equals("game_software"))	kind="게임·소프트웨어";
				else if(item2.equals("storage_others"))	kind="저장장치·주변기기";
				else if(item2.equals("moniter_printer"))	kind="모니터·프린터";
				else if(item2.equals("mobile_acc"))	kind="모바일·액세서리";
				else if(item2.equals("camera_video_sound"))	kind="카메라·영상·음향";
			}else if(item1.equals("loca")){
				if(item2.equals("Gangnam"))		kind="강남";
				else if(item2.equals("HongikUniv_Hapjeong_Sangsu"))	kind="홍대·합정·상수";
				else if(item2.equals("Myeongdong_Cityhall_Junggu"))	kind="명동·시청·중구";
				else if(item2.equals("Jamsill_Sincheon"))	kind="잠실·신천";
				else if(item2.equals("Seocho_Bangbae_Yangjae"))	kind="서초·방배·양재";
				else if(item2.equals("Daehangno_Suyu"))	kind="대학로·수유";
				else if(item2.equals("Apgujeong_Garosugi"))	kind="압구정·가로수";
				else if(item2.equals("Sinchon_EwhaUniv_Gongdeok"))	kind="신촌·이대·공덕";
				else if(item2.equals("Jongno_Gwanghwamun"))	kind="종로·광화문";
				else if(item2.equals("songpa_Bangi_Garak"))	kind="송파·방이·가락";
				else if(item2.equals("Gangseo_Yangcheon"))	kind="강서·양천";
				else if(item2.equals("Nowon_Dobong"))	kind="노원·도봉";
				else if(item2.equals("Cheongdam_Hakdong_Nonhyeon"))	kind="청담·학동·논";
				else if(item2.equals("Sangam_Eunpyeong"))	kind="상암·은평";
				else if(item2.equals("Itaewon_Hannam"))	kind="이태원·한남";
				else if(item2.equals("Gangdong_Cheonho_Gildong"))	kind="강동·천호·길동";
				else if(item2.equals("Gwanak_Dongjak_Sadang"))	kind="관악·동작·사당";
				else if(item2.equals("Seongdong_Dongdaemun"))	kind="성동·동대문";
				else if(item2.equals("Samseong_Yeoksam_Daechi"))	kind="삼성·역삼·대치";
				else if(item2.equals("Guro_Yeongdeungpo"))	kind="구로·영등포";
				else if(item2.equals("Konkuk_Guui_Jungnang"))	kind="건대·구의·중랑";
			}
			List<Deal_Info> listc =null;
//		if(kind==null){
//			listc = dealService.selectDealListAll(item1);
//			mav.addObject("center", "/WEB-INF/views/dealPage/"+item1+".jsp");
//		}else{
			listc = dealService.selectDealList(kind);
//			mav.addObject("center", "/WEB-INF/views/dealPage/"+item1+"_"+item2+".jsp");
			if(kind!=null) mav.addObject("kind", kind);
			mav.addObject("center","/WEB-INF/views/dealPage/dealList.jsp");
//		}
		mav.addObject("listc", listc);
		}
		mav.setViewName("home");
		
		return mav;
	}
	
	
	

}
