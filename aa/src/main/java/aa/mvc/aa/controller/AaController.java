package aa.mvc.aa.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import aa.mvc.aa.repository.AaRepository;

@Controller
public class AaController {

	@Autowired
	private AaRepository repository;
	
	@RequestMapping("home-total")
	private String goGome() {
		return "redirect:home-total";
	}
	
}
