package p06_required;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class J01_mainCla {
	
	public static void main(String[] args) {
		
		ApplicationContext container = 
				new GenericXmlApplicationContext(
						"/p06_required/contextBean.xml");
		
		People peo = (People) container.getBean("peo");
		System.out.println("이름 : " + peo.getName()
							+ ", 나이 : " + peo.getAge());
		
		((GenericXmlApplicationContext)container).close();
		
	}// main END
	
}// class END
