package p02_aop_model01;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class J01_mainCla {

//	1. AOP : Aspect Oriented Programming
//		- 기능을 공통 관심기능과 핵심 관심기능을 위한
//			모듈로 구분하여 작업의 효율성을 높인 처리 기술
//		- 공통 관심기능을 작성한 뒤,
//			핵심 관심 기능 사이사이에 끼워 넣는다.
	
//	2. AOP 구성 요소
//		1. Advice : 작동되는 상황(언제)에 따라 정의된 공통 관심 기능
//			- 종류 : Around / Before / Returning / Throwing / Arter
//		2. JoinPoint : Advice를 적용할 특정 지점
//		3. PointCut : 여러 joinPoint 중 하나를 선택하는 과정
//		4. Aspect : Advice + PointCut
//	내가 원하는 코드에 공통부분을 끼워넣는다!! 
	
//	[추가정리]
//	타겟 : 실제 서비스를 제공하는 객체
//	어드바이스 : Proxy 객체에 추가될 부가 기능
//	조인포인트 : 부가 기능을 삽입할 위치
//	포인트컷 : 부가 기능이 삽입될 대상 지정
//	애스펙트 : 어드바이스와 포인트컷의 조합. 특정 부가 기능이 어디에 삽입되어야 하는지를 정의
//	위빙 : 분리된 부가 기능을 Proxy객체에 다시 삽입하는 행위
	
	
//	3. AOP 이용을 위한 설정
//		1. jar필요(pom.xml)
/*
	<!-- https://mvnrepository.com/artifact/aspectj/aspectjrt -->
	<dependency>
	    <groupId>aspectj</groupId>
	    <artifactId>aspectjrt</artifactId>
	    <version>1.5.3</version>
	</dependency>
	
	<!-- https://mvnrepository.com/artifact/org.aspectj/aspectjweaver -->
	<dependency>
	    <groupId>org.aspectj</groupId>
	    <artifactId>aspectjweaver</artifactId>
	    <version>1.8.9</version>
	</dependency>
*/
		
//		2. 프레임워크가 원하는 bean 생성 필요
//		- 필수 요소
//		<bean class="org.springframework.aop.framework.autoproxy.DefaultAdvisorAutoProxyCreator"></bean>
	
	
	public static void main(String[] args) {
		
		ApplicationContext container = 
				new GenericXmlApplicationContext(
						"/p02_aop_model01/contextBean.xml");
		
		J02_Math injector = (J02_Math) container.getBean("mod");
		injector.coreWorks();

		
	}// main END
	
}// class END
