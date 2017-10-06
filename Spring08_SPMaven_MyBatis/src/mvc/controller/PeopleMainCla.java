package mvc.controller;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class PeopleMainCla {

	public static void main(String[] args) {
		
		ApplicationContext container = 
				new GenericXmlApplicationContext(
						"/context-config/bean-context.xml");
		
		PeopleController cont = (PeopleController) container.getBean("controller");
		cont.works();
		
		((GenericXmlApplicationContext)container).close();
		
	}// main END
	
}// class END

//	숙제 : Spring08
//	마이바티스를 이용한 정보 관리 프로그램
//	정보 내용 : 자유롭게
//	메뉴 : 자유롭게
//	@@@@@@@@@@@@@@@@@ 단, DB 세팅은 바로 진행할 수 있을 정도로 연습 @@@@@@@@@@@@@@@@@
