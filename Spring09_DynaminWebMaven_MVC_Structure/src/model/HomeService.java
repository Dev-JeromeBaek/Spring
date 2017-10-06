package model;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HomeService {
	
	@Autowired
	private HomeDAO dao;

	public ArrayList<String> selectList() {
		
		return dao.selectList();
	}

}
