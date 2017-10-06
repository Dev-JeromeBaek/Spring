package spring.mvc.spring15;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.mvc.spring15.bean.J08_People;
import spring.mvc.spring15.bean.J08_PeopleList;

//	객체 정보를 JSON 형식으로 변환한 후 전송하기
//	1. @pom.xml : jackson-databind
//	2. Ajax 이용 시 @ResponseBody 만으로 이용 가능


@Controller
public class J08_JsonController {
	
	@RequestMapping("j08_json")
	public String json01() {
		return "j08_json";
	}
	
	@RequestMapping("json01")
	@ResponseBody
	public J08_People objectToJson() {
		
		J08_People peo = new J08_People("둘리", 10);
		
		return peo;
	}
	
	@RequestMapping("json02")
	@ResponseBody
	public J08_PeopleList listToJson() {
		
		List<J08_People> listc = new ArrayList<>();
		listc.add(new J08_People("둘리", 10));
		listc.add(new J08_People("마이콜", 20));
		listc.add(new J08_People("도우너", 30));
		
		return new J08_PeopleList(listc);
	}
	
}// (Controller) class END
