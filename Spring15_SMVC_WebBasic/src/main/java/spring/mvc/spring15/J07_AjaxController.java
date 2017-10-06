package spring.mvc.spring15;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class J07_AjaxController {
	
	@RequestMapping("j07_ajax")
	public void works() {}
	
	@RequestMapping(value="ajax", produces="text/plain; charset=UTF-8")
	@ResponseBody //@ResponseBody : ajax쓸떄는 이걸 달아라.. 공식이라는데.. 이해 전혀 안감..
//	페이지 이동이 없기때문에 기존의 매핑과 다르다, 기존 return은 페이지 이동인데, ajax의 return은 보내주고싶은 데이터이다.(인코딩이 필요하다.)
	public Object ajaxWorks() {
		String msg = "보여주고 싶은 데이터<br>";
		
		return msg;
//		return ""; : forwarding
	}
	
}// (Controller) class END
