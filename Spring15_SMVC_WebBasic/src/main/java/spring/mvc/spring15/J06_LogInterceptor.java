package spring.mvc.spring15;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

//	인터셉터 핸들러 작성 방법
//	1. extends HandlerInterceptorAdapter
//	2. 세가지 메소드 중 원하는 메소드 구현
//		- preHandle()
//			: 컨트롤러 빈을 실행하기 전 실행해야 할 기능을 구현
//		- postHandle()
//			: 컨트롤러 빈을 실행한 후 실행해야 할 기능을 구현
//		- afterCompletion()
//			: (많이 안쓰지만 궂이 쓰자면) 클라이언트에 뷰를 전송한 후 실행해야 할 기능 구현

@Component("logInter")
public class J06_LogInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		System.out.println("preHandle()");
		
		HttpSession session = request.getSession();
		
//		세션을 써야하는데 세션이 없다? 그럼 리퀘스트에서 뽑아서 쓴다! .getSession();
		
		String logStaus = (String)session.getAttribute("nowLogin");
//		=> 세션에 해당 값이 없는 경우 null값을 리턴
		
		System.out.println("logStatus : " + logStaus);
		
		boolean nowLogin = logStaus != null; // (true)
		
		if(!nowLogin) { // 로그인 상태가 아니면 
				response.sendRedirect("/spring15/logAlert");
				return false;
//				return false : return false는 요청된 url을 무시하고 변경된 url로 매핑하라는 의미.
//							-> 원래 가려고 했던 페이지 안갈거니까 새로운 url을 매핑할것임!! 즉, 2가지 의미를 지님.
//				return true : 로그인 상태인 경우 return true;
//							: return true는 요청된 url로 매핑하라는 의미
		}
		
		return true;	// 지금 가려고 하는 곳으로 가라! 즉, 원래 가려고 했던 페이지로 이동하라!
						// (결론 : 원래 가려했던 컨트롤러로 go)
		
//		return : 바로 JSP쪽으로 넘어가는 것이 아니고
//		controller로 이동하기때문에
//		세션에 객체를 넣어 이동하듯,
//		request.getAttribute()로 객체를 넣다보면
//		controller에서 뽑아서 다시 설정이 필요하다!
//		작업한번 해볼것!
//		모듈 설정만 잘 해 놓으면,, 정말 유용하게 쓰일 듯 하다! 
		
	}
	
	
	
	
//	[jsp쪽으로 가기때문에 modelAndView를 통해 뭘 보내라..]
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		
		System.out.println("postHandle");
		
		super.postHandle(request, response, handler, modelAndView);
	}
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		super.afterCompletion(request, response, handler, ex);
	}
	
	
	
}// (InterCeptor) class END
