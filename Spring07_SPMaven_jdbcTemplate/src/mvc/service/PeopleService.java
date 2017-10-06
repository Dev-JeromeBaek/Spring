package mvc.service;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import mvc.bean.PeopleBean;
import mvc.dao.PeopleDAO;

@Service
public class PeopleService extends DefaultTransactionDefinition {
	
	@Autowired
	private PeopleDAO dao;
	
	@Resource(name="tx")
	private PlatformTransactionManager tx;
	
	private TransactionStatus status;
//	=> 현재 트랜젝션의 상태를 받아줄 변수
//	=> 어느시점이 현재 시점인지 기준을 잡아주는 변수 commit? rollback?
//	- 현재상태를 표시해두는 역할..?
//	- extends DefaultTransactionDefinition ;; 
	
//	Connection을 직접 조종하는 것이 아니라면 
	
	public int insertOne(PeopleBean peoBean) {
		
		status = tx.getTransaction(this);	// 이곳이 현재상태라고 지정..?; 
											// this : DefaultTransactionDefinition
		int res = dao.insertOne(peoBean);
		
		if(res > 0) {
			tx.commit(status);
		} else {
			tx.rollback(status);
		}
		return res;
	}

	public List<PeopleBean> selectList() {
		// TODO Auto-generated method stub
		return dao.selectList();
	}
	
	
}// (Service) class END
