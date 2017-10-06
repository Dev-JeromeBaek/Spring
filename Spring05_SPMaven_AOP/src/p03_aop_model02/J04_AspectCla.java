package p03_aop_model02;

import org.aspectj.lang.ProceedingJoinPoint;

public class J04_AspectCla {
	
	
//	interface를 implements하지 않고 내가 만들어서 쓰는 메소드에 들어가는 매개변수는
//	ProceedingJoinPoint joinPoint이다!!!!!!
	
	public Object joinPointWorks(ProceedingJoinPoint joinPoint) throws Throwable {
		
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
