package p02_aop_model01;

import javax.swing.JOptionPane;

import org.aopalliance.intercept.MethodInterceptor;
import org.aopalliance.intercept.MethodInvocation;

//	Around Advice 작성 방법
//	- 공통 관심 기능에 대한 전체적인 구현이 표현된 advice
//	1. implements MethodInterceptor 
//	2. invoke() 메소드 오버라이드
//	3. 공통 관심 기능 작성
//	4. 핵심 관심 기능이 적용될 시점에 joinPoint.proceed() 명령
//	5. 결과 리턴



public class J04_AdviceCla implements MethodInterceptor {

	@Override
	public Object invoke(MethodInvocation joinPoint) throws Throwable {
		
		Object ret = null;
		
		System.out.println("프로그램 시작. 관련 메모리를 확보했습니다.");
		
		try {
			
			ret = joinPoint.proceed();
			
			
		} catch (Exception e) {
			System.out.println("진행 중 예외 발생 => 관련 정보 : " + e.getMessage());
		} finally {
			System.out.println("확보한 메모리 정상 반납 완료");
		}
		
		System.out.println("프로그램 정상 종료");

		
//		return 이 필요없으면 null값을 리턴하면됨
		return ret;
	}
	
	
	
}// class END
