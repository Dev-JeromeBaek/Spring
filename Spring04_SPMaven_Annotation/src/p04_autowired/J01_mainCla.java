package p04_autowired;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class J01_mainCla {

	public static void main(String[] args) {
		
		ApplicationContext container = 
				new GenericXmlApplicationContext(
						"/p04_autowired/contextBean.xml");
		
		People peo = (People) container.getBean("peo");
		peo.showCorp();
		peo.showHome();
		
		((GenericXmlApplicationContext)container).close();
		
	}// main END
	
}// class END
