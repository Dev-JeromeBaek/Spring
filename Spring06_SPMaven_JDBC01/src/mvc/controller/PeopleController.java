package mvc.controller;

import java.util.ArrayList;

import javax.swing.JOptionPane;

import mvc.bean.PeopleBean;
import mvc.service.PeopleService;

public class PeopleController {

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
				
				ArrayList<PeopleBean> listc = service.selectList();
				
				msg = "";
				if(listc == null) {
					msg = "저장된 정보가 없습니다.";
				} else {
					for(PeopleBean each : listc) {
						msg += each.getData() + "\n";
					}
				}
				
			} else if(sel.equals("3")) {
				msg = "프로그램을 종료합니다.";
				break;
			} else {
				msg = "잘못된 입력입니다.";
			}
			JOptionPane.showMessageDialog(null, msg);
		}
	}

	public void setService(PeopleService service) {
		this.service = service;
	}
	
//	public PeopleService getService() {
//		return service;
//	}

}// (controller) class END
