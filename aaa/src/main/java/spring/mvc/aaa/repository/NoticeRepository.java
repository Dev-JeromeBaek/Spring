package spring.mvc.aaa.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.aaa.bean.NoticeBean;
import spring.mvc.aaa.module.PageDTO;

@Repository
public class NoticeRepository {
	
	@Autowired
	private SqlSession sqlSessionTemplate;

	public List<NoticeBean> selectList() {
		return sqlSessionTemplate.selectList("noticeMapper.selectList");
	}

	public List<NoticeBean> selectList(PageDTO pageDTO) {
		int countAllRecord = sqlSessionTemplate.selectOne("noticeMapper.countt");
		
		System.out.println("레코드 총 갯수 : "+ countAllRecord);
		
		pageDTO.suinCountRecord(countAllRecord);
		
		return sqlSessionTemplate.selectList("noticeMapper.selectListt",pageDTO);

	}
	
}






















