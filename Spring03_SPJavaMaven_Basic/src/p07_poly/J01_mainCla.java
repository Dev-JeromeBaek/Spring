package p07_poly;

import javax.swing.JOptionPane;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class J01_mainCla {
	
	public static void main(String[] args) {
		
		String showMenu = "1. 블로그 보기\n"
						+ "2. 다이어리 보기\n"
						+ "3. 프로그램 종료";
		
		ApplicationContext container = 
				new GenericXmlApplicationContext(
						"/p07_poly/contextBean.xml");
		
		Injection injector = null;
		
		while(true) {
			String sel = JOptionPane.showInputDialog(showMenu);
			String beanID = null;
			
			if(sel.equals("1")) {
				beanID = "blogBean";
				
			} else if(sel.equals("2")) {
				beanID = "diaryBean";
				
			} else if(sel.equals("3")) {
				break;
			} else {
				System.out.println("잘못된 입력입니다.");
				continue;
			}
			injector = (Injection) container.getBean(beanID);
			injector.show();
		}
		((GenericXmlApplicationContext)container).close();
		
	}// main END

}// class END
