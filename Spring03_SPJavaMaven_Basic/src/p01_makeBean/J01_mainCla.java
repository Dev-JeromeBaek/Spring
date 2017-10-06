package p01_makeBean;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class J01_mainCla {
	
	public static void main(String[] args) {
		
//		xml파일을 이용하여 (Bean)을 생성/이용 하려할때, GenericXmlApplicationContext을 썼던 이유?
//		- 분명 다른 종류도 많다.. 검색해 보니 그러하다.. 그런데.. id와 class 모든 부분을 접근하는 것이
//		  GenericXmlApplicationContext 이기때문에 강사님께서 이걸 쓰신듯 하다.. 시간이 없으니..!
//		조금.. 여유될때, 다른 종류들도 따로 정리해두자!
		
		ApplicationContext container = 
				new GenericXmlApplicationContext(
						"/p01_makeBean/contextBean.xml");	// src 기준으로 적용됨.
		
//		[Bean 객체를 가져오는 명령]
//		#.방법1
		People peo1 = (People)container.getBean("peoBean");
//		#.방법2
		People peo2 = container.getBean("peoBean", People.class);
		
//		같은 객체인지 아닌지 확인하려고 hashCode()를 검사한다.
		System.out.println("peo1 : " + peo1.hashCode());
		System.out.println("peo2 : " + peo2.hashCode());
//		=> 생성된 bean의 기본 설정 상태는 singleton
//			(하나의 빈은 하나의 객체를 의미함)
		
//		[꼭 닫아줘야함. 파일을 접근해서 스트림상으로 받아오는 상황이기에 close안해주면 경고..]
		((GenericXmlApplicationContext)container).close();
		
	}// main END
	
}// class END
