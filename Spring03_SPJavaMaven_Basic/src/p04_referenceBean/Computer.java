package p04_referenceBean;

public class Computer {
	
	private KeyBoard kb;
	private Monitor mn;
	private Mouse ms;
	
	public Computer() {
		// TODO Auto-generated constructor stub
	}

	public Computer(KeyBoard kb, Monitor mn, Mouse ms) {
		super();
		this.kb = kb;
		this.mn = mn;
		this.ms = ms;
	}
	
	
	public KeyBoard getKb() {
		return kb;
	}

	public void setKb(KeyBoard kb) {
		this.kb = kb;
	}

	public Monitor getMn() {
		return mn;
	}

	public void setMn(Monitor mn) {
		this.mn = mn;
	}

	public Mouse getMs() {
		return ms;
	}

	public void setMs(Mouse ms) {
		this.ms = ms;
	}
	
	
}// class END
