package p04_referenceBean;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class J01_mainCla {
	
	public static void main(String[] args) {
		
		ApplicationContext container = 
				new GenericXmlApplicationContext(
						"/p04_referenceBean/contextBean.xml");
		
		Computer c1 = (Computer) container.getBean("com01");
		Computer c2 = (Computer) container.getBean("com02");
		
		System.out.println("[컴퓨터 1]");
		System.out.println("키보드 이름 : " + c1.getKb().getName() + ", 키보드 가격 : " + c1.getKb().getPrice());
		System.out.println("모니터 이름 : " + c1.getMn().getName() + ", 모니터 가격 : " + c1.getMn().getPrice());
		System.out.println("마우스 이름 : " + c1.getMs().getName() + ", 마우스 가격 : " + c1.getMs().getPrice());
		System.out.println();
		System.out.println("[컴퓨터 2]");
		System.out.println("키보드 이름 : " + c2.getKb().getName() + ", 키보드 가격 : " + c2.getKb().getPrice());
		System.out.println("모니터 이름 : " + c2.getMn().getName() + ", 모니터 가격 : " + c2.getMn().getPrice());
		System.out.println("마우스 이름 : " + c2.getMs().getName() + ", 마우스 가격 : " + c2.getMs().getPrice());		
		
		((GenericXmlApplicationContext)container).close();
		
	}// main END
	
}// class END
