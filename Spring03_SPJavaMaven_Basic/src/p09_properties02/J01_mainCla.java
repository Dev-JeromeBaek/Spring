package p09_properties02;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class J01_mainCla {
	
	public static void main(String[] args) {
		
		ApplicationContext container = 
				new GenericXmlApplicationContext(
						"/p09_properties02/contextBean.xml");
	
			
			jdbcDataSource source = (jdbcDataSource) container.getBean("jdbcBean");
			
			System.out.println(source);
			
			
			((GenericXmlApplicationContext)container).close();

			try {
				Thread.sleep(1000);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
	}// main END
	
}// class END
