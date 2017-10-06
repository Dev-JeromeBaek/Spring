package spring.mvc.aaa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import spring.mvc.aaa.bean.Deal_Info;
import spring.mvc.aaa.bean.MemberBean;
import spring.mvc.aaa.bean.ReviewBean;
import spring.mvc.aaa.repository.ReviewRepository;

@Service
public class ReviewService extends DefaultTransactionDefinition{
	
	@Autowired
	private ReviewRepository repository;
	
	@Autowired
	private PlatformTransactionManager tx;
	private TransactionStatus status;
	
	

	public int insertReview(ReviewBean review) {
		status = tx.getTransaction(this);
		
		int res = repository.insertReview(review);
		
		if(res > 0) {
			tx.commit(status);
		} else {
			tx.rollback(status);
		}
		return res;
	}

	public List<ReviewBean> reviewList(int num) {
		// TODO Auto-generated method stub
		List<ReviewBean> review = repository.reviewList(num);
		return review;
	}

	public ReviewBean reviewDetail(Integer dr_num) {
		// TODO Auto-generated method stub
		ReviewBean reviewDetail = repository.reviewDetail(dr_num);
		return reviewDetail;
	}

	public Deal_Info dealInfo(int di_num) {
		// TODO Auto-generated method stub
		Deal_Info di = repository.dealInfo(di_num);
		return di;
	}

	public MemberBean memberInfo(int m_num) {
		// TODO Auto-generated method stub
		MemberBean mem = repository.memberInfo(m_num);
		return mem;
	}

	public int reviewScorePlus(ReviewBean scorePlus) {
		// TODO Auto-generated method stub
		int res = repository.reviewScorePlus(scorePlus);
		return res;
	}

	public Deal_Info diNameSearch(Integer di_num) {
		// TODO Auto-generated method stub
		Deal_Info di = repository.diNameSearch(di_num);
		return di;
	}
	
}
