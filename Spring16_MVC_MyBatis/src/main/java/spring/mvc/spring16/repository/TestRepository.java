package spring.mvc.spring16.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;

@Repository
public class TestRepository {

	@Autowired
	private SqlSession sqlSessionTemplate;
	@Autowired
	private PlatformTransactionManager tx;
	private TransactionStatus status;
	
	
	
	
}
