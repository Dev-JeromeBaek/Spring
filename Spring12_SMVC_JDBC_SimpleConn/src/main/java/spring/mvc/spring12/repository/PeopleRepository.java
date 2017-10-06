package spring.mvc.spring12.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.spring12.bean.PeopleBean;

@Repository
public class PeopleRepository {
	
	@Autowired
	private DataSource dataSource;
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public ArrayList<PeopleBean> selectList() {
		
		ArrayList<PeopleBean> listc = null;
		
		try {
			conn = dataSource.getConnection();
			String sql = "select * from t_peo order by num";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				PeopleBean peoBean = new PeopleBean();
				peoBean.setNum(rs.getInt("num"));
				peoBean.setName(rs.getString("name"));
				peoBean.setAge(rs.getInt("age"));
				if(listc == null) listc = new ArrayList<>();
				listc.add(peoBean);
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
		
		return listc;
	}
	
}// class END
