package spring.mvc.aaa.bean;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("excorp")
public class CorpBean {
	
	private Integer c_num;
	private String c_bn;
	private String c_pw;
	private String c_name;
	private String c_ceo;
	private String c_tel;
	private String c_phone;
	private String c_addr;
	private Integer c_grade;
	private Integer c_dealcount;
	private Integer c_sellingprice;
	private Date c_date;
	private String c_string_date;
	
	public CorpBean() {
		
	}

	public CorpBean(Integer c_num, String c_bn, String c_pw, String c_name, String c_ceo, String c_tel, String c_phone,
			String c_addr, Integer c_grade, Integer c_dealcount, Integer c_sellingprice, Date c_date) {
		this.c_num = c_num;
		this.c_bn = c_bn;
		this.c_pw = c_pw;
		this.c_name = c_name;
		this.c_ceo = c_ceo;
		this.c_tel = c_tel;
		this.c_phone = c_phone;
		this.c_addr = c_addr;
		this.c_grade = c_grade;
		this.c_dealcount = c_dealcount;
		this.c_sellingprice = c_sellingprice;
		this.c_date = c_date;
	}

	public Integer getC_num() {
		return c_num;
	}

	public void setC_num(Integer c_num) {
		this.c_num = c_num;
	}

	public String getC_bn() {
		return c_bn;
	}

	public void setC_bn(String c_bn) {
		this.c_bn = c_bn;
	}

	public String getC_pw() {
		return c_pw;
	}

	public void setC_pw(String c_pw) {
		this.c_pw = c_pw;
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

	public String getC_tel() {
		return c_tel;
	}

	public void setC_tel(String c_tel) {
		this.c_tel = c_tel;
	}

	public String getC_phone() {
		return c_phone;
	}

	public void setC_phone(String c_phone) {
		this.c_phone = c_phone;
	}

	public String getC_addr() {
		return c_addr;
	}

	public void setC_addr(String c_addr) {
		this.c_addr = c_addr;
	}

	public Integer getC_grade() {
		return c_grade;
	}

	public void setC_grade(Integer c_grade) {
		this.c_grade = c_grade;
	}

	public Integer getC_dealcount() {
		return c_dealcount;
	}

	public void setC_dealcount(Integer c_dealcount) {
		this.c_dealcount = c_dealcount;
	}

	public Integer getC_sellingprice() {
		return c_sellingprice;
	}

	public void setC_sellingprice(Integer c_sellingprice) {
		this.c_sellingprice = c_sellingprice;
	}

	public Date getC_date() {
		return c_date;
	}

	public void setC_date(Date c_date) {
		this.c_date = c_date;
		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
		setC_string_date(sdf.format(c_date));
	}

	public String getC_string_date() {
		return c_string_date;
	}

	public void setC_string_date(String c_string_date) {
		this.c_string_date = c_string_date;
	}
	
	
}
