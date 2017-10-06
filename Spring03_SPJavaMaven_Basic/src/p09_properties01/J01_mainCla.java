package p09_properties01;

import javax.sound.sampled.AudioFormat.Encoding;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class J01_mainCla {
	
	public static void main(String[] args) {
		ApplicationContext container =
				new GenericXmlApplicationContext(
						"/p09_properties01/contextBean.xml");
		
		People peo = (People) container.getBean("peo");
		
		System.out.println("이름 : " + peo.getName() + ", 나이 : " + peo.getAge());
		
	}// main END
	
}// class END
