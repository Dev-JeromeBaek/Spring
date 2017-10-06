package spring.mvc.spring15.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import spring.mvc.spring15.bean.LogBean;

@Repository
public class LogRepository extends DefaultTransactionDefinition {
	
	@Autowired
	private SqlSession sqlSessionTemlplate;
	
	@Autowired
	private PlatformTransactionManager tx;
	private TransactionStatus status;
	
	public int insertOne(LogBean log) {
		
		status = tx.getTransaction(this);
		
		int res = sqlSessionTemlplate.insert("logMapper.insertOne", log);
		
		if(res > 0) {
			tx.commit(status);
		} else {
			tx.rollback(status);
		}
		return res;
	}

	public LogBean selectOne(LogBean log) {
		return sqlSessionTemlplate.selectOne("logMapper.selectOne", log);
	}
	
}// (Repository) class END
