package spring.mvc.aaa.repository;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.aaa.bean.BuyBean;
import spring.mvc.aaa.bean.BuyDetailBean;
import spring.mvc.aaa.bean.CartBean;
import spring.mvc.aaa.bean.Deal_Detail;
import spring.mvc.aaa.bean.Deal_Info;
import spring.mvc.aaa.bean.MemberBean;
import spring.mvc.aaa.bean.mapperBean;

@Repository
public class BuyRepository {
	
	@Autowired
	private SqlSession sqlSessionTemplate;

	public List<mapperBean> salesTopCorp() {
		return sqlSessionTemplate.selectList("buyMapper.salesTopCorp");
	}

	public List<mapperBean> topDealCorp() {
		return sqlSessionTemplate.selectList("buyMapper.topDealCorp");
	}

	public List<mapperBean> topCancelCorp() {
		return sqlSessionTemplate.selectList("buyMapper.topCancelCorp");
	}

	public List<BuyBean> selectMySalesList(Integer c_num) {
		return sqlSessionTemplate.selectList("buyMapper.selectMySalesList", c_num);
	}
	
//	=============================================================================
//	[03.21 수인]
	
	public int insertBuyInfo(BuyBean buyinfo) {
		return sqlSessionTemplate.insert("buyMapper.insertBuyInfo", buyinfo);
	}

	public int insertBuyDetail(List<BuyDetailBean> listc) {
		int res = 0;
//		System.out.println("res +=전");
		for(BuyDetailBean detail : listc){
			
			res += sqlSessionTemplate.insert("buyMapper.insertBuyDetail", detail);
		}
//		System.out.println("res += 성공 ");
		return res ;
	}

	public List<BuyBean> selectTicket(MemberBean mem) {
		return sqlSessionTemplate.selectList("buyMapper.selectTicket",mem);
	}

	public List<BuyBean> selectNoticket(MemberBean mem) {
		return sqlSessionTemplate.selectList("buyMapper.selectNoticket",mem);
	}

	public Deal_Detail selectBuyName(int dd_num) {
		return sqlSessionTemplate.selectOne("buyMapper.selectBuyName",dd_num);
	}

	public List<BuyBean> buyInfoList(Integer m_num) {
		List<BuyBean> listc = sqlSessionTemplate.selectList("buyMapper.buyInfoListTwo",m_num);
		return listc;
	}
	

	public int BuyAllSuccess(List<BuyBean> listc) {
		int res = 0;
		for(BuyBean each : listc){
//			System.out.println("dd등록 시작");
			res += sqlSessionTemplate.insert("buyMapper.BuyAllSuccess", each);
//			System.out.println("dd등록 완료");
		}
		return res;
	}
	
	public Deal_Detail BuyDetail(int detailnum) {
//		System.out.println("##################33"+detailnum);
		return sqlSessionTemplate.selectOne("buyMapper.BuyDetail", detailnum);
	}
	
	public List<BuyBean> AllBuySelect(MemberBean mem) {
		return sqlSessionTemplate.selectList("buyMapper.AllBuySelect",mem);
	}

	public List<BuyBean> AllBuySelect(Integer m_num) {
		List<BuyBean> listc = sqlSessionTemplate.selectList("buyMapper.CancelBuySelect",m_num);
		return listc;
	}

	public List<BuyBean> selectBuyListStatus(mapperBean mb) {
		return sqlSessionTemplate.selectList("buyMapper.selectBuyListStatus", mb);
	}

	public int chooseStatus(mapperBean mb) {
		return sqlSessionTemplate.update("buyMapper.chooseStatus", mb);
	}

	public Date finalStatus() {
		return sqlSessionTemplate.selectOne("buyMapper.finalStatus");
	}

	public List<BuyBean> buyAllList() {
		return sqlSessionTemplate.selectList("buyMapper.buyAllList");
	}
	
	//추가 =---------------------------
		public List<CartBean> showCartList(int di_num) {
			return sqlSessionTemplate.selectList("buyMapper.showcabuList",di_num);
		}

		public List<Deal_Info> showInfoList(int di_num) {
			return sqlSessionTemplate.selectList("buyMapper.showInfoList",di_num);
		}

		public int InsertBuyInfoList(List<BuyBean> buy) {
			int res = 0;
			for(BuyBean each : buy){
				System.out.println("dd등록 시작");
				System.out.println(each.toString());
				res += sqlSessionTemplate.insert("buyMapper.insertBuyInfo", each);
				System.out.println("dd등록 완료");
			}
			return res;
		}

		public Deal_Detail selectdetailName(int CART_DI_NUM) {
			return sqlSessionTemplate.selectOne("buyMapper.selectdetailName",CART_DI_NUM);
		}
		
		
//		=============================================================================
	
//	=============================================================================

	public List<BuyDetailBean> buyDetailList(Integer b_num) {
		return sqlSessionTemplate.selectList("buyMapper.buyDetailList", b_num);
	}
	
	public int minorAmount(List<BuyDetailBean> listc) {
		System.out.println("minorAmount 수정전>>>>>>>>");
		int res = 0;
		for(BuyDetailBean  each : listc ){
			System.out.println(each.toString());
			res += sqlSessionTemplate.update("buyMapper.minorAmount", each);
			System.out.println("minorAmount 수정 완료>>>>>>>>>>>>");
		}
		return res;
	}

	public BuyBean buyOne(Integer b_num) {
		return sqlSessionTemplate.selectOne("buyMapper.buyOne",b_num);
	}

	public List<BuyBean> buyInfoListTwo(Integer m_num) {
		return sqlSessionTemplate.selectList("buyMapper.buyInfoListTwo",m_num);
	}

	public Deal_Info infoOne(int di_num) {
		return sqlSessionTemplate.selectOne("buyMapper.infoOne",di_num);
	}
	
	

}
