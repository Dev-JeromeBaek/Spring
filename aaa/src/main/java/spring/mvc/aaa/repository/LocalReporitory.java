package spring.mvc.aaa.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.aaa.bean.Deal_Detail;
import spring.mvc.aaa.bean.Deal_Info;
import spring.mvc.aaa.bean.Deal_Info;

@Repository
public class LocalReporitory {

	@Autowired
	private SqlSession sqlSession;

	public List<Deal_Info> Gangnam() {
		List<Deal_Info> info= sqlSession.selectList("localMapper.Gangnam");
		return info;
	}

	public List<Deal_Info> HongikUniv_Hapjeong_Sangsu() {
		List<Deal_Info> info= sqlSession.selectList("localMapper.HongikUniv_Hapjeong_Sangsu");
		return info;
	}

	public List<Deal_Info> Myeongdong_Cityhall_Junggu() {
		List<Deal_Info> info= sqlSession.selectList("localMapper.Myeongdong_Cityhall_Junggu");
		return info;
	}

	public List<Deal_Info> Jamsill_Sincheon() {
		List<Deal_Info> info= sqlSession.selectList("localMapper.Jamsill_Sincheon");
		return info;
	}

	public List<Deal_Info> Seocho_Bangbae_Yangjae() {
		List<Deal_Info> info= sqlSession.selectList("localMapper.Seocho_Bangbae_Yangjae");
		return info;
	}

	public List<Deal_Info> Daehangno_Suyu() {
		List<Deal_Info> info= sqlSession.selectList("localMapper.Daehangno_Suyu");
		return info;
	}

	public List<Deal_Info> Apgujeong_Garosugil() {
		List<Deal_Info> info= sqlSession.selectList("localMapper.Apgujeong_Garosugil");
		return info;
	}

	public List<Deal_Info> Sinchon_EwhaUniv_Gongdeok() {
		List<Deal_Info> info= sqlSession.selectList("localMapper.Sinchon_EwhaUniv_Gongdeok");
		return info;
	}

	public List<Deal_Info> Jongno_Gwanghwamun() {
		List<Deal_Info> info= sqlSession.selectList("localMapper.Jongno_Gwanghwamun");
		return info;
	}

	public List<Deal_Info> songpa_Bangi_Garak() {
		List<Deal_Info> info= sqlSession.selectList("localMapper.songpa_Bangi_Garak");
		return info;
	}

	public List<Deal_Info> Gangseo_Yangcheon() {
		List<Deal_Info> info= sqlSession.selectList("localMapper.Gangseo_Yangcheon");
		return info;
	}

	public List<Deal_Info> Nowon_Dobong() {
		List<Deal_Info> info= sqlSession.selectList("localMapper.Nowon_Dobong");
		return info;
	}

	public List<Deal_Info> Cheongdam_Hakdong_Nonhyeon() {
		List<Deal_Info> info= sqlSession.selectList("localMapper.Cheongdam_Hakdong_Nonhyeon");
		return info;
	}

	public List<Deal_Info> Sangam_Eunpyeong() {
		List<Deal_Info> info= sqlSession.selectList("localMapper.Sangam_Eunpyeong");
		return info;
	}
	public List<Deal_Info> Itaewon_Hannam() {
		List<Deal_Info> info= sqlSession.selectList("localMapper.Itaewon_Hannam");
		return info;
	}
	public List<Deal_Info> Gangdong_Cheonho_Gildong() {
		List<Deal_Info> info= sqlSession.selectList("localMapper.Gangdong_Cheonho_Gildong");
		return info;
	}
	public List<Deal_Info> Gwanak_Dongjak_Sadang() {
		List<Deal_Info> info= sqlSession.selectList("localMapper.Gwanak_Dongjak_Sadang");
		return info;
	}
	public List<Deal_Info> Seongdong_Dongdaemun() {
		List<Deal_Info> info= sqlSession.selectList("localMapper.Seongdong_Dongdaemun");
		return info;
	}
	public List<Deal_Info> Samseong_Yeoksam_Daechi() {
		List<Deal_Info> info= sqlSession.selectList("localMapper.Samseong_Yeoksam_Daechi");
		return info;
	}
	public List<Deal_Info> Guro_Yeongdeungpo() {
		List<Deal_Info> info= sqlSession.selectList("localMapper.Guro_Yeongdeungpo");
		return info;
	}
	public List<Deal_Info> Konkuk_Guui_Jungnang() {
		List<Deal_Info> info= sqlSession.selectList("localMapper.Konkuk_Guui_Jungnang");
		return info;
	}

	public List<Deal_Detail> AllLocal(int num) {
		List<Deal_Detail> detail = sqlSession.selectList("dealMapper.AllLocal",num);
		return detail;
	}

	public Deal_Info AllLocal2(int num) {
		Deal_Info info = sqlSession.selectOne("dealMapper.AllLocal2",num);
		return info;
	}
	
	
}
