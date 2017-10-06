package spring.mvc.spring15;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.mvc.spring15.bean.BirthDayBean;


//	@InitBinder
//	- 전달되는 파라미터 값을
//		@RequestMapping 메소드의 인자값에서 받기 전에
//		미리 값을 받아 원하는 작업을 처리할 수 있도록 지원
//	- 문자열 파라미터에 대해 Date 등의 타입으로 변환 기능

// - 컴퓨터에게도 휴식 시간을 줘야 에러가 안 납니다.

@Controller
public class J05_InitBinder {
	
	@RequestMapping("j05_initBinder")
	public void initForm() {}
	
	
	
	@InitBinder
	public void InitBinder(WebDataBinder bindData) {
		
		System.out.println("@initBinder - bindData : " + bindData);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		bindData.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
//		true : 수신 파라미터의 값이 null이거나 빈물자열("")인 경우, 변환처리 하지 않고 null을 저장
//		false : 위의 상황에서 에러 발생 시킴
		
	}



	@RequestMapping(value="initBinder", method=RequestMethod.GET)
	public String getInit(BirthDayBean birth) {
		System.out.println("getInit()");
		System.out.println("birthDay : " + birth.getBirthDay());
		return "j05_initView";
	}
	
	@RequestMapping(value="initBinder", method=RequestMethod.POST)
	public String postInit(BirthDayBean birth) {
		System.out.println("postInit()");
		return "j05_initView";
	}
}
