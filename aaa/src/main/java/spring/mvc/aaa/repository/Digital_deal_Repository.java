package spring.mvc.aaa.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.aaa.bean.Deal_Detail;
import spring.mvc.aaa.bean.Deal_Info;


@Repository
public class Digital_deal_Repository {
	
	@Autowired
	private SqlSession sqlSessionTemplate;

	
	public List<Deal_Info> digitalList(Deal_Info di) {
		// TODO Auto-generated method stub
		List<Deal_Info> digitalList = sqlSessionTemplate.selectList("dealMapper.digitalList", di);
		return digitalList;
	}

	public Deal_Info digitalOne1(Integer di_num) {
		// TODO Auto-generated method stub
		Deal_Info di = sqlSessionTemplate.selectOne("dealMapper.digitalOne1", di_num);
		System.out.println("1. repository : " + di_num);
		return di;
	}

	public List<Deal_Detail> digitalOne2(Integer di_num) {
		// TODO Auto-generated method stub
		List<Deal_Detail> dd = sqlSessionTemplate.selectList("dealMapper.digitalOne2", di_num);
		System.out.println("2. repository : " + di_num);
		return dd;
	}
	
	
	
	
	
	
}// (Repository) class END
