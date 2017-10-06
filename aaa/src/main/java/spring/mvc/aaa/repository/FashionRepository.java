package spring.mvc.aaa.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.aaa.bean.Deal_Detail;
import spring.mvc.aaa.bean.Deal_Info;

@Repository
public class FashionRepository {

	
	@Autowired
	private SqlSession sqlSessionTemplate;

	public List<Deal_Info> infoList(Deal_Info info) {
		System.out.println(info.getDi_c_num());
		System.out.println(info.getDi_name());
		return sqlSessionTemplate.selectList("dealMapper.fashionCategory",info);
		
	}


	public List<Deal_Detail> detailList(Deal_Detail detail) {
		
		return sqlSessionTemplate.selectList("dealMapper.fashionKind",detail);
	}


	public Deal_Info infoSelectOne(Integer di_num) {
		
		return sqlSessionTemplate.selectOne("dealMapper.fashionInfoSelectOne",di_num);
	}

	public List<Deal_Detail> detailSelectList(Integer di_num) {
		return sqlSessionTemplate.selectList("dealMapper.fashionDetailSelectList",di_num);
	}
}






















