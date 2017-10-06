package p05_resource;

import javax.annotation.Resource;

public class People {
	
//	1. @Resource
//		=> 멤버변수의 이름과 동일한 id인 빈을 주입.
//		=> @Autowired와 다른점은 @Resource는 id를 바로 찾는다.
//		=> "ByName"과 같다
	
	@Resource
	private SchoolInfo schInfo;
	public void showSch() {
		System.out.println("학교 : " + schInfo.getSchName());
	}
	
//	2. @Resource(name="sch")
//		=> 원하는 id의 빈 직접 지정 가능.
	
	@Resource(name="sch")
	private SchoolInfo ajksdnjk;
	public void showSch2() {
		System.out.println("학교 : " + ajksdnjk.getSchName());
	}
	
}// class END
