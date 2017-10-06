package spring.mvc.spring16.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import spring.mvc.spring16.repository.TestRepository;

@Controller
public class TestController {
	
	@Autowired
	private TestRepository repository;
	
	
	
}// class END
