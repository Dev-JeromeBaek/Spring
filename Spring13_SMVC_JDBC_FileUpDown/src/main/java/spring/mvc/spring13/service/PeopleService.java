package spring.mvc.spring13.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import spring.mvc.spring13.bean.PeopleBean;
import spring.mvc.spring13.repository.PeopleRepository;

@Service
public class PeopleService extends DefaultTransactionDefinition {
	
	@Autowired
	private PeopleRepository repository;
	
	//인터페이스라서 형태로는 못가져오니 네이밍을 맞춰서 Resource로 가져와야한다!
	@Resource(name="tx")
	private PlatformTransactionManager tx;
	
	private TransactionStatus status;

	public int insertOne(PeopleBean peoBean) {
		
		status = tx.getTransaction(this);
		
		int res = repository.insertOne(peoBean);
		
		if(res > 0) {
			tx.commit(status);
		} else {
			tx.rollback(status);
		}
		return res;
	}

	public List<PeopleBean> selectList() {
		return repository.selectList();
	}
	
}// (service) class END
