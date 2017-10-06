package spring.mvc.aaa.repository;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.processing.SupportedSourceVersion;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.aaa.bean.Corp;
import spring.mvc.aaa.bean.CorpBean;
import spring.mvc.aaa.bean.CorpSellingBean;
import spring.mvc.aaa.bean.Deal_Detail;
import spring.mvc.aaa.bean.Deal_Info;
import spring.mvc.aaa.bean.mapperBean;

@Repository
public class CorpRepository {
	
	@Autowired
	private SqlSession sqlSessionTemplate;

	public int dealInsert(Deal_Info info,Deal_Detail detail) {
		int res =sqlSessionTemplate.insert("dealMapper.dealInfo",info);
		res += sqlSessionTemplate.insert("dealMapper.dealDetail", detail);
		return res;
	
	}
	
	public List<Deal_Info> selectInfo() {
		List<Deal_Info> listc = sqlSessionTemplate.selectList("dealMapper.selectInfo");
		return listc;
	}


	public List<Deal_Detail> selectDetail() {
		List<Deal_Detail> detail = sqlSessionTemplate.selectList("dealMapper.selectDetail");
		return detail;
	}

	public int dealInsert(ArrayList<Deal_Detail> listc) {
		int res = 0;
		for(Deal_Detail each : listc){
//			System.out.println("dd등록 시작");
//			System.out.println("name : " + each.getDd_name() + ", kind : " + each.getDd_kind() + ",price:"+each.getDd_price()
//						+",amount : " + each.getDd_amount()+",di_num : "+each.getDd_di_num());
			res += sqlSessionTemplate.insert("dealMapper.insertDDList", each);
//			System.out.println("dd등록 완료");
		}
		
		return res;
	}


	public int dealInfo(Deal_Info info) {
		int res =sqlSessionTemplate.insert("dealMapper.dealInfo2",info);
		return res;
	}
	
	
	
//	===================================================================================
	public int corpJoin(Corp corp) {
		return sqlSessionTemplate.insert("corpMapper.corpJoin",corp);
	}

	public Corp corpLog(Corp corp) {
		
		Corp corpLog = sqlSessionTemplate.selectOne("corpMapper.corpLogin",corp);
		
		return corpLog;
	}

	public Corp corpBnCheck(Corp corp) {
		
		Corp corpBnCheck = sqlSessionTemplate.selectOne("corpMapper.corpBnCheck",corp);
		
		return corpBnCheck;
	}

	public List<Deal_Info> approveNullInfo() {
		return sqlSessionTemplate.selectList("dealMapper.approveNullInfo");
	}

	public List<CorpBean> upDealCorp(Integer di_c_num) {
		return sqlSessionTemplate.selectList("corpMapper.upDealCorp", di_c_num);
	}

	public List<Deal_Info> dealApproveList(String YES) {
		return sqlSessionTemplate.selectList("dealMapper.dealApproveList", YES);
	}
	
	public List<Deal_Info> dealCancelList(String NO) {
		return sqlSessionTemplate.selectList("dealMapper.dealCancelList", NO);
	}

	public List<CorpBean> showCorpList() {
		return sqlSessionTemplate.selectList("corpMapper.showCorpList");
	}

	public List<Deal_Info> showDealInfoList() {
		return sqlSessionTemplate.selectList("dealMapper.selectInfo");
	}

	public int upStatusDeal(mapperBean mb) {
		return sqlSessionTemplate.update("dealMapper.upStatusDeal", mb);
	}

	public CorpBean getCorpInfoOne(Integer c_num) {
		return sqlSessionTemplate.selectOne("corpMapper.getCorpInfoOne", c_num);
	}

	public int deleteCorp(Integer c_num) {
		return sqlSessionTemplate.delete("corpMapper.deleteCorp", c_num);
	}

	public int modifyCorp(mapperBean modiCorp) {
		return sqlSessionTemplate.update("corpMapper.modifyCorp", modiCorp);
	}

	public Corp selectCorpOne(Integer c_num) {
		return sqlSessionTemplate.selectOne("corpMapper.selectCorpOne", c_num);
	}

	public int modifyCorpGrade(Corp corpLog) {
		return sqlSessionTemplate.update("corpMapper.modifyCorpGrade", corpLog);
	}

	
	
	
}// (Repository) class END
