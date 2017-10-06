package spring.mvc.aaa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import spring.mvc.aaa.bean.NoticeBean;
import spring.mvc.aaa.module.PageDTO;
import spring.mvc.aaa.repository.NoticeRepository;

@Service
public class NoticeService extends DefaultTransactionDefinition{
	
	@Autowired
	private NoticeRepository repository;
	
	@Autowired
	private PlatformTransactionManager tx;
	private TransactionStatus status;
	
	public List<NoticeBean> selectList() {
		return repository.selectList();
	}

	public List<NoticeBean> selectList(PageDTO pageDTO) {

		return repository.selectList(pageDTO);
	}
	
	
}
