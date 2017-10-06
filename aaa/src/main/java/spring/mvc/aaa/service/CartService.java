package spring.mvc.aaa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import spring.mvc.aaa.bean.CartBean;
import spring.mvc.aaa.bean.Corp;
import spring.mvc.aaa.bean.Deal_Detail;
import spring.mvc.aaa.bean.Deal_Info;
import spring.mvc.aaa.repository.CartRepository;

@Service
public class CartService extends DefaultTransactionDefinition{
	
	@Autowired
	private CartRepository repository;
	
	@Autowired
	private PlatformTransactionManager tx;
	private TransactionStatus status;

	public int insertCart(CartBean cb) {
		status = tx.getTransaction(this);
		int res = repository.insertCart(cb);
		if(res>0)	tx.commit(status);
		else		tx.rollback(status);
		return res;
	}

	public List<CartBean> cartList(Integer m_num) {
		return repository.cartList(m_num);
	}

	public int updateAmount(CartBean ctb) {
		status = tx.getTransaction(this);
		int res = repository.updateAmount(ctb);
		if(res>0)	tx.commit(status);
		else		tx.rollback(status);
		return res;
	}

	public List<Deal_Info> cartDIList(Integer m_num) {
		return repository.cartDIList(m_num);
	}

	public List<Deal_Detail> cartDDList(Integer m_num) {
		return repository.cartDDList(m_num);
	}

	public List<Corp> cartCorpList(Integer m_num) {
		return repository.cartCorpList(m_num);
	}

	public Corp cartCorpOne(Integer di_c_num) {
		return repository.cartCorpOne(di_c_num);
	}


	public int deleteOne(Integer di_num, Integer m_num) {
		status = tx.getTransaction(this);
		int res = repository.deleteOne(di_num,m_num);
		if(res>0)	tx.commit(status);
		else		tx.rollback(status);
		return res;
	}

	public int deleteAmount(String dd_num, Integer m_num) {
		status = tx.getTransaction(this);
		int res = repository.deleteAmount(dd_num,m_num);
		if(res>0)	tx.commit(status);
		else		tx.rollback(status);
		return res;
	}

	public int updateAA(Integer m_num,Integer dd_num, Integer amou) {
		status = tx.getTransaction(this);
		int res = repository.updateAA(m_num,dd_num,amou);
		if(res>0)	tx.commit(status);
		else		tx.rollback(status);
		return res;
	}
	
	

}
