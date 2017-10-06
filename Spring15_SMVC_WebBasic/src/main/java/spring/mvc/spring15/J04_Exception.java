package spring.mvc.spring15;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class J04_Exception {
	
	@RequestMapping("j04_exception")
	public String works() {
		return "j04_exc01_home";
	}
	
	
//	1. bean 설정을 이용한 예외처리
	@RequestMapping("nullExc")
	public void nullExc() {
		
		ArrayList listc = null;
		listc.add(10);
	}
	
//	2. 메소드의 Annotation을 이용한 예외 처리
	@RequestMapping("indexExc")
	public void indexExc() {
		int[] a = {1};
		a[5] = 10;
	}
	
	// 들어오는 예외상황에 대해 매개변수를 설정하고 return으로 가고싶은 페이지를 적어준다.
	@ExceptionHandler(ArrayIndexOutOfBoundsException.class)
	public String catchExc(ArrayIndexOutOfBoundsException e) {
		
		return "j04_exc03_index";
	}
	
}
