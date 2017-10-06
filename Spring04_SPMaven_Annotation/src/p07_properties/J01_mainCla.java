package p07_properties;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class J01_mainCla {
	
	public static void main(String[] args) {
		
		ApplicationContext container = 
				new GenericXmlApplicationContext(
						"/p07_properties/contextBean.xml");
		
		jdbcDataSource source = (jdbcDataSource) container.getBean("jdbcBean");
		System.out.println(source);
		
		((GenericXmlApplicationContext)container).close();
		
	}// main END
	
}// class END
