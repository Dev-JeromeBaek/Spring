package spring.mvc.aaa.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.aaa.bean.QnaBean;
import spring.mvc.aaa.bean.MemberBean;

@Repository
public class AaaRepository {
	
	@Autowired
	private SqlSession sqlSessionTemplate;

	public MemberBean selectOne() {
		return sqlSessionTemplate.selectOne("memberMapper.selectOne",1);
	}

	public int insertQna(QnaBean qna) {
		return sqlSessionTemplate.insert("qnaMapper.insertOne",qna);
	}

	public List<QnaBean> selectQnaList(Integer m_num) {
		return sqlSessionTemplate.selectList("qnaMapper.selectList", m_num);
	}

	public QnaBean selectQna(Integer q_num) {
		return sqlSessionTemplate.selectOne("qnaMapper.selectOne", q_num);
	}

	public int modifyQna(QnaBean qna) {
		return sqlSessionTemplate.update("qnaMapper.modify", qna);
	}

	public int deleteQna(Integer q_num) {
		return sqlSessionTemplate.delete("qnaMapper.delete", q_num);
	}

	public List<QnaBean> selectQnaNoAnsList() {
		return sqlSessionTemplate.selectList("qnaMapper.selectQnaNoAnsList");
	}

	public List<QnaBean> selectQnaAnsList() {
		return sqlSessionTemplate.selectList("qnaMapper.selectQnaAnsList");
	}

	public int answerQna(QnaBean qna) {
		return sqlSessionTemplate.update("qnaMapper.answerQna", qna);
	}
	
}// (Repository) class END
