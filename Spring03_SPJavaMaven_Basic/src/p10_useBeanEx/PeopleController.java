package p10_useBeanEx;

import java.util.ArrayList;

import javax.swing.JOptionPane;

import org.springframework.context.ApplicationContext;

public class PeopleController {

	private PeoService service;
	private String showMenu = "1. 인사 정보 입력\n"
							+ "2. 인사 정보 보기\n"
							+ "3. 프로그램 종료";
	
	public void works(ApplicationContext container) {
		// TODO Auto-generated method stub
		service = (PeoService) container.getBean("service");
		
		while(true) {
			String sel = JOptionPane.showInputDialog(showMenu);
			String msg = null;
			
			if(sel.equals("1")) {
				PeopleDTO dto = new PeopleDTO();
				dto.setData();
				int res = service.insertOne(container, dto);
				msg = res > 0 ? "저장 완료" : "저장 실패";
				
			} else if(sel.equals("2")) {
				
				ArrayList<PeopleDTO> listc = service.selectList(container);
				
				msg = "";
				if(listc.isEmpty()) {
					msg = "저장된 정보가 없습니다.";
				} else {
					for(PeopleDTO each : listc) {
						msg += each.getName() + ", " + each.getAge() + "\n";
					}
				}
				
			} else if(sel.equals("3")) {
				break;
			} else {
				msg = "잘못된 입력입니다.";
			}
			JOptionPane.showMessageDialog(null, msg);
		}
		
		
	}// works() END

	
	
}// class END
