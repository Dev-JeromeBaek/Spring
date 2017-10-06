package spring.mvc.spring12;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.spring12.bean.PeopleBean;
import spring.mvc.spring12.repository.PeopleRepository;

//	JDBC 이용 시 필요한 내용들
//	1. 버전 변경 : 자바(1.8) / spring-context(4.1.7)
//	2. 필요 jar
//		- ojdbc6.jar : 직접 설정 필요(build Path 및 deployment 설정)
//		- pom.xml :
//			1. commons-dbcp
//			2. 트랜잭션 관리 필요 시 spring-jdbc
//	3. 

@Controller
public class JdbcController {

	@Autowired
	private PeopleRepository repository;
	
	@RequestMapping("/selectList")
	public ModelAndView selectList() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("selectList");
		ArrayList<PeopleBean> listc = repository.selectList();
		mav.addObject("listc", listc);
		
		return mav;
	}
	
}// (Controller) class END
