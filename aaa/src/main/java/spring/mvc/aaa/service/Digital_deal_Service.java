package spring.mvc.aaa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import spring.mvc.aaa.bean.Deal_Detail;
import spring.mvc.aaa.bean.Deal_Info;
import spring.mvc.aaa.repository.Digital_deal_Repository;

@Service
public class Digital_deal_Service extends DefaultTransactionDefinition{
	
	@Autowired
	private Digital_deal_Repository repository;
	
	@Autowired
	private PlatformTransactionManager tx;
	private TransactionStatus status;
	
	public List<Deal_Info> digitalList(Deal_Info di) {
		// TODO Auto-generated method stub
		List<Deal_Info> digitalList = repository.digitalList(di);
		return digitalList;
	}

	public Deal_Info digitalOne1(Integer di_num) {
		// TODO Auto-generated method stub
		Deal_Info di = repository.digitalOne1(di_num);
		return di;
	}

	public List<Deal_Detail> digitalOne2(Integer di_num) {
		// TODO Auto-generated method stub
		List<Deal_Detail> dd = repository.digitalOne2(di_num);
		return dd;
	}
	
	
	
	
}// (Service) class END
