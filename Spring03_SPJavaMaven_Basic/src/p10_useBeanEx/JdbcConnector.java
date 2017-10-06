package p10_useBeanEx;

public class JdbcConnector {
	
	public void getConnection() {
		System.out.println("1. DB Driver Load Comp");
		System.out.println("2. DB Connection Comp");
	}
	
	public void closeConn() {
		System.out.println("conn Close");
	}
	
	public void connCommit() {
		System.out.println("conn Commit()");
	}
	
	public void connRollback() {
		System.out.println("conn rollback()");
	}
	
	
}// class END
