package p05_aop_model02_Annotation;

import javax.swing.JOptionPane;

import org.springframework.stereotype.Component;

@Component("div")
public class J03_DivCla implements J02_Math {

	@Override
	public Object coreWorks() {
		
		String rcv = null;
		rcv = JOptionPane.showInputDialog("첫번째 정수 입력");
		int n1 = Integer.parseInt(rcv);
		
		rcv = JOptionPane.showInputDialog("두번째 정수 입력");
		int n2 = Integer.parseInt(rcv);
		
		System.out.println("div 결과 => " + n1 + " / " + n2 + " = " + (n1/n2));
		
		return "div작업 완료";
	}
	
	
	
}// class END
