package p04_intro;

public class J03_MySQLDB implements J03_Injection {
	
	public Object getConnection() {
		
		System.out.println("MySQL DB 접속 시작");
		System.out.println("#.1 Driver Load Comp");
		System.out.println("#.2 DB Connection Comp");
		return "MySQL Connection";
		
	}// getConnection() END
	
}// class END