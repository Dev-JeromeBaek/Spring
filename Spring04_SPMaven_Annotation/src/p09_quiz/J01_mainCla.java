package p09_quiz;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class J01_mainCla {
	public static void main(String[] args) {
		
		ApplicationContext container = 
			new GenericXmlApplicationContext(
					"/p09_quiz/contextBean.xml");
		
		HamController cont = (HamController)container.getBean("cont");
		cont.works();
		
		((GenericXmlApplicationContext)container).close();
	}
}







