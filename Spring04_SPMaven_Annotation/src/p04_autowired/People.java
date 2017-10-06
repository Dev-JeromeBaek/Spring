package p04_autowired;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

public class People {
	
//	1. @Autowired
//		=> byType으로 검색한 후, 
//			같은 타입의 빈이 여러개이면 byName을 진행
//		=> autowired를 진행하는 멤버의 setter가 없어도 가능
//			예 : 현재 corp의 setter가 없어도 가능
		
	@Autowired
	private CorpInfo corp;
	public void showCorp() {
		System.out.println("회사이름 : " + corp.getCorpName());
	}
	
	
//	2. @Autowired && @Qualifier("원하는id")
//		=> 내가 원하는 id의 빈을 주입
	
	@Autowired
	@Qualifier("homeBean2")
	private HomeInfo home;
	public void showHome() {
		System.out.println("집 주소 : " + home.getAddress());
	}
	
//	3. @Autowired(required=false)
//		=> autowired는 반드시
//			존재하는 빈에 댓해서만 정상적으로 작동됨
//		=> 만양, 빈이 나중에 생성된다면 위와 같이
//			required-false가 필요함
//		required-false : 없을 수도 있다, 
//						나중에 다른방법으로 채워넣겠다.
	
	@Autowired(required=false)
	private SchoolInfo schBean;

//	@@@@@@@@@@@@@@@@@@@@@@@@
//	4. 참고
	public void showHashCode() {
		System.out.println("corp : " + corp);
		System.out.println("home : " + home);
		System.out.println("schBean : " + schBean);
	}
	
}// class END
