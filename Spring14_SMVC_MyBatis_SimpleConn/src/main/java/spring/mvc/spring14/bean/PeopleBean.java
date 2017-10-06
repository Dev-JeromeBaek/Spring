package spring.mvc.spring14.bean;

import org.apache.ibatis.type.Alias;

@Alias("apb")
public class PeopleBean {
	
	private Integer num;
	private String name;
	private Integer age;
	
	
	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	
}// (Bean) class END
