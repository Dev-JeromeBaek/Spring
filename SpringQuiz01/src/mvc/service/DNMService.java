package mvc.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import mvc.bean.DNMBean;
import mvc.dao.DNMDAO;

@Component("service")
public class DNMService {

	@Autowired
	private DNMDAO dao;
	
	private Connection conn;
	
	@Autowired
	private DataSource dataSource;
	
	public int insertOne(DNMBean dnmBean) {
		int res = 0;
		try {
			conn = dataSource.getConnection();
			res = dao.insertOne(conn, dnmBean);
			
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
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return res;
	}

}
