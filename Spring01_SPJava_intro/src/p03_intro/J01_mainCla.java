package p03_intro;

import javax.swing.JOptionPane;

public class J01_mainCla {
	
//	intro : xml파일 이용 상황(예시)
//	- 이번 예제는 예제일뿐!
	
	public static void main(String[] args) {
	
		String showMenu = "1. 정보 입력하기\n"
						+ "2. 정보 보기\n"
						+ "3. 프로그램 종료";
		
		J03_OracleDB oraConn = new J03_OracleDB();
		J03_MySQLDB myConn = new J03_MySQLDB();
		J02_DAO dao = new J02_DAO(oraConn);
		Object msg = null;
		
		while(true) {
			String sel = JOptionPane.showInputDialog(showMenu);
			
			if(sel.equals("1")) {
				msg = dao.insertOne();
			} else if(sel.equals("2")) {
				msg = dao.selectList();
			} else if(sel.equals("3")) {
				break;
			} else {
				msg = "잘못된 입력입니다.";
			}
			JOptionPane.showMessageDialog(null, msg);
		}
		
	}// main END
	
}// class END
