package p03_componentScan;

import org.springframework.stereotype.Component;

//	1. @Component 사용 시 
//		id는 클래스이름 첫글자를 소문자로 변현한 이름이
//		id가 됨 (예 : 클래스이름 People => id : people)
//	2. id를 직접 등록하고 싶은 경우,
//		@Component("원하는 아이디") 형식을 이용
@Component
//@Scope="prototype"
public class People {
	
	private String name = "둘리";
	private int age = 10;
	
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
