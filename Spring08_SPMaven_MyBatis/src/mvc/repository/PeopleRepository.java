package mvc.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import mvc.bean.MapperBean;
import mvc.bean.PeopleBean;

@Repository
public class PeopleRepository extends DefaultTransactionDefinition {
	
	@Autowired
	private SqlSession sqlSessionTemplate;
//	myBaties와 관련된 Template => SqlSession sqlSessionTemplate
	
	@Autowired
	private PlatformTransactionManager tx;
	private TransactionStatus status;
	
	public int insertOne(PeopleBean peoBean) {
		status = tx.getTransaction(this);
		
		int res = sqlSessionTemplate.insert(
					"peopleMapper.insertOne", peoBean);
		// peopleMapper라는 namespace이름이 지정된 Mapper 안에 insertOne 메소드를 작동시켜라.
		
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

	public List<PeopleBean> selectAll(String search) {
		
		return sqlSessionTemplate.selectList(
									"peopleMapper.selectAll", search);
	}

	public List<PeopleBean> selectAll02(PeopleBean peoBean) {
		
		return sqlSessionTemplate.selectList("peopleMapper.selectAll02", peoBean);
	}

	public PeopleBean selectOne(int pk) {
		
		return sqlSessionTemplate.selectOne("peopleMapper.selectOne", pk);
	}

	public List<PeopleBean> selectRange(MapperBean mapBean) {
		
		return sqlSessionTemplate.selectList("peopleMapper.selectRange", mapBean);
		
	}

	public List<PeopleBean> selectUsingSQL(MapperBean mapBean) {
		
		return sqlSessionTemplate.selectList("peopleMapper.selectUsingSQL", mapBean);
	}

	public List<PeopleBean> selectKeyWord(MapperBean mapBean) {
		return sqlSessionTemplate.selectList("peopleMapper.selectKeyWord", mapBean);
	}

	
	
	
}// (Repository) class END
