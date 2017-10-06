package mvc.controller;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class mainCla {

	public static void main(String[] args) {
		
		ApplicationContext container = 
				new GenericXmlApplicationContext(
						"/context-config/bean-context.xml");
		
		DNMController cont = (DNMController) container.getBean("cont");
		cont.works();
		
		((GenericXmlApplicationContext)container).close();
		
	}// main END
	
}// class END
