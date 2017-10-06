package poly;

public class Ex01_Blog implements Ex01_Injection {

	@Override
	public String show() {
		System.out.println("블로그를 보여줍니다.");
		return "블로그 보여주기";
	}

}
