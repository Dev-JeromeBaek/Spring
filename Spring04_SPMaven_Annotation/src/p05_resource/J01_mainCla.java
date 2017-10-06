package p05_resource;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class J01_mainCla {
	
	public static void main(String[] args) {
		
		ApplicationContext container = 
				new GenericXmlApplicationContext(
						"/p05_resource/contextBean.xml");		
		
		People peo = (People) container.getBean("peo");
		peo.showSch();
		peo.showSch2();
		
		((GenericXmlApplicationContext)container).close();
		
	}// main END
	
}// class END
