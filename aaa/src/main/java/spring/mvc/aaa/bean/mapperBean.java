package spring.mvc.aaa.bean;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("mapper")
public class mapperBean {
	
	private String str1;
	private String str2;
	private String str3;
	private String str4;
	private String str5;
	private String str6;
	private Integer	inte1;
	private Integer	inte2;
	private Integer	inte3;
	private Double doub1;
	private Double doub2;
	private Double doub3;
	private Date date1;
	
	public mapperBean() {
	}

	public mapperBean(String str1, String str2, String str3, String str4, String str5, String str6, Integer inte1, Integer inte2, Integer inte3,
			Double doub1, Double doub2, Double doub3, Date date1) {
		super();
		this.str1 = str1;
		this.str2 = str2;
		this.str3 = str3;
		this.str4 = str4;
		this.str5 = str5;
		this.str6 = str6;
		this.inte1 = inte1;
		this.inte2 = inte2;
		this.inte3 = inte3;
		this.doub1 = doub1;
		this.doub2 = doub2;
		this.doub3 = doub3;
		this.date1 = date1;
	}

	public String getStr1() {
		return str1;
	}

	public void setStr1(String str1) {
		this.str1 = str1;
	}

	public String getStr2() {
		return str2;
	}

	public void setStr2(String str2) {
		this.str2 = str2;
	}

	public String getStr3() {
		return str3;
	}

	public void setStr3(String str3) {
		this.str3 = str3;
	}

	public String getStr4() {
		return str4;
	}

	public void setStr4(String str4) {
		this.str4 = str4;
	}

	public String getStr5() {
		return str5;
	}

	public void setStr5(String str5) {
		this.str5 = str5;
	}

	public String getStr6() {
		return str6;
	}

	public void setStr6(String str6) {
		this.str6 = str6;
	}

	public Integer getInte1() {
		return inte1;
	}

	public void setInte1(Integer inte1) {
		this.inte1 = inte1;
	}

	public Integer getInte2() {
		return inte2;
	}

	public void setInte2(Integer inte2) {
		this.inte2 = inte2;
	}

	public Integer getInte3() {
		return inte3;
	}

	public void setInte3(Integer inte3) {
		this.inte3 = inte3;
	}

	public Double getDoub1() {
		return doub1;
	}

	public void setDoub1(Double doub1) {
		this.doub1 = doub1;
	}

	public Double getDoub2() {
		return doub2;
	}

	public void setDoub2(Double doub2) {
		this.doub2 = doub2;
	}

	public Double getDoub3() {
		return doub3;
	}

	public void setDoub3(Double doub3) {
		this.doub3 = doub3;
	}

	public Date getDate1() {
		return date1;
	}

	public void setDate1(Date date1) {
		this.date1 = date1;
	}
	
}
