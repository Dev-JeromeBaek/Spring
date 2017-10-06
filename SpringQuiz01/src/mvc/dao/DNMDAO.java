package mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import mvc.bean.DNMBean;

@Component("dao")
public class DNMDAO {

//	@Autowired
//	private DataSource dataSource;
	private PreparedStatement ppst;
	private ResultSet rs;
	
	
	public int insertOne(Connection conn, DNMBean dnmBean) throws Exception{
		int res = 0;
		
		String sql = "insert into quiz_dnm values(quiz_dnm_seq.nextval, ?, ?, ?)";
//		ppst = dataSource.getConnection().prepareStatement(sql);
		ppst = conn.prepareStatement(sql);
		ppst.setString(1, dnmBean.getTitle());
		ppst.setString(2, dnmBean.getActor());
		ppst.setInt(3, dnmBean.getRuntime());
		
		res = ppst.executeUpdate();
		
		return res;
	}

}
