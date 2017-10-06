package p10_useBeanEx;

import java.util.ArrayList;

import org.springframework.context.ApplicationContext;

public class PeoService {
	
	private JdbcConnector conn;
	private peoDAO dao;
	
	public int insertOne(ApplicationContext container, PeopleDTO dto) {
		conn = (JdbcConnector) container.getBean("dbConn");
		dao = (peoDAO) container.getBean("dao");
		conn.getConnection();
		
		int res = dao.insertOne(container, dto);
		
		if(res > 0) {
			conn.connCommit();
		} else {
			conn.connRollback();
		}
		
		conn.closeConn();
		
		return res;
	}


	public ArrayList<PeopleDTO> selectList(ApplicationContext container) {
		conn = (JdbcConnector) container.getBean("dbConn");
		dao = (peoDAO) container.getBean("dao");
		
		ArrayList<PeopleDTO> listc = dao.selectList(container);
		
		conn.closeConn();
		
		return listc;
	}
	
	
}// class END
