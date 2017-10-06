package spring.mvc.aaa.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.aaa.bean.MemRegistrationBean;

@Repository
public class AaaRepository {
	
	@Autowired
	private SqlSession sqlSessionTemplate;

	public int insert(MemRegistrationBean mem_reg) {
		// TODO Auto-generated method stub

		int res = sqlSessionTemplate.insert("aaaMapper.insertOne", mem_reg);
		
		return res;
	}
	
	
	
	
	
	
}// (Repository) class END
