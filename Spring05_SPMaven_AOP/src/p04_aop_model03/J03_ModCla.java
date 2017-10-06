package p04_aop_model03;

import javax.swing.JOptionPane;

public class J03_ModCla implements J02_Math {

	@Override
	public Object coreWorks() {
		
		String rcv = null;
		rcv = JOptionPane.showInputDialog("첫번째 정수 입력");
		int n1 = Integer.parseInt(rcv);
		
		rcv = JOptionPane.showInputDialog("두번째 정수 입력");
		int n2 = Integer.parseInt(rcv);
		
		System.out.println("mod 결과 => " + n1 + " % " + n2 + " = " + (n1%n2));
		
		return "mod 작업 완료";
	}

}
