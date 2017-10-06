package spring.mvc.aaa.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.aaa.bean.Deal_Info;
import spring.mvc.aaa.bean.MemberBean;
import spring.mvc.aaa.bean.ReviewBean;

@Repository
public class ReviewRepository {
	
	@Autowired
	private SqlSession sqlSessionTemplate;

	

	public int insertReview(ReviewBean review) {
		// TODO Auto-generated method stub
		int res = sqlSessionTemplate.insert("review_mapper.insertReview", review);
		return res;
	}

	public List<ReviewBean> reviewList(int num) {
		// TODO Auto-generated method stub
		List<ReviewBean> review = sqlSessionTemplate.selectList("review_mapper.reviewList", num);
		return review;
	}

	public ReviewBean reviewDetail(Integer dr_num) {
		// TODO Auto-generated method stub
		ReviewBean reviewDetail = sqlSessionTemplate.selectOne("review_mapper.reviewDetail", dr_num);
		return reviewDetail;
	}

	public Deal_Info dealInfo(int di_num) {
		// TODO Auto-generated method stub
		Deal_Info di = sqlSessionTemplate.selectOne("review_mapper.dealInfo",di_num);
		return di;
	}

	public MemberBean memberInfo(int m_num) {
		// TODO Auto-generated method stub
		MemberBean mem = sqlSessionTemplate.selectOne("review_mapper.memberInfo", m_num);
		return mem;
	}

	public int reviewScorePlus(ReviewBean scorePlus) {
		// TODO Auto-generated method stub
		int res = sqlSessionTemplate.update("review_mapper.reviewScorePlus", scorePlus);
		return res;
	}

	public Deal_Info diNameSearch(Integer di_num) {
		// TODO Auto-generated method stub
		Deal_Info di = sqlSessionTemplate.selectOne("review_mapper.diNameSearch", di_num);
		return di;
	}
	
	
}
