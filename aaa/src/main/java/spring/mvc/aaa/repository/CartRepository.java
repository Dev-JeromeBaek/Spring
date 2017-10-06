package spring.mvc.aaa.repository;

import java.util.List;

import javax.xml.bind.ParseConversionEvent;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.aaa.bean.CartBean;
import spring.mvc.aaa.bean.Corp;
import spring.mvc.aaa.bean.Deal_Detail;
import spring.mvc.aaa.bean.Deal_Info;
import spring.mvc.aaa.bean.mapperBean;

@Repository
public class CartRepository{
	
	@Autowired
	private SqlSession sqlSessionTemplate;

	public int insertCart(CartBean cb) {
		return sqlSessionTemplate.insert("cartMapper.insertCart", cb);
	}

	public List<CartBean> cartList(Integer m_num) {
		return sqlSessionTemplate.selectList("cartMapper.cartList",m_num);
	}

	public int updateAmount(CartBean ctb) {
		return sqlSessionTemplate.update("cartMapper.updateAmount", ctb);
	}

	public List<Deal_Info> cartDIList(Integer m_num) {
		return sqlSessionTemplate.selectList("cartMapper.cartDIList", m_num);
	}

	public List<Deal_Detail> cartDDList(Integer m_num) {
		return sqlSessionTemplate.selectList("cartMapper.cartDDList", m_num);
	}

	public List<Corp> cartCorpList(Integer m_num) {
		return sqlSessionTemplate.selectList("cartMapper.cartCorpList", m_num);
	}

	public Corp cartCorpOne(Integer c_num) {
		return sqlSessionTemplate.selectOne("corpMapper.selectOne", c_num);
	}

	public int deleteOne(Integer di_num, Integer m_num) {
		mapperBean mm = new mapperBean();
		mm.setInte1(di_num);
		mm.setInte2(m_num);
		return sqlSessionTemplate.delete("cartMapper.deleteOne",mm );
	}

	public int deleteAmount(String dd_num, Integer m_num) {
		mapperBean mm = new mapperBean();
		mm.setInte1(m_num);
		mm.setInte2(Integer.parseInt(dd_num));
		return sqlSessionTemplate.delete("cartMapper.deleteAmount", mm);
	}

	public int updateAA(Integer m_num, Integer dd_num, Integer amou) {
		mapperBean mm = new mapperBean();
		mm.setInte1(m_num);
		mm.setInte2(dd_num);
		mm.setInte3(amou);
		return sqlSessionTemplate.update("cartMapper.updateAA", mm);
	}
	
	

}
