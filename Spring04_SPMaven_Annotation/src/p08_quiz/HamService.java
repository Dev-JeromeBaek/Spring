package p08_quiz;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class HamService {

	@Autowired
	private HamDAO dao;
	
	public int insertOne(HamburgerDTO dto) {
		
		int res = dao.insertOne(dto);
		
		return res;
	}

	public ArrayList<HamburgerDTO> selectList() {
		
		ArrayList<HamburgerDTO> listc = dao.selectList();
		
		return listc;
	}

	
}// class END
