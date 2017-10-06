package spring.mvc.spring11.bean;

public class People {
	
	private String name;
	private Integer age;
	
	
	public People() {
		
	}
	
	
	public People(String name, int age) {
		super();
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
	
	
	
}// (Bean) class END
