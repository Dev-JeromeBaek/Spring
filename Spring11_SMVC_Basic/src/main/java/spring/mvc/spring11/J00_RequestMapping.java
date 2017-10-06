package spring.mvc.spring11;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

//	RequestMapping
//	- 요청된 URL에 해당하는 메소드를 호출함.
//	- return에서 지정된 페이지로 이동.
//	- return이 없는 경우, 
//		@RequestMapping의 URL과 동일한 페이지로 이동}
//	- URL 요청이 /spring11/aaa인 경우
//		@RequestMaping("/aaa") 또는 @RequestMapping("aaa")
//		두 형식 모두 가능

@Controller
public class J00_RequestMapping {
	
//	[1]
	@RequestMapping("/j00_basic.jsp")
	public String works01() {
		return "j00_basic";
//		@RequestMapping 어노테이션이 달린 메소드의 return은 가고싶은 페이지를 칭한다!!
	}
	
//	[2]
//	@RequestMapping("/j00_basic") : /j00_basic이라는게 들어오면 메소드를 돌려라!
	@RequestMapping("/j00_basic")
	public String works02() {
		return "/j00_basic";
	}
	
//	[3]
	@RequestMapping("/j00_basic01")
	public void works03() {
//		return이 없는 경우 요청한 /j00_basic01와 동일한 페이지로 이동한다.
	}
	
//	[4]
	@RequestMapping("/j00_works01")
	public String works04() {
		return "/j00_works02";
	}
	
//	[5] : redirect:j00_works01
	@RequestMapping("/j00_works03")
	public String works05() {
		return "redirect:j00_works01?data=paramData";
		// 이 URL(j00_works01)에 대해서 Mapping이 진행되고있는 works02 페이지로 이동한다.
		// 여기서 ?data=paramData 를 보내주면 j00_works01로 매핑이 되어있는 페이지로만 파라미터값이 이동되고
		// 다른곳에선 값이 전달되지 않는다. (나중에 다시 정리할 것이기에 이정도만 알고 넘어가자;)
		
	}
	
}// (RequestMapping) class END
