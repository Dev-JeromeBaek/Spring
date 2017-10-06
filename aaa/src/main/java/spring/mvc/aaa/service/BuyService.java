package spring.mvc.aaa.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import spring.mvc.aaa.bean.BuyBean;
import spring.mvc.aaa.bean.BuyDetailBean;
import spring.mvc.aaa.bean.CartBean;
import spring.mvc.aaa.bean.Deal_Detail;
import spring.mvc.aaa.bean.Deal_Info;
import spring.mvc.aaa.bean.MemberBean;
import spring.mvc.aaa.bean.mapperBean;
import spring.mvc.aaa.repository.BuyRepository;
import spring.mvc.aaa.repository.MemberRepository;

@Service
public class BuyService extends DefaultTransactionDefinition {
	
	@Autowired
	private BuyRepository repository;
	
	@Autowired
	private PlatformTransactionManager tx;
	private TransactionStatus status;
	
	public List<mapperBean> salesTopCorp() {
		
		return repository.salesTopCorp();
	}

	public List<mapperBean> topDealCorp() {
		return repository.topDealCorp();
	}
	
	public List<mapperBean> topCancelCorp() {
		return repository.topCancelCorp();
	}

//	================================================
//	[showSalesAll Page]
	
	public List<BuyBean> selectMySalesList(Integer c_num) {
		return repository.selectMySalesList(c_num);
	}
	
//	================================================
//	[03.21수인]
	public int InsertBuyInfo(BuyBean buyinfo) {
		status= tx.getTransaction(this);
		int res = repository.insertBuyInfo(buyinfo);
		if(res > 0){
			tx.commit(status);
		}else{
			tx.rollback(status);
		}
		return res;
		
	}

	public int insertBuyDetail(List<BuyDetailBean> listc) {
		status =tx.getTransaction(this);
		
		int res = repository.insertBuyDetail(listc);
		if(res > 0 ){
			tx.commit(status);
		}else{
			tx.rollback(status);
		}
		return res;
	}

	public List<BuyBean> selectTicket(MemberBean mem) {
		List<BuyBean> listc = repository.selectTicket(mem);
		return listc;
	}

	public List<BuyBean> selectNoticket(MemberBean mem) {
		List<BuyBean> listc = repository.selectNoticket(mem);
		return listc;
	}



	public Deal_Detail selectBuyName(int dd_num) {
		Deal_Detail name = repository.selectBuyName(dd_num);
		return name;
	}

	public List<BuyBean> buyInfoList(Integer m_num) {
		List<BuyBean> buyInfoList =  repository.buyInfoList(m_num);
		return buyInfoList;
	}
	
	public List<BuyBean> AllBuySelect(MemberBean mem) {
		List<BuyBean> listc = repository.AllBuySelect(mem);
		return listc;
	}

	public Deal_Detail BuyDetail(int detailnum) {
		Deal_Detail detail = repository.BuyDetail(detailnum);
		return detail;
	}
	
	public int BuyAllSuccess(List<BuyBean> listc) {
		status = tx.getTransaction(this);
		int res = repository.BuyAllSuccess(listc);
		if(res > 0){
			tx.commit(status);
		}else{
			tx.rollback(status);
		}
		
		return res;
	}

	public List<BuyBean> CancelBuySelect(Integer m_num) {
		List<BuyBean> listc = repository.AllBuySelect(m_num);
		return listc;
	}

	public List<BuyBean> selectBuyListStatus(mapperBean mb) {
		return repository.selectBuyListStatus(mb);
	}

	public int chooseStatus(mapperBean mb) {
		
		status = tx.getTransaction(this);
		int res = repository.chooseStatus(mb);
		if(res > 0){
			tx.commit(status);
		}else{
			tx.rollback(status);
		}
		return res;
	}

	public Date finalStatus() {
		return repository.finalStatus();
	}

	public List<BuyBean> buyAllList() {
		return repository.buyAllList();
	}
	
	//추가--------------------------------------------
		public List<CartBean> showCartList(int di_num) {
			return repository.showCartList(di_num);
		}

		public List<Deal_Info> showInfoList(int di_num) {
			return repository.showInfoList(di_num);
		}

		public int InsertBuyInfoList(List<BuyBean> buy) {
			status =tx.getTransaction(this);
			
			int res = repository.InsertBuyInfoList(buy);
			if(res > 0 ){
				tx.commit(status);
			}else{
				tx.rollback(status);
			}
			return res;
		}

		public Deal_Detail selectdetailName(int di_num) {
			Deal_Detail detail = repository.selectdetailName(di_num);
			return detail;
		}

		
//		================================================

//	================================================
	public List<BuyDetailBean> buyDetailList(Integer b_num) {
		return repository.buyDetailList(b_num);
	}

	public int minorAmount(List<BuyDetailBean> listc) {
		return  repository.minorAmount(listc);
		
	}

	public BuyBean buyOne(Integer b_num) {
		return  repository.buyOne(b_num);
	}

	public List<BuyBean> buyInfoListTwo(Integer m_num) {
		List<BuyBean> buyInfoList =  repository.buyInfoListTwo(m_num);
		return buyInfoList;
	}

	public Deal_Info infoOne(int di_num) {
		return  repository.infoOne(di_num);
	}

	
	
	
	
}
