package spring.mvc.aaa.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import spring.mvc.aaa.bean.QnaBean;
import spring.mvc.aaa.module.PageDTO;
import spring.mvc.aaa.bean.MemLogBean;
import spring.mvc.aaa.bean.MemberBean;
import spring.mvc.aaa.bean.NoticeBean;
import spring.mvc.aaa.repository.AdminRepository;

@Service
public class AdminService extends DefaultTransactionDefinition{
	
	@Autowired
	private AdminRepository repository;
	
	@Autowired
	private PlatformTransactionManager tx;
	private TransactionStatus status;
	
	public MemberBean selectOne() {
		return repository.selectOne();
	}

	public List<QnaBean> selectQnaNoAnsList() {
		return repository.selectQnaNoAnsList();
	}

	public List<QnaBean> selectQnaAnsList() {
		return repository.selectQnaAnsList();
	}

	public int answerQna(QnaBean qna) {
		status = tx.getTransaction(this);
		int res = repository.answerQna(qna);
		if(res>0)	tx.commit(status);
		else		tx.rollback(status);
		return res;
	}

	public List<MemberBean> showMemList() {
		return repository.showMemList();
	}
	
	public Integer countTodays(String today) {
		return repository.countTodays(today);
	}
	
//	public List<MemLogBean> showTodaysMemList(Date today) {
//		return repository.showTodaysMemList(today);
//	}
	

	public List<MemberBean> nowMemOxCount(String contact) {
		return repository.nowMemOxCount(contact);
	}

	public int deleteQna(Integer q_num) {
		status = tx.getTransaction(this);
		int res = repository.deleteQna(q_num);
		if(res>0)	tx.commit(status);
		else		tx.rollback(status);
		return res;
	}
	
	
	
public int insert(NoticeBean notice) {
		
		status = tx.getTransaction(this);
		int res = repository.insert(notice);
		
		if(res > 0){
			tx.commit(status);
		}else{
			tx.rollback(status);
		}
		
		return res;
	}

public List<NoticeBean> selectList() {
	
	List<NoticeBean> list = repository.selectList();
	
	return list;
}

public NoticeBean selectOne(Integer notice_num) {
	
	return repository.selectOne(notice_num);
}


public int modi(NoticeBean notice) {
	
	return repository.modi(notice);
}

public int del(Integer notice_num) {
	status = tx.getTransaction(this);
	int res =  repository.del(notice_num);
	if(res > 0){
		tx.commit(status);
	}else{
		tx.rollback(status);
	}
	
	return res;
}

public List<NoticeBean> searchKey(NoticeBean notice) {

	return repository.searchKey(notice);
}


	//메모 (신정훈)	
		
		public List<MemberBean> getMemMemo(PageDTO pageDTO) {
			return repository.getMemMemo(pageDTO);
		}

		public MemberBean getCheckMemMemo(MemberBean mem) {
			return repository.getCheckMemMemo(mem);
		}

		public int insertAdminMemo(MemberBean mem) {
			
			status = tx.getTransaction(this);
			int res =  repository.insertAdminMemo(mem);
			if(res > 0){
				tx.commit(status);
			}else{
				tx.rollback(status);
			}
			return res;
			
		}


		

	

	
	
	
	
}// (Service) class END
