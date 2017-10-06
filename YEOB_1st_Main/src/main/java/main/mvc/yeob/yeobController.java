package main.mvc.yeob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import main.mvc.yeob.module.FileWorks;
import main.mvc.yeob.service.YeobService;

@Controller
public class yeobController {

	@Autowired
	private YeobService service;
	@Autowired
	private FileWorks fileModule;
	
	@RequestMapping("shopping")
	public String goShopping() {
		return "shopping";
	}
	
	@RequestMapping("developer")
	public String goDeveloper() {
		return "developer";
	}
	
	@RequestMapping("grayscale")
	public String goGrayscale() {
		return "grayscale";
	}
	
	
	
}// (Controller) class END
