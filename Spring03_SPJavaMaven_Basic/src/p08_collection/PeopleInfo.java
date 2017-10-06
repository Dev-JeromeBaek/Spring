package p08_collection;

import java.util.ArrayList;
import java.util.HashMap;


public class PeopleInfo {
	
	private ArrayList<People> peoInfo;
	private HashMap<String, People> peoInfo2;
	
	public ArrayList<People> getPeoInfo() {
		return peoInfo; 
	}
	public void setPeoInfo(ArrayList<People> peoInfo) {
		this.peoInfo = peoInfo;
	}
	public HashMap<String, People> getPeoInfo2() {
		return peoInfo2;
	}
	public void setPeoInfo2(HashMap<String, People> peoInfo2) {
		this.peoInfo2 = peoInfo2;
	}
	
	
	
}// class END
