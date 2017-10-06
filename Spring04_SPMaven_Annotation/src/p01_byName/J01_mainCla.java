package p01_byName;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class J01_mainCla {
	
	public static void main(String[] args) {
		
		ApplicationContext container = 
				new GenericXmlApplicationContext(
						"/p01_byName/contextBean.xml");
		
		ClaAAA aaa = (ClaAAA) container.getBean("aaa");
		String rcv = aaa.getBbb().getMsg();
		System.out.println(rcv);
		
		
		
		((GenericXmlApplicationContext)container).close();
		
	}// main END
	
}// class END
