package p08_collection;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;


public class J01_mainCla {
	
	public static void main(String[] args) {
		
		ApplicationContext container = 
				new GenericXmlApplicationContext(
						"/p08_collection/contextBean.xml");
		
		PeopleInfo info = (PeopleInfo) container.getBean("peoInfo");
		
		ArrayList<People> listc = info.getPeoInfo();
		
//		[]
		People pp = new People();
		pp.setName("기본생성자");
		pp.setAge(10);
		listc.add(pp);
		
//		[]
		listc.add(new People("초기화생성자",90));
		
		for(People each : listc) {
			System.out.println("1. " + each.getName() + each.getAge());
			
		}
		
		HashMap<String, People> mapc = info.getPeoInfo2();
		for(String each : mapc.keySet()) {
			People peo = mapc.get(each);
			System.out.println("2. " + peo.getName() + peo.getAge());
		}
		
		((GenericXmlApplicationContext)container).close();
		
	}// main END
	
}// class END
