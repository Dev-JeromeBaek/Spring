package mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import mvc.bean.PeopleBean;

public class PeopleDAO {
	
	private PreparedStatement ppst;
	private ResultSet rs;
	
	public int insertOne(Connection conn, PeopleBean peoBean) throws Exception {
		String sql = "insert into t_peo values(t_peo_seq.nextval, ?, ?)";
		
		ppst = conn.prepareStatement(sql);
		ppst.setString(1, peoBean.getName());
		ppst.setInt(2, peoBean.getAge());
		
		int res = ppst.executeUpdate();
		
		ppst.close();
		
		return res;
	}

	public ArrayList<PeopleBean> selectList(Connection conn) throws Exception {
		
		String sql = "select * from t_peo order by num desc";
		ppst = conn.prepareStatement(sql);
		rs = ppst.executeQuery();
		
		ArrayList<PeopleBean> listc = null;
		while(rs.next()) {
			PeopleBean peoBean = new PeopleBean();
			peoBean.setNum(rs.getInt("num"));
			peoBean.setName(rs.getString("name"));
			peoBean.setAge(rs.getInt("age"));
			
			if(listc == null) listc = new ArrayList<>();
			listc.add(peoBean);
		}
		rs.close();
		ppst.close();
		return listc;
	}
	
}// (DAO) class END
