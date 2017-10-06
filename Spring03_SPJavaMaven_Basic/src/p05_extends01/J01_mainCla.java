package p05_extends01;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class J01_mainCla {
	
	public static void main(String[] args) {
		
		ApplicationContext container = 
				new GenericXmlApplicationContext(
						"/p05_extends01/contextBean.xml");
		
		SubCla sub = (SubCla) container.getBean("subBean");
		
		System.out.println("이름 : " + sub.getName() + ", 나이 : " + sub.getAge() + ", 취미 : " + sub.getHobby());
		
		((GenericXmlApplicationContext)container).close();
		
	}// main END
	
}// class END
