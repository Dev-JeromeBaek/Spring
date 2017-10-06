package mvc.controller;

import java.util.List;

import javax.swing.JOptionPane;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import mvc.bean.PeopleBean;
import mvc.service.PeopleService;

@Component("controller")
public class PeopleController {
	
	@Autowired
	private PeopleService service;
	private String showMenu = "1. 인사 정보 입력\n"
							+ "2. 인사 정보 보기\n"
							+ "3. 프로그램 종료";

	public void works() {
	
		while(true) {
			String sel = JOptionPane.showInputDialog(showMenu);
			String msg = null;
			if(sel.equals("1")) {
				PeopleBean peoBean = new PeopleBean();
				peoBean.setData();
				int res = service.insertOne(peoBean);
				msg = res > 0 ? "저장 완료" : "저장 실패";
				
			} else if(sel.equals("2")) {
				List<PeopleBean> listc = service.selectList();
//				=> 정보가 없는 상황에 대한 확인 필요
//					(Exception을 이용해서 null등을 리턴해야 함)
				msg = "";
				for(PeopleBean each : listc) {
					msg += each.getData() + "\n";
				}
				
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
