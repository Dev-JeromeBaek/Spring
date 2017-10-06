package p10_useBeanEx;

import javax.swing.JOptionPane;

public class PeopleDTO {
	
	private String name;
	private int age;
	
	public void setData() {
		name = JOptionPane.showInputDialog("이름 입력");
		age = Integer.parseInt(JOptionPane.showInputDialog("나이 입력"));
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
