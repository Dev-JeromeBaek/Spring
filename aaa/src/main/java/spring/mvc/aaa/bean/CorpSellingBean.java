package spring.mvc.aaa.bean;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.type.Alias;

@Alias("corpSel")
public class CorpSellingBean {
	
	private Integer cs_b_num;
	private String cs_di_category;
	private String cs_di_kind;
	private String cs_di_name;
	private List<BuyDetailBean> buyDetail;
	private String cs_b_status;
	private Integer cs_b_price;
	private Date cs_b_date;
	private String cs_b_date_string;
	private Date cs_final_date;
	private String cs_final_date_string;
	
	public CorpSellingBean() {
		
	}

	public CorpSellingBean(Integer cs_b_num, String cs_di_category, String cs_di_kind, String cs_di_name,
			List<BuyDetailBean> buyDetail, String cs_b_status, Integer cs_b_price, Date cs_b_date,
			Date cs_final_date) {
		this.cs_b_num = cs_b_num;
		this.cs_di_category = cs_di_category;
		this.cs_di_kind = cs_di_kind;
		this.cs_di_name = cs_di_name;
		this.buyDetail = buyDetail;
		this.cs_b_status = cs_b_status;
		this.cs_b_price = cs_b_price;
		this.cs_b_date = cs_b_date;
		this.cs_final_date = cs_final_date;
		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
		this.cs_b_date_string = sdf.format(cs_b_date);
		this.cs_final_date_string = sdf.format(cs_final_date);
	}

	public Integer getCs_b_num() {
		return cs_b_num;
	}

	public void setCs_b_num(Integer cs_b_num) {
		this.cs_b_num = cs_b_num;
	}

	public String getCs_di_category() {
		return cs_di_category;
	}

	public void setCs_di_category(String cs_di_category) {
		this.cs_di_category = cs_di_category;
	}

	public String getCs_di_kind() {
		return cs_di_kind;
	}

	public void setCs_di_kind(String cs_di_kind) {
		this.cs_di_kind = cs_di_kind;
	}

	public String getCs_di_name() {
		return cs_di_name;
	}

	public void setCs_di_name(String cs_di_name) {
		this.cs_di_name = cs_di_name;
	}

	public List<BuyDetailBean> getBuyDetail() {
		return buyDetail;
	}

	public void setBuyDetail(List<BuyDetailBean> buyDetail) {
		this.buyDetail = buyDetail;
	}

	public String getCs_b_status() {
		return cs_b_status;
	}

	public void setCs_b_status(String cs_b_status) {
		this.cs_b_status = cs_b_status;
	}

	public Integer getCs_b_price() {
		return cs_b_price;
	}

	public void setCs_b_price(Integer cs_b_price) {
		this.cs_b_price = cs_b_price;
	}

	public Date getCs_b_date() {
		return cs_b_date;
	}

	public void setCs_b_date(Date cs_b_date) {
		this.cs_b_date = cs_b_date;
		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
		this.cs_b_date_string = sdf.format(cs_b_date);
	}

	public Date getCs_final_date() {
		return cs_final_date;
	}

	public void setCs_final_date(Date cs_final_date) {
		this.cs_final_date = cs_final_date;
		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
		this.cs_final_date_string = sdf.format(cs_final_date);
	}

	public String getCs_b_date_string() {
		return cs_b_date_string;
	}

	public void setCs_b_date_string(String cs_b_date_string) {
		this.cs_b_date_string = cs_b_date_string;
	}

	public String getCs_final_date_string() {
		return cs_final_date_string;
	}

	public void setCs_final_date_string(String cs_final_date_string) {
		this.cs_final_date_string = cs_final_date_string;
	}
	
	
	
}
