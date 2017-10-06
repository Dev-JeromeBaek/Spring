package spring.mvc.aaa.repository;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import spring.mvc.aaa.bean.BuyDetailBean;
import spring.mvc.aaa.bean.CorpSellingBean;
import spring.mvc.aaa.bean.DealQnaBean;
import spring.mvc.aaa.bean.Deal_Detail;
import spring.mvc.aaa.bean.Deal_Info;
import spring.mvc.aaa.bean.MemberBean;
import spring.mvc.aaa.bean.ReviewBean;
import spring.mvc.aaa.bean.mapperBean;

@Repository
public class DealRepository extends DefaultTransactionDefinition{

	@Autowired
	private SqlSession sqlSessionTemplate;
	
	@Autowired
	private PlatformTransactionManager tx;
	private TransactionStatus status;

	public List<Deal_Info> selectDealList(String item2) {
		System.out.println(item2);
		return sqlSessionTemplate.selectList("dealMapper.selectDealList",item2);
	}

	public Deal_Info selectDIOne(Integer di_num) {
		return sqlSessionTemplate.selectOne("dealMapper.selectDIOne", di_num);
	}

	public List<Deal_Detail> selectDDList(Integer di_num) {
		return sqlSessionTemplate.selectList("dealMapper.selectDDList", di_num);
	}

	public List<Deal_Info> searchList(String key) {
		return sqlSessionTemplate.selectList("dealMapper.searchList","%"+key+"%");
	}
	
	public Deal_Detail selectDDOne(Integer dd_num) {
		return sqlSessionTemplate.selectOne("dealMapper.selectDDOne", dd_num);
	}

	public int updateDealExplain(mapperBean mapBean) {
		return sqlSessionTemplate.update("dealMapper.updateDealExplain", mapBean);
	}

	public List<Deal_Info> showDealListAll(Integer c_num) {
		return sqlSessionTemplate.selectList("dealMapper.showDealListAll", c_num);
	}

	public List<Deal_Info> showStatusDealList(mapperBean mb) {
		
		return sqlSessionTemplate.selectList("dealMapper.showStatusDealList", mb);
	}

	public List<BuyDetailBean> selectBuyDetailList(Integer b_num) {

		return sqlSessionTemplate.selectList("dealMapper.selectBuyDetailList", b_num);
	}

	public List<ReviewBean> selectDealReview(Integer di_num) {
		return sqlSessionTemplate.selectList("dealMapper.selectDealReview",di_num);
	}

	public List<MemberBean> selectDealReviewMem(Integer di_num) {
		return sqlSessionTemplate.selectList("dealMapper.selectDealReviewMem", di_num);
	}

	public int insertDealQna(DealQnaBean dq) {
		return sqlSessionTemplate.insert("dealMapper.insertDealQna",dq);
	}

	public List<DealQnaBean> selectDQList(Integer di_num) {
		return sqlSessionTemplate.selectList("dealMapper.selectDQList", di_num);
	}

	public List<MemberBean> selectDQMemList(Integer di_num) {
		return sqlSessionTemplate.selectList("dealMapper.selectDQMemList", di_num);
	}

	public DealQnaBean selectDQOne(Integer dqnum) {
		return sqlSessionTemplate.selectOne("dealMapper.selectDQOne",dqnum);
	}

	public List<DealQnaBean> selectCorpDQList( Integer num) {
//		mapperBean mp = new mapperBean();
//		mp.setInte1(corpNum);
//		mp.setInte2(num);
		return sqlSessionTemplate.selectList("dealMapper.selectCorpDQList", num);
	}

	public int insertDQAns(Integer dqnum, String answer) {
		mapperBean mp = new mapperBean();
		mp.setInte1(dqnum);
		mp.setStr1(answer);
		return sqlSessionTemplate.update("dealMapper.insertDQAns", mp);
	}
	
	
	
	
	
	
	public int deleteDealDetailAll(Integer di_num) {
		System.out.println("repo : " + di_num);
		return sqlSessionTemplate.delete("dealMapper.deleteDealDetailAll", di_num);
	}

	public int deleteDealInfoAll(Integer c_num) {
		return sqlSessionTemplate.delete("dealMapper.deleteDealInfoAll", c_num);
	}

	public int deleteDealInfo(Integer di_num) {
		return sqlSessionTemplate.delete("dealMapper.deleteDealInfo", di_num);
	}

	public int updateAmount(int dd_num, int dd_amount) {
		mapperBean mp = new mapperBean();
		mp.setInte1(dd_num);
		mp.setInte2(dd_amount);
		System.out.println("repo start");
		return sqlSessionTemplate.update("dealMapper.updateAmount",mp);
	}

	public List<Deal_Info> othersDealListAll() {
		return sqlSessionTemplate.selectList("dealMapper.othersDealListAll");
	}

	public List<mapperBean> countDRList(Integer corpNum) {
		return sqlSessionTemplate.selectList("dealMapper.countDRList", corpNum);
	}

	public List<mapperBean> countDQList(Integer corpNum) {
		return sqlSessionTemplate.selectList("dealMapper.countDQList", corpNum);
	}

	public int delReview(Integer dr_num) {
		return sqlSessionTemplate.delete("dealMapper.delReview", dr_num);
	}

	
	
}
