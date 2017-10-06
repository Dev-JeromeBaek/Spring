package mvc.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import mvc.bean.PeopleBean;
import mvc.dao.PeopleDAO;

public class PeopleService {
	
	private PeopleDAO dao;
	private Connection conn;	// DataSource로 Connection을 주입받는다!
	private DataSource dataSource;
	
	

	public int insertOne(PeopleBean peoBean) {
		int res = 0;
		try {
			conn = dataSource.getConnection();
			res = dao.insertOne(conn, peoBean);
			
			if(res > 0) {
				conn.commit();
			} else {
				conn.rollback();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return res;
	}
	
	public ArrayList<PeopleBean> selectList() {
		
		ArrayList<PeopleBean> listc = null;
		
		try {
			conn = dataSource.getConnection();
			listc = dao.selectList(conn);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return listc;
	}
	
	public void setDao(PeopleDAO dao) {
		this.dao = dao;
	}
	
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
//	public PeopleDAO getDao() {
//		return dao;
//	}
	
}// (Service) class END
