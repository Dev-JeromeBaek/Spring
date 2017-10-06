package exmybatis.mvc.exmybatis02;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import exmybatis.mvc.exmybatis02.repository.PeopleRepository;

@Controller
public class PeopleController {
	
	@Autowired
	private PeopleRepository repository;
	
}// (Controller) class END
