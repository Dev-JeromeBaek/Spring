package p03_constructor;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class J01_mainCla {
	
	public static void main(String[] args) {
		
		ApplicationContext container = 
				new GenericXmlApplicationContext(
						"/p03_constructor/contextBean.xml");
		
		Milk m1 = (Milk) container.getBean("m01");
		Milk m2 = (Milk) container.getBean("m02");
		Milk m3 = (Milk) container.getBean("m03");
		Milk m4 = (Milk) container.getBean("m04");
		
		System.out.println("이름 : " + m1.getName() + ", 가격 : " + m1.getPrice());
		System.out.println("이름 : " + m2.getName() + ", 가격 : " + m2.getPrice());
		System.out.println("이름 : " + m3.getName() + ", 가격 : " + m3.getPrice());
		System.out.println("이름 : " + m4.getName() + ", 가격 : " + m4.getPrice());
		
		((GenericXmlApplicationContext)container).close();
		
	}// main END
	
}// class END

