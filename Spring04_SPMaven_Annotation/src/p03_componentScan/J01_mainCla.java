package p03_componentScan;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class J01_mainCla {
	
	public static void main(String[] args) {
		
		ApplicationContext container =
				new GenericXmlApplicationContext(
						"/p03_componentScan/contextBean.xml");
		
		People peo = (People) container.getBean("people");
		System.out.println(peo.getName() + ", " + peo.getAge());
		
		
		
		((GenericXmlApplicationContext)container).close();
		
	}// main END
	
}// class END
