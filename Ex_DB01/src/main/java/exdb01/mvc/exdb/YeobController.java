package exdb01.mvc.exdb;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import exdb01.mvc.exdb.service.YeobService;

@Controller
public class YeobController {
	
	@Autowired
	private YeobService service;
	
	private String gogoSSing;
	private String maSSage;
	
	@RequestMapping(value="/insertOne", method=RequestMethod.GET)
	public String getInsertOne() {
		return "insertOneForm";
	}
	
	
}// class END
