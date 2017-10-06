package p08_quiz;

import javax.swing.JOptionPane;

import org.springframework.stereotype.Component;

public class HamburgerDTO {
	
	private String name;
	private int price;
	private double kcal;
	
	public String setData() {
		name = JOptionPane.showInputDialog("이름 입력");
		price = Integer.parseInt(JOptionPane.showInputDialog("가격 입력"));
		kcal = Double.parseDouble(JOptionPane.showInputDialog("칼로리 입력"));
		
		return "저장이 완료되었습니다.";
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public double getKcal() {
		return kcal;
	}
	public void setKcal(double kcal) {
		this.kcal = kcal;
	}
	
	
	
	
}// class END
