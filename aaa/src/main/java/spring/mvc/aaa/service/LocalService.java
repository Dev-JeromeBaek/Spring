package spring.mvc.aaa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import spring.mvc.aaa.bean.Deal_Detail;
import spring.mvc.aaa.bean.Deal_Info;
import spring.mvc.aaa.bean.LocalBean;
import spring.mvc.aaa.repository.LocalReporitory;

@Service
public class LocalService {

	@Autowired
	private LocalReporitory reporitory;

	public List<Deal_Info> Gangnam() {
		List<Deal_Info> info= reporitory.Gangnam();
		return info;
	}

	public List<Deal_Info> HongikUniv_Hapjeong_Sangsu() {
		List<Deal_Info> info= reporitory.HongikUniv_Hapjeong_Sangsu();
		return info;
	}

	public List<Deal_Info> Myeongdong_Cityhall_Junggu() {
		List<Deal_Info> info= reporitory.Myeongdong_Cityhall_Junggu();
		return info;
	
	}

	public List<Deal_Info> Jamsill_Sincheon() {
		List<Deal_Info> info= reporitory.Jamsill_Sincheon();
		return info;
	}

	public List<Deal_Info> Seocho_Bangbae_Yangjae() {
		List<Deal_Info> info= reporitory.Seocho_Bangbae_Yangjae();
		return info;
	}

	public List<Deal_Info> Daehangno_Suyu() {
		List<Deal_Info> info= reporitory.Daehangno_Suyu();
		return info;
	}

	public List<Deal_Info> Apgujeong_Garosugil() {
		List<Deal_Info> info= reporitory.Apgujeong_Garosugil();
		return info;
	}

	public List<Deal_Info> Sinchon_EwhaUniv_Gongdeok() {
		List<Deal_Info> info= reporitory.Sinchon_EwhaUniv_Gongdeok();
		return info;
	}

	public List<Deal_Info> Jongno_Gwanghwamun() {
		List<Deal_Info> info= reporitory.Jongno_Gwanghwamun();
		return info;
	}

	public List<Deal_Info> songpa_Bangi_Garak() {
		List<Deal_Info> info= reporitory.songpa_Bangi_Garak();
		return info;
	}

	public List<Deal_Info> Gangseo_Yangcheon() {
		List<Deal_Info> info= reporitory.Gangseo_Yangcheon();
		return info;
	}

	public List<Deal_Info> Nowon_Dobong() {
		List<Deal_Info> info= reporitory.Nowon_Dobong();
		return info;
	}

	public List<Deal_Info> Cheongdam_Hakdong_Nonhyeon() {
		List<Deal_Info> info= reporitory.Cheongdam_Hakdong_Nonhyeon();
		return info;
	}

	public List<Deal_Info> Sangam_Eunpyeong() {
		List<Deal_Info> info= reporitory.Sangam_Eunpyeong();
		return info;
	}
	public List<Deal_Info> Itaewon_Hannam() {
		List<Deal_Info> info= reporitory.Itaewon_Hannam();
		return info;
	}
	public List<Deal_Info> Gangdong_Cheonho_Gildong() {
		List<Deal_Info> info= reporitory.Gangdong_Cheonho_Gildong();
		return info;
	}
	public List<Deal_Info> Gwanak_Dongjak_Sadang() {
		List<Deal_Info> info= reporitory.Gwanak_Dongjak_Sadang();
		return info;
	}
	public List<Deal_Info> Seongdong_Dongdaemun() {
		List<Deal_Info> info= reporitory.Seongdong_Dongdaemun();
		return info;
	}
	public List<Deal_Info> Samseong_Yeoksam_Daechi() {
		List<Deal_Info> info= reporitory.Samseong_Yeoksam_Daechi();
		return info;
	}
	public List<Deal_Info> Guro_Yeongdeungpo() {
		List<Deal_Info> info= reporitory.Guro_Yeongdeungpo();
		return info;
	}
	public List<Deal_Info> Konkuk_Guui_Jungnang() {
		List<Deal_Info> info= reporitory.Konkuk_Guui_Jungnang();
		return info;
	}

	public List<Deal_Detail> AllLocal(int num) {
		List<Deal_Detail> detail = reporitory.AllLocal(num); 
		return detail;
	}

	public Deal_Info AllLocal2(int num) {
		Deal_Info info = reporitory.AllLocal2(num);
		return info;
	}
	
	
	
	
	
}
