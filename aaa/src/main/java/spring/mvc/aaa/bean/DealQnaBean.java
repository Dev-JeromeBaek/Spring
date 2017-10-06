package spring.mvc.aaa.bean;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("dq")
public class DealQnaBean {
	private Integer dq_num;
	private String dq_content;
	private Integer dq_di_num;
	private Integer dq_m_num;
	private Date dq_date;
	private String dq_ans;
	private Date dq_ans_date;
	
	public DealQnaBean() {
		// TODO Auto-generated constructor stub
	}

	public Integer getDq_num() {
		return dq_num;
	}

	public void setDq_num(Integer dq_num) {
		this.dq_num = dq_num;
	}

	public String getDq_content() {
		return dq_content;
	}

	public void setDq_content(String dq_content) {
		this.dq_content = dq_content;
	}

	public Integer getDq_di_num() {
		return dq_di_num;
	}

	public void setDq_di_num(Integer dq_di_num) {
		this.dq_di_num = dq_di_num;
	}

	public Integer getDq_m_num() {
		return dq_m_num;
	}

	public void setDq_m_num(Integer dq_m_num) {
		this.dq_m_num = dq_m_num;
	}

	public Date getDq_date() {
		return dq_date;
	}

	public void setDq_date(Date dq_date) {
		this.dq_date = dq_date;
	}

	public String getDq_ans() {
		return dq_ans;
	}

	public void setDq_ans(String dq_ans) {
		this.dq_ans = dq_ans;
	}

	public Date getDq_ans_date() {
		return dq_ans_date;
	}

	public void setDq_ans_date(Date dq_ans_date) {
		this.dq_ans_date = dq_ans_date;
	}
	

}
