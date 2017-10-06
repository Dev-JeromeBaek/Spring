package p04_aop_model03;

import org.aspectj.lang.JoinPoint;

public class J04_AdviceCla {
	
//	[before] : JoinPoint joinPoint / bofore에서 사용할 수 있는 매개변수
	public void advBefore(JoinPoint joinPoint) {
		System.out.println("프로그램 시작. 관련 메모리를 확보했습니다.");
	}
	
//	[throwing] : Throwable e / throwing에서 사용할 수 있는 매개변수
	public void advArterThrowing(Throwable e) {
		System.out.println("진행 중 예외 발생 => 관련 정보 : " + e.getMessage());
	}
	
//	[after]
	public void advAfter() {
		System.out.println("확보한 메모리 정상 반납 완료");
	}
	
//	[returning]
	public void adbAfterReturning(Object ret) { //core에서 리턴하는 값이 매개변수로 들어온다고 생각하라!!
		System.out.println("프로그램 정상 종료(정상 종료 시 리턴됨 : " + ret + ")");
	}
	
	
}// class END
