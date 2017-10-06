package poly;

public class Ex01_Diary implements Ex01_Injection {

	@Override
	public String show() {
		System.out.println("다이어리를 보여줍니다.");
		return "다이어리 보여주기";
	}

}
