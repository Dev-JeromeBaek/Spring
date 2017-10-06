package spring.mvc.aaa.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.aaa.bean.Deal_Detail;
import spring.mvc.aaa.bean.Deal_Info;

@Repository
public class SearchKeyWordRepository {
	
	@Autowired
	private SqlSession sqlSessionTemplate;

	public List<Deal_Info> SearchKeyWord(String keyWord) {
		// TODO Auto-generated method stub
		System.out.println("SearchKeyWord - Repository : " + keyWord);
		List<Deal_Info> listc = sqlSessionTemplate.selectList("search_mapper.SearchKeyWord", keyWord);
		return listc;
	}

	public List<Deal_Info> SearchClick(String keyWord) {
		// TODO Auto-generated method stub
		System.out.println("SearchClick - Repository : " + keyWord);
		List<Deal_Info> listc = sqlSessionTemplate.selectList("search_mapper.SearchClick", keyWord);
		return listc;
	}

	public Deal_Info KeyWordChoice01(Integer keyWord) {
		System.out.println("KeyWordChoice01- Deal_Info - Repository : " + keyWord);
		Deal_Info di = sqlSessionTemplate.selectOne("search_mapper.KeyWordChoice01", keyWord);
		return di;
	}

	
//	[List로 수정 바랍니다! 그리고 주석 지우시면 다음에 합칠때 .........]
	public List<Deal_Detail> KeyWordChoice02(Integer keyWord) {
		// TODO Auto-generated method stub
		System.out.println("KeyWordChoice02- Deal_Detail - Repository : " + keyWord);
		List<Deal_Detail> dd = sqlSessionTemplate.selectList("search_mapper.KeyWordChoice02", keyWord);
		return dd;
	}
	
}
