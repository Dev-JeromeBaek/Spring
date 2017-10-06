package main.mvc.yeob.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import main.mvc.yeob.repository.YeobRepository;

@Service
public class YeobService extends DefaultTransactionDefinition {
	
	@Autowired
	private YeobRepository repository;
	@Autowired
	private PlatformTransactionManager tx;
	private TransactionStatus status;
	
	
	
	
}// (Service) class END
