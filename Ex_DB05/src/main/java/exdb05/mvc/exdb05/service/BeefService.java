package exdb05.mvc.exdb05.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import exdb05.mvc.exdb05.bean.BeefBean;
import exdb05.mvc.exdb05.repository.BeefRepository;

@Service	
public class BeefService {

	@Autowired
	private BeefRepository repository;
	@Autowired
	private DataSource dataSource;
	
	private Connection conn;
	
	private void closeConn() {
		try {
			if(conn!=null && !conn.isClosed()) conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	

	public int insertOne(BeefBean bb) {
		int res = 0;
		try {
			conn = dataSource.getConnection();
			res = repository.insertOne(conn, bb);
			if(res > 0) conn.commit();
			else conn.rollback();
					
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConn();
		}
		return res;
	}

	public ArrayList<BeefBean> selectList() {
		
		ArrayList<BeefBean> listc = null;
		try {
			conn = dataSource.getConnection();
			listc = repository.selectList(conn);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConn();
		}
		return listc;
	}


	public BeefBean selectOne(Integer num) {
		BeefBean bb = null;
		try {
			conn = dataSource.getConnection();
			bb = repository.selectOne(conn, num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConn();
		}
		return bb;
	}
	
	public int updateOne(BeefBean bb, Integer num) {
		int res = 0;
		try {
			conn = dataSource.getConnection();
			res = repository.updateOne(conn, bb, num);
			if(res > 0) conn.commit();
			else conn.rollback();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConn();
		}
		return res;
	}

	public int deleteOne(Integer num) {
		int res = 0;
		try {
			conn = dataSource.getConnection();
			res = repository.deleteOne(conn, num);
			if(res > 0) conn.commit();
			else conn.rollback();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConn();
		}
		return res;
	}
	
	
}// (Service) class END
