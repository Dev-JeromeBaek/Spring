package p10_useBeanEx;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class J01_mainCla {
	
	public static void main(String[] args) {
		
		ApplicationContext container = 
				new GenericXmlApplicationContext(
						"/p10_useBeanEx/contextBean.xml");
		
		PeopleController cont = (PeopleController) container.getBean("controller");
		cont.works(container);
		
		
		((GenericXmlApplicationContext)container).close();
		
	}// main END
	
}// class END
