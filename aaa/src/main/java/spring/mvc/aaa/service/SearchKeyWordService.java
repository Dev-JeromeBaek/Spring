package spring.mvc.aaa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import spring.mvc.aaa.bean.Deal_Detail;
import spring.mvc.aaa.bean.Deal_Info;
import spring.mvc.aaa.repository.SearchKeyWordRepository;

@Service
public class SearchKeyWordService extends DefaultTransactionDefinition{
	
	@Autowired
	private SearchKeyWordRepository repository;
	
	@Autowired
	private PlatformTransactionManager tx;
	private TransactionStatus status;
	
	public List<Deal_Info> SearchKeyWord(String keyWord) {
		// TODO Auto-generated method stub
		List<Deal_Info> listc = repository.SearchKeyWord(keyWord);
		return listc;
	}

	public List<Deal_Info> SearchClick(String keyWord) {
		// TODO Auto-generated method stub
		List<Deal_Info> listc = repository.SearchClick(keyWord);
		return listc;
	}

	public Deal_Info KeyWordChoice01(Integer keyWord) {
		Deal_Info di = repository.KeyWordChoice01(keyWord);
		return di;
	}

	public List<Deal_Detail> KeyWordChoice02(Integer keyWord) {
		// TODO Auto-generated method stub
		List<Deal_Detail> dd = repository.KeyWordChoice02(keyWord);
		return dd;
	}
	
	
	
	
}
