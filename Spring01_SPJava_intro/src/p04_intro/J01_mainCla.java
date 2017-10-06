package p04_intro;

import javax.swing.JOptionPane;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class J01_mainCla {
	
	public static void main(String[] args) {
	
		String showMenu = "1. 정보 입력하기\n"
						+ "2. 정보 보기\n"
						+ "3. 프로그램 종료";
		
		while(true) {
			String sel = JOptionPane.showInputDialog(showMenu);
			Object msg = null;
			ApplicationContext container = 
					new GenericXmlApplicationContext("/p04_intro/bean.xml");
			// "/p04_intro/bean.xml" : 스프링에서 생성하는 객체(자바에서의 객체와 같음)
			
			J03_Injection connBean = (J03_Injection)container.getBean("DBConn");
//					컨테이너로부터 빈을 가져와라 그 id가 DBConn이다
			
			J02_DAO dao = new J02_DAO(connBean);
			
			if(sel.equals("1")) {
				msg = dao.insertOne();
			} else if(sel.equals("2")) {
				msg = dao.selectList();
			} else if(sel.equals("3")) {
				break;
			} else {
				msg = "잘못된 입력입니다.";
			}
			JOptionPane.showMessageDialog(null, msg);
			
			((GenericXmlApplicationContext)container).close();
		}
		
	}// main END
	
}// class END
