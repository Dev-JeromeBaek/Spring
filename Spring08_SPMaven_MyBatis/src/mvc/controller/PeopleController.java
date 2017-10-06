package mvc.controller;

import java.util.List;

import javax.swing.JOptionPane;
import javax.swing.JTextArea;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import mvc.bean.MapperBean;
import mvc.bean.PeopleBean;
import mvc.repository.PeopleRepository;

@Component("controller")
public class PeopleController {
	
	@Autowired
	private PeopleRepository repository;
	
	private String showMenu = "[인사 정보 관리 프로그램]\n"
							+ "1. 정보 입력\n"
							+ "2. 정보 보기\n"
							+ "3. 정보 검색(이름 검색-Stiring파라미터)\n"
							+ "4. 정보 검색(이름 검색- Bean파라미터)\n"
							+ "4-1. 정보 검색(번호 검색 - Primary Key)\n"
							+ "5. 정보 검색(나이 범위)\n"
							+ "6. 컬럼 지정 검색(이름 검색)\n"
							+ "7. 정보 검색(특정 키워드 포함 값)\n"
							+ "8. 프로그램 종료";
	
	public void works() {
		
		while(true) {
			String sel = JOptionPane.showInputDialog(showMenu);
			String msg = null;
			
//			[1. 정보 입력]
			if(sel.equals("1")) {
				PeopleBean peoBean = new PeopleBean();
				peoBean.setData();
				
				int res = repository.insertOne(peoBean);
				msg = res > 0 ? "저장 완료" : "저장 실패";
				
//			[2. 정보 보기]
			} else if(sel.equals("2")) {
				
				List<PeopleBean> listc = repository.selectList();
				
				msg = "";
				if(listc.isEmpty()) {
					msg = "저장 정보 없음";
				} else {
					for(PeopleBean each : listc) {
						msg += each.getData() + "\n";
					}
				}
				
//			[3. 정보 검색(이름 검색-Stiring파라미터)]
			} else if(sel.equals("3")) {
				
				String search = JOptionPane.showInputDialog("검색할 이름 입력");
				
				List<PeopleBean> listc = repository.selectAll(search);
				
				msg = "";
				if(listc.isEmpty()) {
					msg = "검색 정보 없음";
				} else {
					for(PeopleBean each : listc) {
						msg += each.getData() + "\n";
					}
				}
				
//			[4. 정보 검색(이름 검색- Bean파라미터)]
			} else if(sel.equals("4")) {
				String search = JOptionPane.showInputDialog("검색할 이름 입력");
				
				PeopleBean peoBean = new PeopleBean();
				peoBean.setName(search);
				
				List<PeopleBean> listc = repository.selectAll02(peoBean);
				
				msg = "";
				if(listc.isEmpty()) {
					msg = "검색 정보 없음";
				} else {
					for(PeopleBean each : listc) {
						msg += each.getData() +"\n";
					}
				}
//			[4-1. 정보 검색(번호 검색 - Primary Key)]
			} else if(sel.equals("4-1")) {
				String rcv = JOptionPane.showInputDialog("검색 번호(PK) 입력");
				int pk = Integer.parseInt(rcv);
				
				PeopleBean peoBean = repository.selectOne(pk);
				
				if(peoBean == null) {
					msg = "검색 정보 없음";
				} else {
					msg = peoBean.getData();
				}
				
//			[5. 정보 검색(나이 범위)]
			} else if(sel.equals("5")) {
				MapperBean mapBean = new MapperBean();
				mapBean.setData5();
				
				List<PeopleBean> listc = repository.selectRange(mapBean);
				msg = "";
				if(listc.isEmpty()) {
					msg = "검색 정보 없음";
				} else {
					for(PeopleBean each : listc) {
						msg += each.getData() +"\n";
					}
				}
				
//			[6. 컬럼 지정 검색(이름 검색)]
			} else if(sel.equals("6")) {
				
				String tableName = "t_peo";
				String colName = "name";
				String searchKey = "qq";
				
				MapperBean mapBean = new MapperBean(tableName, colName, searchKey);
				
				List<PeopleBean> listc = repository.selectUsingSQL(mapBean);
				
				msg = "";
				if(listc.isEmpty()) {
					msg = "검색 정보 없음";
				} else {
					for(PeopleBean each : listc) {
						msg += each.getData() + "\n";
					}
				}
				
//			[7. 정보 검색(특정 키워드 포함 값)]
			} else if(sel.equals("7")) {
				
				String searchKey = JOptionPane.showInputDialog("검색 키워드");
				MapperBean mapBean = new MapperBean();
				mapBean.setSearchKey(searchKey);
				
				List<PeopleBean> listc = repository.selectKeyWord(mapBean);
				
				msg = "";
				if(listc.isEmpty()) {
					msg = "검색 정보 없음";
				} else {
					for(PeopleBean each : listc) {
						msg += each.getData() + "\n";
					}
				}
				
//			[8. 프로그램 종료]
			} else if(sel.equals("8")) {
				msg = "프로그램 종료";
				break;
			} else {
				msg = "잘못된 입력입니다.";
			}
			JOptionPane.showMessageDialog(null, new JTextArea(msg));
		}
	}
	
}// (Controller) class END
