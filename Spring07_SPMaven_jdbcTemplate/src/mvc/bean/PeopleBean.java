package mvc.bean;

import javax.swing.JOptionPane;

public class PeopleBean {

	private int num;
	private String name;
	private int age;
	
	public void setData() {
		this.name = JOptionPane.showInputDialog("이름 입력");
		this.age = Integer.parseInt(JOptionPane.showInputDialog("나이 입력"));
	}
	
	public String getData() {
		return "번호 : " + num + ", 이름 : " + name + ", 나이 : " + age;
	}
	
//	[setter/getter]
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
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
