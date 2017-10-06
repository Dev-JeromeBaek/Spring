package p06_required;

import org.springframework.beans.factory.annotation.Required;

public class People {
	
	private String name;
	private int age;
	
//	@Required
//		=> 빈 생성 시 반드시 값이 입력되도록 강제하는 기능
//		=> setter메소드에 적용
	
	@Required
	public void setName(String name) {
		this.name = name;
	}
	@Required
	public void setAge(int age) {
		this.age = age;
	}
	public String getName() {
		return name;
	}
	public int getAge() {
		return age;
	}
	
	
	
}// class END
