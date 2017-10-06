package p05_aop_model02_Annotation;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

@Component
@Aspect	//Project 한개당 @Aspect는 2개 존재할 수 없다!!
// 빈인데 aspect역할을하는 애다..ㅋㅋ;
public class J04_AspectCla {
	
//	interface를 implements하지 않고 내가 만들어서 쓰는 메소드에 들어가는 매개변수는
//	ProceedingJoinPoint joinPoint이다!!!!!!
	
	@Pointcut("execution(public * coreWorks())")	// 원하는 코어에대한 표현식
//	execution(public * *(..)) -> 이렇게 생긴 메소드들의 이름을 targetMethod 라고 지정, 
	public void targetMethod() {};
	
	@Around("targetMethod()")
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
