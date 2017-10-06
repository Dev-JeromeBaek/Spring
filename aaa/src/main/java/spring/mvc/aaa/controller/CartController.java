package spring.mvc.aaa.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.aaa.bean.CartBean;
import spring.mvc.aaa.bean.Corp;
import spring.mvc.aaa.bean.Deal_Detail;
import spring.mvc.aaa.bean.Deal_Info;
import spring.mvc.aaa.bean.MemberBean;
import spring.mvc.aaa.service.CartService;
import spring.mvc.aaa.service.DealService;

@Controller
@RequestMapping("/cart/")
public class CartController {

	@Autowired
	private CartService service;

	@Autowired
	private DealService dealservice;

	@RequestMapping("insert")
	public ModelAndView insertCart(@RequestParam("c_info") String cart_info, HttpSession session,
			@RequestParam("move") String yn, @RequestParam(value = "di_num", required = false) Integer di_num) {
		ModelAndView mav = new ModelAndView();
		int res = 0;
		aa: for (String each : cart_info.split("-")) {
			List<CartBean> cList = service.cartList(((MemberBean) session.getAttribute("memLogin")).getM_num());
			if (each != "") {
				String[] sp = each.split(",");
				for (CartBean ctb : cList) {
					if (ctb.getCart_di_num() == Integer.parseInt(sp[0])
							&& ctb.getCart_dd_num() == Integer.parseInt(sp[1])
							&& ctb.getCart_m_num() == ((MemberBean) session.getAttribute("memLogin")).getM_num()) {
						ctb.setCart_amount(ctb.getCart_amount() + Integer.parseInt(sp[2]));
						res += service.updateAmount(ctb);
						continue aa;
					}
				}
				CartBean cb = new CartBean(Integer.parseInt(sp[0]), Integer.parseInt(sp[1]), Integer.parseInt(sp[2]),
						Integer.parseInt(sp[3]), ((MemberBean) session.getAttribute("memLogin")).getM_num());
				res += service.insertCart(cb);

			}
		}
		System.out.println(res == cart_info.split("-").length - 1 ? "장바구니 정보 저장 완료" + res : "장바구니 정보 저장 오류" + res);
		session.setAttribute("cartNum",
				service.cartList(((MemberBean) session.getAttribute("memLogin")).getM_num()).size());
		System.out.println("/cart/insert");
		if (yn.equals("y")) {
			// mav.addObject("center",
			// "/WEB-INF/views/memPage/center/memcart.jsp");
			mav.setViewName("redirect:/cart/memCart");
		} else if (yn.equals("n")) {
			// mav.addObject("center", "/WEB-INF/views/yeob/center/cart.jsp");
			mav.setViewName("redirect:/deal/detail/" + di_num);
		}
		return mav;
	}

	@RequestMapping("page")
	public ModelAndView cartPage(@RequestParam(value = "c_info", required = false) String cart_info) { // 비회원
		System.out.println("/cart/page");
		ModelAndView mav = new ModelAndView();
		System.out.println(cart_info);
		HashMap<Integer,CartBean> nomemcartList = null;
		if (cart_info != "" && cart_info != null) {
			String[] each = cart_info.split("-");
			for (int j=0;j<each.length;j++) {//String each : cart_info.split("-")
				if ( each[j] != "") {
					System.out.println("each"+each);
					String[] sp = each[j].split(",");
					System.out.println("split , ");
					CartBean cb = new CartBean(Integer.parseInt(sp[0]), Integer.parseInt(sp[1]),
							Integer.parseInt(sp[2]), Integer.parseInt(sp[3]));
					if (nomemcartList == null)	nomemcartList = new HashMap<>();
					boolean isis = true;
					for (int i = 0; i < nomemcartList.size(); i++) {
						if (nomemcartList.get(i).getCart_di_num() == Integer.parseInt(sp[0])
								&& nomemcartList.get(i).getCart_dd_num() == Integer.parseInt(sp[1])) {
							CartBean bt = nomemcartList.get(i);
							bt.setCart_amount(bt.getCart_amount() + Integer.parseInt(sp[2]));
							nomemcartList.put(i, bt);
							isis = false;
							break;
						}
					}
					if (isis) {
						nomemcartList.put(j,cb);
					}
				}
			}			
			System.out.println("list isze"+nomemcartList.size());
			List<Deal_Info> diList = new ArrayList<>();
			HashMap<Integer,Deal_Detail> ddList = new HashMap<>();
			HashMap<Integer,Corp> corpList = new HashMap<>();
			for (int i = 0; i < nomemcartList.size(); i++) {
				boolean isis = true;
				Deal_Info di = dealservice.selectDIOne(nomemcartList.get(i).getCart_di_num());
				for (int j = 0; j < i; j++) {// CartBean each : nomemcartList
					if (di.getDi_num() == nomemcartList.get(j).getCart_di_num()) {
						if(nomemcartList.get(i).getCart_dd_num()!=nomemcartList.get(j).getCart_dd_num())
							ddList.put(i,dealservice.selectDDOne(nomemcartList.get(i).getCart_dd_num()));
						isis = false;
					}
				}
				if (isis) {
					diList.add(di);
					Corp cc = service.cartCorpOne(di.getDi_c_num());
					corpList.put(cc.getC_num(),cc);
					ddList.put(i,dealservice.selectDDOne(nomemcartList.get(i).getCart_dd_num()));
					System.out.println("cartDB");
				}
			}
			List<CartBean> cccc = new ArrayList<>();
			for(int each2 : nomemcartList.keySet())
				cccc.add(nomemcartList.get(each2));
			List<Deal_Detail> dddd = new ArrayList<>();
			for(int each2 : ddList.keySet())
				dddd.add(ddList.get(each2));
			List<Corp> pppp = new ArrayList<>();
			for(int each2 : corpList.keySet())
				pppp.add(corpList.get(each2));
			mav.addObject("cartList", cccc);
			mav.addObject("diList", diList);
			mav.addObject("ddList", dddd);
			mav.addObject("corpList", pppp);
		}
		mav.addObject("center", "/WEB-INF/views/memPage/center/memcart.jsp");
		mav.setViewName("home");
		return mav;
	}

	@RequestMapping("memCart")
	public ModelAndView memCartPage(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Integer m_num = ((MemberBean) session.getAttribute("memLogin")).getM_num();
		List<CartBean> listc = service.cartList(m_num);
		List<Deal_Info> diList = service.cartDIList(m_num);
		List<Deal_Detail> ddList = service.cartDDList(m_num);
		List<Corp> corpList = service.cartCorpList(m_num);
		session.setAttribute("cartNum", diList.size());
		mav.addObject("cartList", listc);
		mav.addObject("diList", diList);
		mav.addObject("ddList", ddList);
		mav.addObject("corpList", corpList);
		mav.addObject("center", "/WEB-INF/views/memPage/center/memcart.jsp");
		mav.setViewName("home");
		return mav;
	}

	
	@RequestMapping("delete")
	public ModelAndView cartDelete(@RequestParam("nums")String nums,HttpSession session){
		ModelAndView mav = new ModelAndView();
		MemberBean mem = (MemberBean)session.getAttribute("memLogin");
		int res = 0;
		for(String each : nums.split(",")){
			if(each!=""){
				res += service.deleteOne(Integer.parseInt(each.substring(2)),mem.getM_num());
			}
		}
		System.out.println(res);
//		System.out.println(res==(nums.split(",")-1) ? "cart 삭제 성공" : );
		mav.setViewName("redirect:/cart/memCart");
		return mav;
	}
	
	
	@RequestMapping("deleteA")
	public ModelAndView deleteDetail(String dd_num,HttpSession session){
		ModelAndView mav = new ModelAndView();
		Integer m_num = ((MemberBean) session.getAttribute("memLogin")).getM_num();
		int res = service.deleteAmount(dd_num,m_num);
		mav.setViewName("redirect:/cart/memCart");
		return mav;
	}

	
	@RequestMapping("updateA")
	public ModelAndView updateAmount(String dd_num,String amou ,HttpSession session){
		ModelAndView mav = new ModelAndView();
		Integer m_num = ((MemberBean) session.getAttribute("memLogin")).getM_num();
		int res = service.updateAA(m_num,Integer.parseInt(dd_num),Integer.parseInt(amou));
		mav.setViewName("redirect:/cart/memCart");
		return mav;
	}
	
	
	@RequestMapping("popup")
	public ModelAndView corpPopup(Integer c_num){
		ModelAndView mav = new ModelAndView();
		Corp corp = service.cartCorpOne(c_num);
		mav.addObject("corp", corp);
		mav.setViewName("/corpPage/corpInfoPopup");
		
		return mav;
	}
	
}
