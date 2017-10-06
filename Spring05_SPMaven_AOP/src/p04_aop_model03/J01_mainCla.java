package p04_aop_model03;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class J01_mainCla {
	
	public static void main(String[] args) {
		
		ApplicationContext container = 
				new GenericXmlApplicationContext(
						"/p04_aop_model03/contextBean.xml");
		
		J02_Math injector = (J02_Math) container.getBean("div");
		injector.coreWorks();
		
		((GenericXmlApplicationContext)container).close();
		
	}// main END
	
}// class END
