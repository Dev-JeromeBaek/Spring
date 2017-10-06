package spring.mvc.aaa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;

import spring.mvc.aaa.bean.Deal_Detail;
import spring.mvc.aaa.bean.Deal_Info;
import spring.mvc.aaa.repository.FashionRepository;

@Service
public class FashionService {

	
	@Autowired
	private FashionRepository repository;
	
	@Autowired
	private PlatformTransactionManager tx;
	private TransactionStatus status;
	
	public List<Deal_Info> infoList(Deal_Info info) {
		
		return repository.infoList(info);
		
	}

	public List<Deal_Detail> detailList(Deal_Detail detail) {

		
		return repository.detailList(detail);
	}

	public Deal_Info infoSelectOne(Integer di_num) {

		return repository.infoSelectOne(di_num);
	}

	public List<Deal_Detail> detailSelectList(Integer di_num) {
		return repository.detailSelectList(di_num);
	}
	
	
	
}

















