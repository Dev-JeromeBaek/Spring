package mvc.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import mvc.bean.PeopleBean;

@Component
public class PeopleDAO {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public int insertOne(PeopleBean peoBean) {
		
		return jdbcTemplate.update(
							"insert into t_peo values(t_peo_seq.nextval, ?, ?)",
								new Object[]{peoBean.getName(), peoBean.getAge()}
							);
	}

	public List<PeopleBean> selectList() { 
		
		return jdbcTemplate.query(
				"select * from t_peo order by num desc", 
				new RowMapper<PeopleBean>() {

					@Override	// mapRow = while문의 작업....;
					public PeopleBean mapRow(ResultSet rs, int rowNum) throws SQLException {
						PeopleBean peoBean = new PeopleBean();
						peoBean.setNum(rs.getInt("num"));
						peoBean.setName(rs.getString("name"));
						peoBean.setAge(rs.getInt("age"));
						return peoBean;
					}
				});
	}
	
//	선택보기(selectOne) 시
//		jdbcTemplate의 
//		queryForObject(SQL, Object[], RowMapper객체) 메소드 사용
	
//		queryFor.. 종류많음..
	
}// (DAO) class END
