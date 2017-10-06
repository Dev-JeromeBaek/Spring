package mvc.controller;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class PeopleMainCla {

	public static void main(String[] args) {
		
		ApplicationContext container = 
				new GenericXmlApplicationContext(
						"/context-config/bean-context.xml");
		
		PeopleController cont = (PeopleController) container.getBean("controller");
		cont.works();
		
		((GenericXmlApplicationContext)container).close();
		
	}// main END
	
}// class END
