package spring.mvc.spring15;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

//	PathVariable : 경로 키워드가 변수화
@Controller
@RequestMapping("path/{url1}/{url2}/{url3}")
public class J09_PathVariable {
//	path : 컨트롤러가 다 받겠다
//	{url1} : (변수) 어떠한 값이라도 받겠다.
	
	@RequestMapping
	public String path(@PathVariable String url1,
			@PathVariable String url2,
			@PathVariable String url3) {
//		=> url3는 정수값이므로, Integer url3로 받는 것 가능
		
		System.out.println("url1 : " + url1);
		System.out.println("url2 : " + url2);
		System.out.println("url3 : " + url3);
		
		return "j09_pathView";
	}
}
