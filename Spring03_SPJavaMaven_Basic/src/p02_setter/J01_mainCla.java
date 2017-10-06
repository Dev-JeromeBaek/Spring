package p02_setter;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class J01_mainCla {
	
	public static void main(String[] args) {
		
		ApplicationContext container = 
				new GenericXmlApplicationContext(
						"/p02_setter/contextBean.xml");
		
//		bean(.xml)을 통한 객체 생성
		Food fd1 = (Food) container.getBean("BigMac");
		Food fd2 = (Food) container.getBean("1955");
		
		System.out.println("이름 : " + fd1.getName() + ", 가격 : " + fd1.getPrice());
		System.out.println("이름 : " + fd2.getName() + ", 가격 : " + fd2.getPrice());
		
		
		((GenericXmlApplicationContext)container).close();
		
	}// main END

}// class END
