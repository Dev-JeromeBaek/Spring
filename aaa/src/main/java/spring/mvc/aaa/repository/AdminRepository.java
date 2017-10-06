package spring.mvc.aaa.repository;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.aaa.bean.QnaBean;
import spring.mvc.aaa.module.PageDTO;
import spring.mvc.aaa.bean.MemLogBean;
import spring.mvc.aaa.bean.MemberBean;
import spring.mvc.aaa.bean.NoticeBean;

@Repository
public class AdminRepository {
	
	@Autowired
	private SqlSession sqlSessionTemplate;

	public MemberBean selectOne() {
		return sqlSessionTemplate.selectOne("memMapper.selectOne",1);
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

	public List<MemberBean> showMemList() {
		return sqlSessionTemplate.selectList("memMapper.showMemList");
	}
	
	public Integer countTodays(String today) {
		Integer aa = sqlSessionTemplate.selectList("logMapper.countTodays", today).size();
		System.out.println("AA : " + aa);
		return sqlSessionTemplate.selectList("logMapper.countTodays", today).size();
	}
	
//	public List<MemLogBean> showTodaysMemList(Date today) {
//		return sqlSessionTemplate.selectList("logMapper.showTodaysMemList", today);
//	}
	
	public List<MemberBean> nowMemOxCount(String contact) {
		return sqlSessionTemplate.selectList("memMapper.nowMemOxCount", contact);
	}

	public int deleteQna(Integer q_num) {
		return sqlSessionTemplate.delete("qnaMapper.delete", q_num);
	}
	
	
public int insert(NoticeBean notice) {
		
		int res = sqlSessionTemplate.insert("noticeMapper.noticeInsert",notice);
		
		return res;
	}


	public List<NoticeBean> selectList() {
		
		List<NoticeBean> list = sqlSessionTemplate.selectList("noticeMapper.noticeSelectList");
		
		return list;
	}


	public NoticeBean selectOne(Integer notice_num) {
		
		return sqlSessionTemplate.selectOne("noticeMapper.noticeSelectOne",notice_num);
	}


	public int modi(NoticeBean notice) {

		return sqlSessionTemplate.update("noticeMapper.noticeModi",notice);
	}


	public int del(Integer notice_num) {
		return sqlSessionTemplate.delete("noticeMapper.noticeDel",notice_num);
	}


	public List<NoticeBean> searchKey(NoticeBean notice) {
		
		return sqlSessionTemplate.selectList("noticeMapper.noticeKeyWord",notice);
	}


	//메모 (신정훈)
		public List<MemberBean> getMemMemo() {
			return sqlSessionTemplate.selectList("adminMapper.getMemoList");
		}



		public MemberBean getCheckMemMemo(MemberBean mem) {
			return sqlSessionTemplate.selectOne("adminMapper.getCheckMemMemo",mem);
		}



		public int insertAdminMemo(MemberBean mem) {
			return sqlSessionTemplate.update("adminMapper.insertAdminMemo",mem);
		}

		

		public List<MemberBean> getMemMemo(PageDTO pageDTO) {
			int countAllRecord = sqlSessionTemplate.selectOne("adminMapper.countt");
			System.out.println("레코드 총 갯수 : "+ countAllRecord);
			
			pageDTO.suinCountRecord(countAllRecord);
			
			return sqlSessionTemplate.selectList("adminMapper.selectListt",pageDTO);
		}

		

	



	
	
}// (Repository) class END
