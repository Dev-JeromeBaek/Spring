package mvc.bean;

import javax.swing.JOptionPane;

public class DNMBean {
	
	private int num;
	private String title;
	private String actor;
	private int runtime;

	public void setData() {
		this.title = JOptionPane.showInputDialog("제목 입력");
		this.actor = JOptionPane.showInputDialog("주연 입력");
		this.runtime = Integer.parseInt(JOptionPane.showInputDialog("상영 시간 입력"));
	}
	
	public String getData() {
		return "번호 : " + num + ", 제목 : " + title + ", 주연 : " + actor + ", 상영시간 : " + runtime;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getActor() {
		return actor;
	}

	public void setActor(String actor) {
		this.actor = actor;
	}

	public int getRuntime() {
		return runtime;
	}

	public void setRuntime(int runtime) {
		this.runtime = runtime;
	}
	
	
}// class END
