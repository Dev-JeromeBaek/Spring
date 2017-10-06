package exmybatis.mvc.exmybatis01.repository;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import exmybatis.mvc.exmybatis01.bean.RamBean;

@Repository

public class RamRepository extends DefaultTransactionDefinition {
	
	@Autowired
	private SqlSession sqlSessionTemplate;
	@Resource(name="tx")
	private PlatformTransactionManager tx;
	private TransactionStatus status;
	
	
	public int insertOne(RamBean rbean) {
		
		status = tx.getTransaction(this);
		
		int res = sqlSessionTemplate.insert("ramMapper.insertOne", rbean);
		if(res > 0) {
			tx.commit(status);
		} else {
			tx.rollback(status);
		}
		return res;
	}
	
}
