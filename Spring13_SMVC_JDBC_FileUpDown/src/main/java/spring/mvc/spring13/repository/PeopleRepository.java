package spring.mvc.spring13.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import spring.mvc.spring13.bean.PeopleBean;

@Repository
public class PeopleRepository {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public int insertOne(PeopleBean peoBean) {
		return jdbcTemplate.update(
				"insert into t_peo02 "
					+"values(t_peo02_seq.nextval, ?, ?, ?, ?)",
						new Object[]{peoBean.getName(), 
									peoBean.getAge(), 
									peoBean.getOrgName(), 
									peoBean.getSysName()});
	}

	public List<PeopleBean> selectList() {
		return jdbcTemplate.query(
				"select * from t_peo02 order by num desc", 
					new RowMapper<PeopleBean>(){

						@Override
						public PeopleBean mapRow(
									ResultSet rs, int rowNum) 
											throws SQLException {
							PeopleBean poeBean = new PeopleBean();
							poeBean.setNum(rs.getInt("num"));
							poeBean.setName(rs.getString("name"));
							poeBean.setAge(rs.getInt("age"));
							poeBean.setOrgName(rs.getString("orgName"));
							poeBean.setSysName(rs.getString("sysName"));
							
							return poeBean;
						}
					
		});
	}
	
}// (Repository) class END
