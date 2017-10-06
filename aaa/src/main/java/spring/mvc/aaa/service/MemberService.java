package spring.mvc.aaa.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import spring.mvc.aaa.bean.Deal_Info;
import spring.mvc.aaa.bean.MemLogBean;
import spring.mvc.aaa.bean.MemberBean;
import spring.mvc.aaa.bean.QnaBean;
import spring.mvc.aaa.bean.mapperBean;
import spring.mvc.aaa.repository.MemberRepository;

@Service
public class MemberService extends DefaultTransactionDefinition {
	
	@Autowired
	private MemberRepository repository;
	
	@Autowired
	private PlatformTransactionManager tx;
	private TransactionStatus status;
	
	public int insertOne(MemberBean memBean) {
		
		status = tx.getTransaction(this);
		
		int res = repository.insertOne(memBean);
		
		if(res > 0) {
			tx.commit(status);
		} else {
			tx.rollback(status);
		}
		return res;
	}

	public MemberBean selectMem(String m_id) {
		return repository.selectMem(m_id);
	}
	public void updateOxCount(MemberBean logMem) {
		repository.updateOxCount(logMem);
	}

	public void updateGrade(MemberBean logMem) {
		repository.updateGrade(logMem);
	}
	
	public int insertQna(QnaBean qna) {
		status = tx.getTransaction(this);
		int res = repository.insertQna(qna);
		if(res>0)	tx.commit(status);
		else		tx.rollback(status);
		return res;
	}
	
	public List<QnaBean> selectQnaList(Integer m_num){
		return repository.selectQnaList(m_num);
	}

	public QnaBean selectQna(Integer q_num) {
		return repository.selectQna(q_num);
	}

	public int modifyQna(QnaBean qna) {
		status = tx.getTransaction(this);
		int res = repository.modifyQna(qna);
		if(res>0)	tx.commit(status);
		else		tx.rollback(status);
		return res;
	}

	public int deleteQna(Integer q_num) {
		status = tx.getTransaction(this);
		int res = repository.deleteQna(q_num);
		if(res>0)	tx.commit(status);
		else		tx.rollback(status);
		return res;
	}

	public Integer logOut(MemberBean mem) {
		return repository.logOut(mem);
	}

	public int registration(MemberBean mem) {
		// TODO Auto-generated method stub
				status = tx.getTransaction(this);
				
				int res = repository.registration(mem);
				
				if(res > 0) {
					tx.commit(status);
				} else {
					tx.rollback(status);
				}
				return res;
			}
	
	public Date today() {
		return repository.today();
	}

	public MemLogBean visitHistory(mapperBean mb) {
		return repository.visitHistory(mb);
	}

	public int insertLog(mapperBean mb) {
		status = tx.getTransaction(this);
		int res = repository.insertLog(mb);
		if(res > 0) {
			tx.commit(status);
		} else {
			tx.rollback(status);
		}
		return res;
	}

//	=============================================================================
//	[경민형님]
	
	public List<MemberBean> idCheck01() {
		// TODO Auto-generated method stub
		List<MemberBean> search = repository.idCheck01();
		return search;
	}

	public List<MemberBean> selectList11() {
		// TODO Auto-generated method stub
		List<MemberBean> listc = repository.selectList11();
		return listc;
	}
	public List<MemberBean> selectList22() {
		// TODO Auto-generated method stub
		List<MemberBean> listc = repository.selectList22();
		return listc;
	}

	public List<MemberBean> selectList33() {
		// TODO Auto-generated method stub
		List<MemberBean> listc = repository.selectList33();
		return listc;
	}

	public List<MemberBean> selectList44() {
		// TODO Auto-generated method stub
		List<MemberBean> listc = repository.selectList44();
		return listc;
	}
	
//	===========================================================================
//	[03.21 수인]
	
	public Deal_Info showInfo(int num) {
		System.out.println("msmService 에서의 기업회원 num 체크 : "+ num);
		Deal_Info info = repository.showInfo(num);
		return info;
	}

	public MemberBean showMember(int mnum) {
		System.out.println("memService에서의 mem num 체크!" + mnum);
		MemberBean mem = repository.showMember(mnum);
		return mem;
	}

	public int updatememPoint(MemberBean mem) {
		status = tx.getTransaction(this);
		int res = repository.updatememPoint(mem);
		if(res > 0){
			tx.commit(status);
		}else{
			tx.rollback(status);
		}
		return res;
	}
	
//	===========================================================================
//	=================================================================
//	[개인정보 수정 (신정훈)]	

	public int memUpdate(MemberBean mem) {
		status = tx.getTransaction(this);
		int res = repository.memUpdate(mem);
		
		if(res > 0){
			tx.commit(status);
		}else{
			tx.rollback(status);
		}
		
		
		return res;
	}
//	=================================================================
//	[전화 (신정훈)]
	

	public MemberBean getMemo(Integer m_num) {

		return repository.getMemo(m_num);
	}
	
	
	public int insertMemo(MemberBean mem) {
		status = tx.getTransaction(this);
		
		int res = repository.insertMemo(mem);
		
		if(res > 0){
			tx.commit(status);
		}else{
			tx.rollback(status);
		}
		
		
		return res;
	}

	public MemberBean getCheckMemMemo(MemberBean mem) {
		return repository.getCheckMemMemo(mem);
	}

	public int delMemo(MemberBean mem) {
		
		status = tx.getTransaction(this);
		
		int res = repository.delMemo(mem);
		
		if(res > 0){
			tx.commit(status);
		}else{
			tx.rollback(status);
		}
		return res;
	}

	public List<MemberBean> showMemList() {
		return repository.showMemList();
	}

}
