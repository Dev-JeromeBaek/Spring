package p08_quiz;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class J01_mainCla {

	public static void main(String[] args) {
		
		ApplicationContext container = 
				new GenericXmlApplicationContext(
						"/p08_quiz/contextBean.xml");
				
		HamController hc = (HamController) container.getBean("hamController");
		hc.works();
		
		((GenericXmlApplicationContext)container).close();
		
	}// main END
	
}// class END
