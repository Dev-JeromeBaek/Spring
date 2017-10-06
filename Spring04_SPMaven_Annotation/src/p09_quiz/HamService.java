package p09_quiz;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("service")
public class HamService {

	@Autowired
	private HamDAO dao;

	public int insertOne(HamburgerDTO dto) {

		int res = dao.insertOne(dto);
		
		return res;
	}

	public ArrayList<HamburgerDTO> selectList() {

		return dao.selectList();
	}

	
	
}






