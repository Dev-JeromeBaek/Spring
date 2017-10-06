package p10_useBeanEx;

import java.util.ArrayList;

import org.springframework.context.ApplicationContext;

public class peoDAO {
	
	private ArrayList<PeopleDTO> listcDB;
	private JdbcConnector conn;
	
	public int insertOne(ApplicationContext container, PeopleDTO dto) {
		
		listcDB = (ArrayList<PeopleDTO>) container.getBean("listcDB");
		conn = (JdbcConnector) container.getBean("dbConn");
//		conn.getConnection();
		
//		listc.add() : boolean형.................................... 당황......;;;;;;;;
		boolean res = listcDB.add(dto);
		
		return res ? 1 : 0;
	}

	public ArrayList<PeopleDTO> selectList(ApplicationContext container) {
		
		listcDB = (ArrayList<PeopleDTO>) container.getBean("listcDB");
		
		return listcDB;
	}
	
	
	
}// class END
