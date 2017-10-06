package spring.mvc.aaa.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import spring.mvc.aaa.bean.Corp;
import spring.mvc.aaa.bean.CorpBean;
import spring.mvc.aaa.bean.CorpSellingBean;
import spring.mvc.aaa.bean.Deal_Detail;
import spring.mvc.aaa.bean.Deal_Info;
import spring.mvc.aaa.bean.mapperBean;
import spring.mvc.aaa.repository.CorpRepository;

@Service
public class CorpService extends DefaultTransactionDefinition{
	
	@Autowired
	private CorpRepository repository;
	
	@Autowired
	private PlatformTransactionManager tx;
	private TransactionStatus status;
	public int dealInsert(Deal_Info info,Deal_Detail detail) {
		status = tx.getTransaction(this);
		int res = repository.dealInsert(info,detail);
			if(res > 0){
				tx.commit(status);
			}else{
				tx.rollback(status);
			}
			return res;
	}
	public List<Deal_Info> selectInfo() {
		List<Deal_Info> listc = repository.selectInfo();
		return listc;
	}
	public List<Deal_Detail> selectDetail() {
		List<Deal_Detail> detail = repository.selectDetail();
		return detail;
	}
	public int dealInsert(ArrayList<Deal_Detail> listc) {
		status = tx.getTransaction(this);
		int res = repository.dealInsert(listc);
		if(res>0)	tx.commit(status);
		else		tx.rollback(status);
		
		return res;
	}
	public int dealInfo(Deal_Info info) {
		status = tx.getTransaction(this);
		int res = repository.dealInfo(info);
			if(res > 0){
				
				tx.commit(status);
			}else{
				tx.rollback(status);
			}
			return res;
	}
	
	
	
//	=======================================================
public int corpJoin(Corp corp) {
		
		status = tx.getTransaction(this);
		
		int res = repository.corpJoin(corp);
		
		if(res>0){
			tx.commit(status);
		}else{ 
			tx.rollback(status);
		}
		return res;
		
	}

	public Corp corpLogin(Corp corp) {
		
		
		Corp corpLog = repository.corpLog(corp);
		
		return corpLog;
	}

	public Corp corpBnCheck(Corp corp) {
		
		Corp corpBnCheck = repository.corpBnCheck(corp);
		
		return corpBnCheck;
	}
	
//	===================================================
//	2017.03.13
	
	public List<Deal_Info> approveNullInfo() {
		return repository.approveNullInfo();
	}
	public List<CorpBean> upDealCorp(Integer di_c_num) {
		return repository.upDealCorp(di_c_num);
	}
	public List<Deal_Info> dealApproveList(String YES) {
		return repository.dealApproveList(YES);
	}
	public List<Deal_Info> dealCancelList(String NO) {
		return repository.dealCancelList(NO);
	}
	
//	====================================================
//	2017.03.14
	
	public List<CorpBean> showCorpList() {
		return repository.showCorpList();
	}
	public List<Deal_Info> showDealInfoList() {
		return repository.showDealInfoList();
	}
	
//	2017.03.15
	
	public int upStatusDeal(mapperBean mb) {
		
		status = tx.getTransaction(this);
		int res = repository.upStatusDeal(mb);
		if(res > 0) {
			tx.commit(status);
		} else {
			tx.rollback(status);
		}
		return res;
	}
	
	public CorpBean getCorpInfoOne(Integer c_num) {
		return repository.getCorpInfoOne(c_num);
	}
	
	public int deleteCorp(Integer c_num) {
		return repository.deleteCorp(c_num);
	}
	public int modifyCorp(mapperBean modiCorp) {
		status = tx.getTransaction(this);
		int res = repository.modifyCorp(modiCorp);
		if(res > 0) {
			tx.commit(status);
		} else {
			tx.rollback(status);
		}
		return res;
	}
	public Corp selectCorpOne(Integer c_num) {
		return repository.selectCorpOne(c_num);
	}
	public int modifyCorpGrade(Corp corpLog) {
		status = tx.getTransaction(this);
		int res = repository.modifyCorpGrade(corpLog);
		if(res > 0) {
			tx.commit(status);
		} else {
			tx.rollback(status);
		}
		return res;
	}
	
	
}// (Service) class END
