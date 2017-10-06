package spring.mvc.spring15.bean;

import org.apache.ibatis.type.Alias;

@Alias("log")
public final class LogBean {
	
	private Integer num;
	private String id;
	private String pw;
	
	
	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	
}// (Bean) class END
