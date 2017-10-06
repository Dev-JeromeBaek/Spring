package mvc.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import mvc.bean.PeopleBean;

@Repository
public class PeopleRepository extends DefaultTransactionDefinition {

	@Autowired
	private SqlSession sqlSessionTemplate;
	@Autowired
	private PlatformTransactionManager tx;
	private TransactionStatus status;
	
	public int insertOne(PeopleBean peoBean) {
		
		status = tx.getTransaction(this);
		
		int res = sqlSessionTemplate.insert(
						"peopleMapper.insertOne", peoBean);
		if(res > 0) {
			tx.commit(status);
		} else {
			tx.rollback(status);
		}
		return res;
	}

	public List<PeopleBean> selectList() {
		return sqlSessionTemplate.selectList(
						"peopleMapper.selectList");
	}

}
