package spring.mvc.aaa.repository;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.aaa.bean.Deal_Info;
import spring.mvc.aaa.bean.MemLogBean;
import spring.mvc.aaa.bean.MemberBean;
import spring.mvc.aaa.bean.QnaBean;
import spring.mvc.aaa.bean.mapperBean;

@Repository
public class MemberRepository {
	
	@Autowired
	private SqlSession sqlSessionTemplate;

	public int insertOne(MemberBean memBean) {
		return sqlSessionTemplate.insert("memMapper.insertOne", memBean);
	}

	public MemberBean selectOne(MemberBean memBean) {
		return sqlSessionTemplate.selectOne("memMapper.selectOne", memBean);
	}
	
	public int registration(MemberBean mem) {
		
		return sqlSessionTemplate.insert("memMapper.registration", mem);
	}

	public MemberBean selectMem(String m_id) {
		MemberBean bb =  sqlSessionTemplate.selectOne("memMapper.selectMem", m_id);
		return bb;
	}

	public void updateOxCount(MemberBean logMem) {
		sqlSessionTemplate.update("memMapper.updateOxCount", logMem);
	}

	public void updateGrade(MemberBean logMem) {
		sqlSessionTemplate.update("memMapper.updateGrade", logMem);
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

	public Integer logOut(MemberBean mem) {
		return sqlSessionTemplate.update("memMapper.logOut", mem);
	}

	public Date today() {
		return sqlSessionTemplate.selectOne("logMapper.today");
	}
	
	public MemLogBean visitHistory(mapperBean mb) {
		return sqlSessionTemplate.selectOne("logMapper.visitHistory", mb);
		
	}

	public int insertLog(mapperBean mb) {
		return sqlSessionTemplate.insert("logMapper.insertLog", mb);
	}


//	public List<MemberBean> getTotalCount() {
		
//		return sqlSessionTemplate.selectList;
//	}

//	======================================================================
//	[경민형님]
	
	public List<MemberBean> idCheck01() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("memMapper.idCheck01");
	}

	public List<MemberBean> selectList11() {
		// TODO Auto-generated method stub
		List<MemberBean> listc = sqlSessionTemplate.selectList("memMapper.id_Find");
		return listc;
	}
	public List<MemberBean> selectList22() {
		// TODO Auto-generated method stub
		List<MemberBean> listc = sqlSessionTemplate.selectList("memMapper.pw_Find");
		return listc;
	}
//	public List<MemberBean> getTotalCount() {

	public List<MemberBean> selectList33() {
		// TODO Auto-generated method stub
		List<MemberBean> listc = sqlSessionTemplate.selectList("memMapper.FindID");
		return listc;
	}

	public List<MemberBean> selectList44() {
		// TODO Auto-generated method stub
		List<MemberBean> listc = sqlSessionTemplate.selectList("memMapper.FindPW");
		return listc;
	}
	
//	======================================================================
//	[03.21 수인]
	
	public Deal_Info showInfo(int num) {
		System.out.println(" mem repository에서 dealinfo 되나 확인");
		return sqlSessionTemplate.selectOne("memMapper.showInfo",num);
	}

	public MemberBean showMember(int mnum) {
		return sqlSessionTemplate.selectOne("memMapper.showMember",mnum);
	}

	public int updatememPoint(MemberBean mem) {
		return sqlSessionTemplate.update("memMapper.updatememPoint",mem);
	}
	
	
//	======================================================================
	
//	=================================================================
//	[개인정보 수정 (신정훈)]
	
	public int memUpdate(MemberBean mem) {
		return sqlSessionTemplate.update("memMapper.updatePerMember", mem);
	}
//	=================================================================
//	[전화 (신정훈)]
	
	public MemberBean getMemo(Integer m_num) {
		return sqlSessionTemplate.selectOne("memMapper.getMemo",m_num);
	}
	
	public int insertMemo(MemberBean mem) {
		return sqlSessionTemplate.update("memMapper.insertMemo", mem);
	}

	public MemberBean getCheckMemMemo(MemberBean mem) {
		return sqlSessionTemplate.selectOne("memMapper.getCheckMemMemo",mem);
	}

	public int delMemo(MemberBean mem) {
		return sqlSessionTemplate.insert("memMapper.delMemo",mem);
	}

	public List<MemberBean> showMemList() {
		return sqlSessionTemplate.selectList("memMapper.showMemList");
	}
	
	
	
	
}
