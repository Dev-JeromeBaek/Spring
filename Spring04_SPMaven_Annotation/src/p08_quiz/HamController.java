package p08_quiz;

import java.util.ArrayList;

import javax.swing.JOptionPane;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class HamController {
	
	private HamburgerDTO dto;
	
	@Autowired
	private HamService service;
	
	private String showMenu = "1. 햄버거 정보 입력\n"
							+ "2. 햄버거 정보 보기\n"
							+ "3. 프로그램 종료";
	
	public void works() {
		
		
		while(true) {
			String sel = JOptionPane.showInputDialog(showMenu);
			String msg = null;
			
			if(sel.equals("1")) {
				dto = new HamburgerDTO();
				dto.setData();
				int res = service.insertOne(dto);
				
				msg = res > 0 ? "저장 완료" : "저장 실패";
				
			} else if(sel.equals("2")) {
				
				ArrayList<HamburgerDTO> listc = service.selectList();
				msg = "";
				if(listc.isEmpty()) {
					msg = "저장된 정보 없음";
				} else {
					for(HamburgerDTO each : listc) {
						msg += "이름 : " + each.getName() 
							+ ", 가격 : " + each.getPrice()
							+ ", 칼로리 : " + each.getKcal()
							+ "\n";
					}
				}
				
			} else if(sel.equals("3")) {
				break;
			} else {
				msg = "잘못된 입력";
			}
			JOptionPane.showMessageDialog(null, msg);
		}
		
	}// works() END
	
}// class END
