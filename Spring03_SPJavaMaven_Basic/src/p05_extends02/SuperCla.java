package p05_extends02;

public class SuperCla {

	private String name;
	private int age;
	
	public SuperCla(String name, int age) {
		System.out.println("수퍼클래스 생성자");
		this.name = name;
		this.age = age;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}
	
	
	
}// class END
