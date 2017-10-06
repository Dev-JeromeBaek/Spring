package poly;

import javax.swing.JOptionPane;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.core.env.JOptCommandLinePropertySource;

public class Ex01_mainCla {

	public static void main(String[] args) {
		
		ApplicationContext container = 
				new GenericXmlApplicationContext(
						"/poly/Ex01_contextBean.xml");
		
		Ex01_Injection injec = null;
		
		String showMenu = "1. 블로그 보기 \n"
						+ "2. 다이어리 보기 \n"
						+ "3. 프로그램 종료";
		
		
		while(true) {
			String sel = JOptionPane.showInputDialog(showMenu);
			String msg = null;
			String beanID = null;
			if(sel.equals("1")) {
				beanID = "blogBean";
				injec = (Ex01_Injection) container.getBean(beanID);
				msg = injec.show();
			} else if(sel.equals("2")) {
				beanID = "diaryBean";
				injec = (Ex01_Injection) container.getBean(beanID);
				msg = injec.show();
			} else if(sel.equals("3")) {
				msg = "프로그램 종료";
				break;
			} else {
				msg = "잘못된 입력입니다.";
			}
			JOptionPane.showMessageDialog(null, msg);
		}
		
	}// main END
	
}//class END
