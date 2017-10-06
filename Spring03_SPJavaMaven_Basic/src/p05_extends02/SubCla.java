package p05_extends02;

public class SubCla extends SuperCla {
	
	private String hobby;

	public SubCla(String name, int age, String hobby) {
		super(name, age);
		System.out.println("서브클래스 생성자");
		this.hobby = hobby;
	}

	public String getHobby() {
		return hobby;
	}

	public void setHobby(String hobby) {
		this.hobby = hobby;
	}
	
	

}// class END
