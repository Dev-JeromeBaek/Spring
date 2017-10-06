package p06_interface;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class J01_mainCla {
	
	public static void main(String[] args) {
		
		ApplicationContext container = 
				new GenericXmlApplicationContext(
						"/p06_interface/contextBean.xml");
		
		MyInterface inj = (MyInterface) container.getBean("implBean");
		inj.works();
		
		((GenericXmlApplicationContext)container).close();
		
	}// main END
	
}// class END
