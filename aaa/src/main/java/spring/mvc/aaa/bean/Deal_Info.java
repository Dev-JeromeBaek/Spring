package spring.mvc.aaa.bean;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("info")
public class Deal_Info {

	private Integer di_num;
	private String di_name;
	private String di_category;
	private String di_orgName;
	private String di_sysName;
	private String di_exp;
	private String di_exp_sub;
	private String di_approve;
	private Integer di_c_num;
	private Integer di_price;
	private Date di_date;
	private String di_date_string;
	
	@Override
	public String toString() {
		return "Deal_Info [di_num=" + di_num + ", di_name=" + di_name + ", di_category=" + di_category + ", di_orgName="
				+ di_orgName + ", di_sysName=" + di_sysName + ", di_exp=" + di_exp + ", di_exp_sub=" + di_exp_sub
				+ ", di_approve=" + di_approve + ", di_c_num=" + di_c_num + ", di_price=" + di_price + ", di_date="
				+ di_date + ", di_date_string=" + di_date_string + "]";
	}

	public Deal_Info(String di_name, String di_category, String di_orgName, String di_sysName, String di_exp,
			Integer di_c_num, String di_approve, Integer di_price) {
		this.di_name = di_name;
		this.di_category = di_category;
		this.di_orgName = di_orgName;
		this.di_sysName = di_sysName;
		this.di_exp = di_exp;
		this.di_c_num = di_c_num;
		this.di_approve = di_approve;
		this.di_price = di_price;
	}
	
	public Deal_Info(String di_name, String di_category, String di_orgName, String di_sysName, String di_exp,
			Integer di_c_num, Integer di_price) {
		this.di_name = di_name;
		this.di_category = di_category;
		this.di_orgName = di_orgName;
		this.di_sysName = di_sysName;
		this.di_exp = di_exp;
		this.di_c_num = di_c_num;
		this.di_price = di_price;
	}

	public Deal_Info( String di_name, String di_category, String di_orgName, String di_sysName,
			String di_exp, Integer di_c_num) {
		this.di_name = di_name;
		this.di_category = di_category;
		this.di_orgName = di_orgName;
		this.di_sysName = di_sysName;
		this.di_exp = di_exp;
		this.di_c_num = di_c_num;
	}

	public Deal_Info() {
		// TODO Auto-generated constructor stub
	}

	public Deal_Info(Integer di_num, String di_name, String di_category, String di_orgName, String di_sysName,
			String di_exp, String di_exp_sub, String di_approve, Integer di_c_num, Date di_date) {
		this.di_num = di_num;
		this.di_name = di_name;
		this.di_category = di_category;
		this.di_orgName = di_orgName;
		this.di_sysName = di_sysName;
		this.di_exp = di_exp;
		this.di_exp_sub = di_exp_sub;
		this.di_approve = di_approve;
		this.di_c_num = di_c_num;
		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
		this.di_date_string = sdf.format(di_date);
	}

	public Integer getDi_num() {
		return di_num;
	}

	public void setDi_num(Integer di_num) {
		this.di_num = di_num;
	}

	public String getDi_name() {
		return di_name;
	}

	public void setDi_name(String di_name) {
		this.di_name = di_name;
	}

	public String getDi_category() {
		return di_category;
	}

	public void setDi_category(String di_category) {
		this.di_category = di_category;
	}

	public String getDi_orgName() {
		return di_orgName;
	}

	public void setDi_orgName(String di_orgName) {
		this.di_orgName = di_orgName;
	}

	public String getDi_sysName() {
		return di_sysName;
	}

	public void setDi_sysName(String di_sysName) {
		this.di_sysName = di_sysName;
	}

	public String getDi_exp() {
		return di_exp;
	}

	public void setDi_exp(String di_exp) {
		this.di_exp = di_exp;
	}

	public String getDi_approve() {
		return di_approve;
	}

	public void setDi_approve(String di_approve) {
		this.di_approve = di_approve;
	}

	public Integer getDi_c_num() {
		return di_c_num;
	}

	public void setDi_c_num(Integer di_c_num) {
		this.di_c_num = di_c_num;
	}

	public Date getDi_date() {
		return di_date;
	}

	public void setDi_date(Date di_date) {
		this.di_date = di_date;
		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
		setDi_date_string(sdf.format(di_date));
	}

	public String getDi_date_string() {
		return di_date_string;
	}

	public void setDi_date_string(String di_date_string) {
		this.di_date_string = di_date_string;
	}

	public Integer getDi_price() {
		return di_price;
	}

	public void setDi_price(Integer di_price) {
		this.di_price = di_price;
	}

	public String getDi_exp_sub() {
		return di_exp_sub;
	}

	public void setDi_exp_sub(String di_exp_sub) {
		this.di_exp_sub = di_exp_sub;
	}
	
	
	
	

}
