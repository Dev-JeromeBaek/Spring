package spring.mvc.aaa.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import spring.mvc.aaa.bean.MemRegistrationBean;
import spring.mvc.aaa.repository.AaaRepository;

@Service
public class AaaService extends DefaultTransactionDefinition{
	
	@Autowired
	private AaaRepository repository;
	
	@Autowired
	private PlatformTransactionManager tx;
	private TransactionStatus status;
	
	public int insertOne(MemRegistrationBean mem_reg) {
		// TODO Auto-generated method stub
		status = tx.getTransaction(this);
		
		int res = repository.insert(mem_reg);
		
		if(res > 0) {
			tx.commit(status);
		} else {
			tx.rollback(status);
		}
		return res;
	}
	
	
	
	
}// (Service) class END
