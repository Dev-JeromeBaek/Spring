package p09_quiz;

import javax.swing.JOptionPane;

public class HamburgerDTO {

	private String name;
	private int price;
	
	public HamburgerDTO() {
		// TODO Auto-generated constructor stub
		System.out.println("dto 생성자 작동");
	}
	
	public void setData() {
		this.name = JOptionPane.showInputDialog("이름 입력");
		this.price = Integer.parseInt(JOptionPane.showInputDialog("가격 입력"));
	}
	
	public String getData() {
		return "이름 : " + name + ", 가격 : " + price;
	}
	
}





