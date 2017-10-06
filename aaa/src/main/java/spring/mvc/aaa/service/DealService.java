package spring.mvc.aaa.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import spring.mvc.aaa.bean.BuyDetailBean;
import spring.mvc.aaa.bean.CorpSellingBean;
import spring.mvc.aaa.bean.DealQnaBean;
import spring.mvc.aaa.bean.Deal_Detail;
import spring.mvc.aaa.bean.Deal_Info;
import spring.mvc.aaa.bean.MemberBean;
import spring.mvc.aaa.bean.ReviewBean;
import spring.mvc.aaa.bean.mapperBean;
import spring.mvc.aaa.repository.DealRepository;

@Service
public class DealService extends DefaultTransactionDefinition {

	@Autowired
	private DealRepository repository;
	
	@Autowired
	private PlatformTransactionManager tx;
	private TransactionStatus status;
	
	public List<Deal_Info> selectDealList(String item2) {
		return repository.selectDealList(item2);
	}

	public Deal_Info selectDIOne(Integer di_num) {
		return repository.selectDIOne(di_num);
	}

	public List<Deal_Detail> selectDDList(Integer di_num) {
		return repository.selectDDList(di_num);
	}

	public List<Deal_Info> searchList(String key) {
		return repository.searchList(key);
	}
	
	public Deal_Detail selectDDOne(Integer cart_dd_num) {
		return repository.selectDDOne(cart_dd_num);
	}

	public int updateDealExplain(mapperBean mapBean) {
		status = tx.getTransaction(this);
		int res = repository.updateDealExplain(mapBean);
		if(res > 0) {
			tx.commit(status);
		} else {
			tx.rollback(status);
		}
		return res;
	}

	public List<Deal_Info> showDealListAll(Integer c_num) {
		return repository.showDealListAll(c_num);
	}

	public List<Deal_Info> showStatusDealList(mapperBean mb) {
		return repository.showStatusDealList(mb);
	}

	public List<BuyDetailBean> selectBuyDetailList(Integer b_num) {
		return repository.selectBuyDetailList(b_num);
	}

	public List<ReviewBean> selectDealReview(Integer di_num) {
		return repository.selectDealReview(di_num);
	}

	public List<MemberBean> selectDealReviewMem(Integer di_num) {
		return repository.selectDealReviewMem(di_num);
	}

	public int insertDealQna(DealQnaBean dq) {
		status = tx.getTransaction(this);
		int res = repository.insertDealQna(dq);
		if(res>0)	tx.commit(status);
		else		tx.rollback(status);
		return res;
	}

	public List<DealQnaBean> selectDQList(Integer di_num) {
		return repository.selectDQList(di_num);
	}

	public List<MemberBean> selectDQMemList(Integer di_num) {
		return repository.selectDQMemList(di_num);
	}

	public DealQnaBean selectDQOne(Integer dqnum) {
		return repository.selectDQOne(dqnum);
	}

	public List<DealQnaBean> selectCorpDQList(Integer num) {
		return repository.selectCorpDQList(num);
	}

	public int insertDQAns(Integer dqnum, String answer) {
		status = tx.getTransaction(this);
		int res = repository.insertDQAns(dqnum,answer);
		if(res>0)	tx.commit(status);
		else		tx.rollback(status);
		return res;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public int deleteDealDetailAll(Integer di_num) {
		
		status = tx.getTransaction(this);
		System.out.println("ser : " + di_num);
		int res = repository.deleteDealDetailAll(di_num);
		if(res > 0) {
			System.out.println("성공");
			tx.commit(status);
		} else {
			System.out.println("실패");
			tx.rollback(status);
		}
		return res;
	}

	public int deleteDealInfoAll(Integer c_num) {
		status = tx.getTransaction(this);
		int res = repository.deleteDealInfoAll(c_num);
		if(res > 0) {
			tx.commit(status);
		} else {
			tx.rollback(status);
		}
		return res;
	}

	public int deleteDealInfo(Integer di_num) {
		status = tx.getTransaction(this);
		int res = repository.deleteDealInfo(di_num);
		if(res > 0) {
			tx.commit(status);
		} else {
			tx.rollback(status);
		}
		return res;
	}

	public int updateAmount(int dd_num, int dd_amount) {
		status = tx.getTransaction(this);
		int res = repository.updateAmount(dd_num,dd_amount);
		System.out.println("arrive service");
		if(res>0)	tx.commit(status);
		else		tx.rollback(status);
		return res;
	}

	public List<Deal_Info> othersDealListAll() {
		return repository.othersDealListAll();
	}
	
	public List<mapperBean> countDRList(Integer corpNum) {
		return repository.countDRList(corpNum);
	}

	public List<mapperBean> countDQList(Integer corpNum) {
		return repository.countDQList(corpNum);
	}

	public int delReview(Integer dr_num) {
		return repository.delReview(dr_num);
	}

}
