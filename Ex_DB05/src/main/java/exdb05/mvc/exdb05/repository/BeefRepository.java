package exdb05.mvc.exdb05.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import exdb05.mvc.exdb05.bean.BeefBean;

@Repository
public class BeefRepository {

	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private void closePnR() {
		try {
			if(rs != null && !rs.isClosed()) rs.close();
			if(pstmt != null && !pstmt.isClosed()) pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public int insertOne(Connection conn, BeefBean bb) {
		int res = 0;
		try {
			String sql = "insert into sales_beef "
						+"values(sales_beef_seq.nextval, ?, ?, ?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bb.getName());
			pstmt.setInt(2, bb.getPrice());
			pstmt.setString(3, bb.getUsed());
			res = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closePnR();
		}
		return res;
	}

	public ArrayList<BeefBean> selectList(Connection conn) {
		
		ArrayList<BeefBean> listc = null;
		String sql = "select * from sales_beef order by num";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BeefBean bb = new BeefBean();
				bb.setNum(rs.getInt("num"));
				bb.setName(rs.getString("name"));
				bb.setPrice(rs.getInt("price"));
				bb.setUsed(rs.getString("used"));
				if(listc == null) listc = new ArrayList<>();
				listc.add(bb);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closePnR();
		}
		return listc;
	}

	public BeefBean selectOne(Connection conn, Integer num) throws Exception {
		BeefBean bb = null;
		String sql = "select * from sales_beef where num=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			if(bb == null) bb = new BeefBean();
			bb.setNum(num);
			bb.setName(rs.getString("name"));
			bb.setPrice(rs.getInt("price"));
			bb.setUsed(rs.getString("used"));
		}
		return bb;
	}
	
	public int updateOne(Connection conn, BeefBean bb, Integer num) {
		int res = 0;
		try {
			String sql = "update sales_beef set name=?, price=?, used=? where num=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bb.getName());
			pstmt.setInt(2, bb.getPrice());
			pstmt.setString(3, bb.getUsed());
			pstmt.setInt(4, num);
			res = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closePnR();
		}
		return res;
	}

	public int deleteOne(Connection conn, Integer num) throws Exception {
		int res = 0;
		String sql = "delete from sales_beef where num=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		res = pstmt.executeUpdate();
		return res;
	}



}// (Repository) class END
