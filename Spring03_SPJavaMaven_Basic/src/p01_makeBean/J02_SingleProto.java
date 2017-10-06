package p01_makeBean;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class J02_SingleProto {

	public static void main(String[] args) {
		
		ApplicationContext container = 
				new GenericXmlApplicationContext(
						"/p01_makeBean/contextBean.xml");
		
//		1. singleton
//			=> 하나의 객체
		People pp1 = (People)container.getBean("singleBean");
		People pp2 = (People)container.getBean("singleBean");
		People pp3 = (People)container.getBean("singleBean");
		
		System.out.println("pp1 : " + pp1.hashCode());
		System.out.println("pp2 : " + pp2.hashCode());
		System.out.println("pp3 : " + pp3.hashCode());
		
//		2. protoType
//			=> 매번 새로운 객체를 생성해서준다.
		People pp4 = (People)container.getBean("protoBean");
		People pp5 = (People)container.getBean("protoBean");
		People pp6 = (People)container.getBean("protoBean");
		
		System.out.println("pp4 : " + pp4.hashCode());
		System.out.println("pp5 : " + pp5.hashCode());
		System.out.println("pp6 : " + pp6.hashCode());
		
		((GenericXmlApplicationContext)container).close();
		
	}// main END
	
}// class END
