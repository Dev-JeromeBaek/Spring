package p05_aop_model02_Annotation;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class J01_mainCla {
	
	public static void main(String[] args) {
		
		ApplicationContext container = 
				new GenericXmlApplicationContext(
						"/p05_aop_model02_Annotation/contextBean.xml");
		
		J02_Math injector = 
				(J02_Math) container.getBean("div");
		injector.coreWorks();
		
		((GenericXmlApplicationContext)container).close();
		
	}// main END
	
}// class END
