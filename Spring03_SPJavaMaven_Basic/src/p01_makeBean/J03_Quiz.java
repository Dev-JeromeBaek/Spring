package p01_makeBean;

import javax.swing.JOptionPane;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class J03_Quiz {
	
	public static void main(String[] args) {
		
//		학생 정보 관리 프로그램
//		메뉴 : 1. 정보 입력 / 2. 정보 보기 / 3. 프로그램 종료
//		- 빈으로 학생 객체를 이용하는 프로그램
		
		ApplicationContext container = 
				new GenericXmlApplicationContext(
						"/p01_makeBean/contextBean.xml");
		
		J03_Student stu = (J03_Student) container.getBean("stuBean");;
		
		String showMenu = "1. 정보 입력\n"
						+ "2. 정보 보기\n"
						+ "3. 프로그램 종료";
		
		String msg = null;
		
		while(true) {
			String sel = JOptionPane.showInputDialog(showMenu);
			if(sel.equals("1")) {
				
				stu.setName(JOptionPane.showInputDialog("이름 입력"));
				stu.setKor(Integer.parseInt(JOptionPane.showInputDialog("국어점수 입력")));
				stu.setEng(Integer.parseInt(JOptionPane.showInputDialog("영어점수 입력")));
				stu.setMath(Integer.parseInt(JOptionPane.showInputDialog("수학점수 입력")));
				stu.cal_Total(stu.getKor(), stu.getEng(), stu.getMath());
				stu.cal_Avg(stu.getTotal());
				
				msg = "저장이 완료되었습니다.";
				
			} else if(sel.equals("2")) {
				
				msg = "이름 : " + stu.getName() + "\n"
						+ "국어점수 : " + stu.getKor() + "\n"
						+ "영어점수 : " + stu.getEng() + "\n"
						+ "수학점수 : " + stu.getMath() + "\n"
						+ "총점 : " + stu.getTotal() + "\n"
						+ "평균 : " + stu.getAvg() + "\n";
				
			} else if(sel.equals("3")) {
				break;
			} else {
				msg = "잘못된 입력입니다.";
			}
			JOptionPane.showMessageDialog(null, msg);
 		}
		
		((GenericXmlApplicationContext)container).close();
		
	}// main END
	
}// class END
