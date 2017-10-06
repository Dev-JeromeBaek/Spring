package p01_aop_intro;

import javax.swing.JOptionPane;

public class DivCla {
	
	public Object works() {
		
		System.out.println("프로그램 시작. 관련 메모리를 확보했습니다.");
		
		try {
			String rcv = null;
			
			rcv = JOptionPane.showInputDialog("첫번째 정수 입력");
			int n1 = Integer.parseInt(rcv);
			
			rcv = JOptionPane.showInputDialog("두번째 정수 입력");
			int n2 = Integer.parseInt(rcv);
			
			System.out.println("div 결과 => " + n1 + " / " + n2 + " = " + (n1/n2));
			
		} catch (Exception e) {
			System.out.println("진행 중 예외 발생 => 관련 정보 : " + e.getMessage());
		} finally {
			System.out.println("확보한 메모리 정상 반납 완료");
		}
		System.out.println("프로그램 정상 종료");
		return "div 작업 정상 종료";
	}
	
}// class END
