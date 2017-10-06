package spring.mvc.aaa.bean;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("buy")
public class BuyBean {
	
	private Integer b_num;
	private Integer b_m_num;
	private Integer b_c_num;
	private Integer b_di_num;
	private String b_di_name;
	private Integer b_price;
	private Integer b_discount;
	private String b_status;
	private Date b_date;
	private String b_date_string;
	private Date b_final_date;
	private String b_final_date_string;
	
	public BuyBean() {
		
	}
	
	public BuyBean(Integer b_m_num, Integer b_c_num,Integer b_di_num, String b_di_name, Integer b_price, Integer b_discount,
			String b_status,Date b_final_date) {
		super();
		this.b_m_num = b_m_num;
		this.b_c_num = b_c_num;
		this.b_di_num = b_di_num;
		this.b_di_name = b_di_name;
		this.b_price = b_price;
		this.b_discount = b_discount;
		this.b_status = b_status;
		this.b_final_date = b_final_date;
	}
	
	@Override
	public String toString() {
		return "BuyBean [b_num=" + b_num + ", b_m_num=" + b_m_num + ", b_c_num=" + b_c_num + ", b_di_num=" + b_di_num
				+ ", b_di_name=" + b_di_name + ", b_price=" + b_price + ", b_discount=" + b_discount + ", b_status="
				+ b_status + ", b_date=" + b_date + ", b_date_string=" + b_date_string + ", b_final_date="
				+ b_final_date + "]";
	}

	public BuyBean(Integer b_m_num, Integer b_c_num,Integer b_di_num, String b_di_name, Integer b_price, Integer b_discount,
			String b_status) {
		super();
		this.b_m_num = b_m_num;
		this.b_c_num = b_c_num;
		this.b_di_num = b_di_num;
		this.b_di_name = b_di_name;
		this.b_price = b_price;
		this.b_discount = b_discount;
		this.b_status = b_status;
	}
	
	public BuyBean(Integer b_num, Integer b_m_num, Integer b_c_num, Integer b_di_num, String b_di_name, Integer b_price,
			Integer b_discount, String b_status, Date b_date, String b_date_string, Date b_final_date, String b_final_date_string) {
		super();
		this.b_num = b_num;
		this.b_m_num = b_m_num;
		this.b_c_num = b_c_num;
		this.b_di_num = b_di_num;
		this.b_di_name = b_di_name;
		this.b_price = b_price;
		this.b_discount = b_discount;
		this.b_status = b_status;
		this.b_date = b_date;
		this.b_final_date = b_final_date;
		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
		this.b_date_string = sdf.format(b_date);
		this.b_final_date_string = sdf.format(b_final_date);
	}
	
	
	
	public Integer getB_num() {
		return b_num;
	}

	public void setB_num(Integer b_num) {
		this.b_num = b_num;
	}

	public Integer getB_m_num() {
		return b_m_num;
	}

	public void setB_m_num(Integer b_m_num) {
		this.b_m_num = b_m_num;
	}

	public Integer getB_c_num() {
		return b_c_num;
	}

	public void setB_c_num(Integer b_c_num) {
		this.b_c_num = b_c_num;
	}

	public Integer getB_di_num() {
		return b_di_num;
	}

	public void setB_di_num(Integer b_di_num) {
		this.b_di_num = b_di_num;
	}

	public String getB_di_name() {
		return b_di_name;
	}

	public void setB_di_name(String b_di_name) {
		this.b_di_name = b_di_name;
	}

	public Integer getB_price() {
		return b_price;
	}

	public void setB_price(Integer b_price) {
		this.b_price = b_price;
	}

	public Integer getB_discount() {
		return b_discount;
	}

	public void setB_discount(Integer b_discount) {
		this.b_discount = b_discount;
	}

	public String getB_status() {
		return b_status;
	}

	public void setB_status(String b_status) {
		this.b_status = b_status;
	}

	public Date getB_date() {
		return b_date;
	}

	public void setB_date(Date b_date) {
		this.b_date = b_date;
		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
		setB_date_string(sdf.format(b_date));
	}

	public String getB_date_string() {
		return b_date_string;
	}

	public void setB_date_string(String b_date_string) {
		this.b_date_string = b_date_string;
	}

	public Date getB_final_date() {
		return b_final_date;
	}

	public void setB_final_date(Date b_final_date) {
		this.b_final_date = b_final_date;
		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
		setB_final_date_string(sdf.format(b_final_date));
	}

	public String getB_final_date_string() {
		return b_final_date_string;
	}

	public void setB_final_date_string(String b_final_date_string) {
		this.b_final_date_string = b_final_date_string;
	}
	
	
	
}
