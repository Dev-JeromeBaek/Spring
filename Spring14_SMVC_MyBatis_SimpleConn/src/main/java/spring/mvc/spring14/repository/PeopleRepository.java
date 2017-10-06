package spring.mvc.spring14.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import spring.mvc.spring14.bean.PeopleBean;
import spring.mvc.spring14.module.PageDTO;

@Repository
public class PeopleRepository extends DefaultTransactionDefinition {
	
	@Autowired
	private SqlSession sqlSessionTemplate;
	
	@Autowired
	private PlatformTransactionManager tx;
	private TransactionStatus status;
	
	public List<PeopleBean> selectList(PageDTO pageDto) {
		
		Integer countAllRecord = sqlSessionTemplate.selectOne("peopleMapper.count");
		System.out.println("레ㅐ코드 총 갯수 : " + countAllRecord);
		
		pageDto.suinCountRecord(countAllRecord);
		
		return sqlSessionTemplate.selectList("peopleMapper.selectList", pageDto);
	}

	public PeopleBean selectOne(Integer num) {
		return sqlSessionTemplate.selectOne("peopleMapper.selectOne");
	}
	
	
	
}// (Repository) class END
