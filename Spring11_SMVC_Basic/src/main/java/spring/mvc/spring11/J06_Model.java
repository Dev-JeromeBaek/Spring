package spring.mvc.spring11;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.mvc.spring11.bean.People;

@Controller
public class J06_Model {
	
	@RequestMapping("j06_modelView")
	public void works(Model model) {	// Model : request에 대해 setattribute를 지원하는놈..?;
		model.addAttribute("peo", new People("마이콜", 996));
	}
	
}// class END
