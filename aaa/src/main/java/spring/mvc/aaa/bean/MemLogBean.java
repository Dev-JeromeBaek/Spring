package spring.mvc.aaa.bean;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("memlog")
public class MemLogBean {
	
	private Integer ml_num;
	private String ml_date;
	private Integer ml_m_num;
	
	public MemLogBean() {
		super();
	}

	public MemLogBean(Integer ml_num, String ml_date, Integer ml_m_num) {
		super();
		this.ml_num = ml_num;
		this.ml_date = ml_date;
		this.ml_m_num = ml_m_num;
	}

	public Integer getMl_num() {
		return ml_num;
	}

	public void setMl_num(Integer ml_num) {
		this.ml_num = ml_num;
	}

	public String getMl_date() {
		return ml_date;
	}

	public void setMl_date(String ml_date) {
		this.ml_date = ml_date;
	}

	public Integer getMl_m_num() {
		return ml_m_num;
	}

	public void setMl_m_num(Integer ml_m_num) {
		this.ml_m_num = ml_m_num;
	}

	
}
