package mvc.controller;

import java.util.List;

import javax.swing.JOptionPane;
import javax.swing.JTextArea;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;

import mvc.bean.PeopleBean;
import mvc.repository.PeopleRepository;

@Component("controller")
public class PeopleController {

	@Autowired
	private PeopleRepository repository;
	private String showMenu = "[인사 정보 관리 프로그램]\n"
							+ "1. 정보 입력\n"
							+ "2. 정보 보기\n"
							+ "3. 정보 수정\n"
							+ "4. 컬럼 삭제\n"
							+ "5. 프로그램 종료";
	public void works() {
		
		while(true) {
			String msg = null;
			String sel = JOptionPane.showInputDialog(showMenu);
			
			if(sel.equals("1")) {
				
				PeopleBean peoBean = new PeopleBean();
				peoBean.setData();
				int res = repository.insertOne(peoBean);
				
				msg = res > 0 ? "저장 완료" : "저장 실패";
				
			} else if(sel.equals("2")) {
				
				List<PeopleBean> listc = repository.selectList();
				if(listc.isEmpty()) {
					msg = "저장 정보가 없습니다.";
				} else {
					for(PeopleBean each : listc) {
						msg += each.getData() + "\n";
					}
				}
				
			} else if(sel.equals("3")) {
				
			} else if(sel.equals("4")) {
				
			} else if(sel.equals("5")) {
				break;
			} else {
				msg = "잘못된 입력입니다.";
			}
			JOptionPane.showMessageDialog(null, new JTextArea(msg));
		}
	}

}
