package main.mvc.yeob.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class YeobRepository {

	@Autowired
	private SqlSession sqlSessionTemplate;
	
}// (Repository) class END
