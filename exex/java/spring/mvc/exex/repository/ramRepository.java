package spring.mvc.exex.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import spring.mvc.exex.bean.ramBean;

@Repository
public class ramRepository {
	
	@Autowired
	private SqlSession sqlSessionTemplate;

	public int insertOne(ramBean ram) {
		System.out.println(ram.getOrgName());
		return sqlSessionTemplate.insert("ramMapper.insertOne", ram);
//		if(ram.getOrgName() == null) {
//		} else {
//			return sqlSessionTemplate.insert("ramMapper.insertOne2", ram);
//		}
	}

	public List<ramBean> selectList() {
		
		return sqlSessionTemplate.selectList("ramMapper.selectList");
	}

	public ramBean selectOne(Integer num) {
		
		return sqlSessionTemplate.selectOne("ramMapper.selectOne", num);
	}

	public int updateOne(ramBean newRam) {
		
		return sqlSessionTemplate.update("ramMapper.updateOne", newRam);
	}

	public int deleteOne(Integer num) {
		return sqlSessionTemplate.delete("ramMapper.deleteOne", num);
	}

	

}
