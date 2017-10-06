package spring.mvc.aaa.bean;

import org.apache.ibatis.type.Alias;

@Alias("local")
public class LocalBean {

	private String di_name;//
	private String di_exp;//
	private String di_orgName;//
	private String di_sysName;//
	private Integer dd_price;
	public LocalBean(String di_name, String di_exp, String di_orgName, String di_sysName, Integer dd_price) {
		this.di_name = di_name;
		this.di_exp = di_exp;
		this.di_orgName = di_orgName;
		this.di_sysName = di_sysName;
		this.dd_price = dd_price;
	}
	public String getDi_name() {
		return di_name;
	}
	public void setDi_name(String di_name) {
		this.di_name = di_name;
	}
	public String getDi_exp() {
		return di_exp;
	}
	public void setDi_exp(String di_exp) {
		this.di_exp = di_exp;
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
	public Integer getDd_price() {
		return dd_price;
	}
	public void setDd_price(Integer dd_price) {
		this.dd_price = dd_price;
	}

	public LocalBean() {
		// TODO Auto-generated constructor stub
	}
	
}
