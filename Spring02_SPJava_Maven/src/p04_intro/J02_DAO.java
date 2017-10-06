package p04_intro;

public class J02_DAO {
	
	J03_Injection rcvConn;
	
//	[J03_Injection]!!!!!!!!!!!!!!!!!!!  주입.
//	결합도...;
//	public J02_DAO(J03_Injection rcv) {
//		rcvConn = rcv;
//	}
	
	public J02_DAO(J03_Injection rcv) {
		rcvConn = rcv;
	}
 
	public Object insertOne() {
		Object conn = rcvConn.getConnection();
		System.out.println("#.3 " + conn + "실행 - "
				+ "SQL(insert) && execute && result");
		
		return "insert 결과 성공한 갯수";
	}
	
	public Object selectList() {
		Object conn = rcvConn.getConnection();
		System.out.println("#.3 " + conn + "실행 - "
				+ "SQL(select) && execute && result");
		
		return "select 결과 레코드 정보";
	}
	
}// class END