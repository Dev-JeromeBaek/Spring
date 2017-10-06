package p01_intro;

public class J02_DAO {

	public Object getConnection() {
		
		System.out.println("오라클 DB 접속 시작");
		System.out.println("#.1 Driver Load Comp");
		System.out.println("#.2 DB Connection Comp");
		
		return "오라클 Connection";
	}// getConnection() END
	
	public Object insertOne() {
		Object conn = getConnection();
		System.out.println("#.3 " + conn + "실행 - "
				+ "SQL(insert) && execute && result");
		
		return "insert 결과 성공한 갯수";
	}
	
	public Object selectList() {
		Object conn = getConnection();
		System.out.println("#.3 " + conn + "실행 - "
				+ "SQL(select) && execute && result");
		
		return "select 결과 레코드 정보";
	}
	
}// class END