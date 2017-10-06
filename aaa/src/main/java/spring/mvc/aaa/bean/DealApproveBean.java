package spring.mvc.aaa.bean;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("approve")
public class DealApproveBean {
	
	private Integer di_num;
	private String c_name;
	private String c_ceo;
	private String di_category;
	private String di_exp_sub;
	private Date di_date;
	private String di_string_date;
	
	public DealApproveBean() {
		super();
	}

	public DealApproveBean(Integer di_num, String c_name, String c_ceo, String di_category, String di_exp_sub,
			Date di_date) {
		this.di_num = di_num;
		this.c_name = c_name;
		this.c_ceo = c_ceo;
		this.di_category = di_category;
		this.di_exp_sub = di_exp_sub;
		this.di_date = di_date;
//		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
//		this.di_date = sdf.format(date);
	}

	public Integer getDi_num() {
		return di_num;
	}

	public void setDi_num(Integer di_num) {
		this.di_num = di_num;
	}

	public String getC_name() {
		return c_name;
	}

	public void setC_name(String c_name) {
		this.c_name = c_name;
	}

	public String getC_ceo() {
		return c_ceo;
	}

	public void setC_ceo(String c_ceo) {
		this.c_ceo = c_ceo;
	}

	public String getDi_category() {
		return di_category;
	}

	public void setDi_category(String di_category) {
		this.di_category = di_category;
	}

	public String getDi_exp_sub() {
		return di_exp_sub;
	}

	public void setDi_exp_sub(String di_exp) {
		this.di_exp_sub = di_exp;
	}

	public Date getDi_date() {
		return di_date;
	}

	public void setDi_date(Date di_date) {
		this.di_date = di_date;
	}

	public String getDi_string_date() {
		return di_string_date;
	}

	public void setDi_string_date(String di_string_date) {
		this.di_string_date = di_string_date;
	}
	
	

	
}
