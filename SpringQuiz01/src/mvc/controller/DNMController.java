package mvc.controller;

import javax.swing.JOptionPane;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import mvc.bean.DNMBean;
import mvc.service.DNMService;

@Component("cont")
public class DNMController {
	
	@Autowired
	private DNMService service;
	
	private String showMenu = "1. (영화&드라마)정보 입력\n"
							+ "2. (영화&드라마)정보 보기\n"
							+ "3. 프로그램 종료";
	
	public void works() {
		
		while(true) {
			String msg = null;
			String sel = JOptionPane.showInputDialog(showMenu);
			
			if(sel.equals("1")) {
				
				DNMBean dnmBean = new DNMBean();
				dnmBean.setData();
				int res = service.insertOne(dnmBean);
				
				msg = res > 0 ? "저장 완료" : "저장 실패";
				
			} else if(sel.equals("2")) {
				
				
				
				
			} else if(sel.equals("3")) {
				msg = "프로그램을 종료합니다.";
				break;
			} else {
				msg = "잘못된 입력입니다.";
			}
			JOptionPane.showMessageDialog(null, msg);
		}
		
	}// works() END
	
}// (Controller) class END
