package p03_intro;

public class J03_OracleDB implements J03_Injection {
	
	public Object getConnection() {
		
		System.out.println("오라클 DB 접속 시작");
		System.out.println("#.1 Driver Load Comp");
		System.out.println("#.2 DB Connection Comp");
		return "오라클 Connection";
		
	}// getConnection() END
	
}// class END
