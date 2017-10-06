package p05_extends01;

public class SubCla extends SuperCla {
	
	private String hobby;

	public SubCla() {
		System.out.println("서브클래스 생성자");
	}

	public String getHobby() {
		return hobby;
	}

	public void setHobby(String hobby) {
		this.hobby = hobby;
	}
	
	

}// class END
