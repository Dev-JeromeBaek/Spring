package p02_byType;

public class ClaAAA {
	
	private ClaBBB bbb;
//	bbb : 멤버변수이름 과 bean의 id="bbb"의 이름이
//	같아야 autowire-"byName"이 적용된다.
	
	
	public ClaBBB getBbb() {
		return bbb;
	}

	public void setBbb(ClaBBB bbb) {
		this.bbb = bbb;
	}
	
}// class END
