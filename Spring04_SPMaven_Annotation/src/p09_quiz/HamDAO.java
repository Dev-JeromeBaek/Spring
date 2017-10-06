package p09_quiz;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dao")
public class HamDAO {

	@Autowired
	private ArrayList<HamburgerDTO> listc;

	public int insertOne(HamburgerDTO dto) {

		boolean res = listc.add(dto);
		
		return res ? 1 : 0;
	}

	public ArrayList<HamburgerDTO> selectList() {

		return listc;
	}
	
}





