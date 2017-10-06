package z_ram.mvc.ram.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import z_ram.mvc.ram.bean.ramBean;
import z_ram.mvc.ram.repository.ramRepository;

@Service
public class ramService extends DefaultTransactionDefinition {
	
	@Autowired
	private ramRepository repository;
	
	@Autowired
	private PlatformTransactionManager tx;
	private TransactionStatus status;
	
	public int insertOne(ramBean ram) {
		
		status = tx.getTransaction(this);
		
		int res = repository.insertOne(ram);
		
		if(res > 0) {
			tx.commit(status);
		} else {
			tx.rollback(status);
		}
		return res;
	}

	public List<ramBean> selectList() {
		return repository.selectList();
	}

	public ramBean selectOne(Integer num) {
		return repository.selectOne(num);
	}

	public int updateOne(ramBean newRam) {
		
		status = tx.getTransaction(this);
		
		int res = repository.updateOne(newRam);
		if(res > 0) {
			tx.commit(status);
		} else {
			tx.rollback(status);
		}
		return res;
	}

	public int deleteOne(Integer num) {
		
		status = tx.getTransaction(this);
		
		int res = repository.deleteOne(num);
		if(res > 0) {
			tx.commit(status);
		} else {
			tx.rollback(status);
		}
		return res;
	}
	
}// (Service) class END
