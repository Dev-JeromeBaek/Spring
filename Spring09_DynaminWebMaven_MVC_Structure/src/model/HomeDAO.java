package model;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

@Repository
public class HomeDAO {

	public ArrayList<String> selectList() {
		
		ArrayList<String> listc = new ArrayList<>();
		listc.add("전체 정보");
		
		return listc;
	}

}
