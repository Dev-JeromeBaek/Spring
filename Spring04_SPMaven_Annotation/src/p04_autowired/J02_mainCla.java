package p04_autowired;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class J02_mainCla {
	
	public static void main(String[] args) {
		
//		1. 빈 객체 이용 
		ApplicationContext container = 
				new GenericXmlApplicationContext(
						"/p04_autowired/contextBean.xml");
		
		People peo = (People) container.getBean("peo");
		peo.showHashCode();
		
		((GenericXmlApplicationContext)container).close();
		
//		2. 객체 이용
		People pp2 = new People();
		pp2.showHashCode();
		
	}// main END
	
}// class END
