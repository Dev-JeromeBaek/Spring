package spring.mvc.aaa.bean;

import org.apache.ibatis.type.Alias;

@Alias("buyDetail")
public class BuyDetailBean {
	
	private Integer bd_num;
	private Integer bd_b_num;
	private Integer bd_dd_num;
	private String bd_dd_name;
	private Integer bd_dd_price;
	private Integer bd_dd_amount;
	
	public BuyDetailBean() {
		
	}

	public BuyDetailBean(Integer bd_dd_num, String bd_dd_name, Integer bd_dd_price, Integer bd_dd_amount) {
		this.bd_dd_num = bd_dd_num;
		this.bd_dd_name = bd_dd_name;
		this.bd_dd_price = bd_dd_price;
		this.bd_dd_amount = bd_dd_amount;
	}

	public BuyDetailBean(Integer bd_num, Integer bd_b_num, Integer bd_dd_num, String bd_dd_name, Integer bd_dd_price,
			Integer bd_dd_amount) {
		this.bd_num = bd_num;
		this.bd_b_num = bd_b_num;
		this.bd_dd_num = bd_dd_num;
		this.bd_dd_name = bd_dd_name;
		this.bd_dd_price = bd_dd_price;
		this.bd_dd_amount = bd_dd_amount;
	}

	public Integer getBd_num() {
		return bd_num;
	}

	public void setBd_num(Integer bd_num) {
		this.bd_num = bd_num;
	}

	public Integer getBd_b_num() {
		return bd_b_num;
	}

	public void setBd_b_num(Integer bd_b_num) {
		this.bd_b_num = bd_b_num;
	}

	public Integer getBd_dd_num() {
		return bd_dd_num;
	}

	public void setBd_dd_num(Integer bd_dd_num) {
		this.bd_dd_num = bd_dd_num;
	}

	public String getBd_dd_name() {
		return bd_dd_name;
	}

	public void setBd_dd_name(String bd_dd_name) {
		this.bd_dd_name = bd_dd_name;
	}

	public Integer getBd_dd_price() {
		return bd_dd_price;
	}

	public void setBd_dd_price(Integer bd_dd_price) {
		this.bd_dd_price = bd_dd_price;
	}

	public Integer getBd_dd_amount() {
		return bd_dd_amount;
	}

	public void setBd_dd_amount(Integer bd_dd_amount) {
		this.bd_dd_amount = bd_dd_amount;
	}
	
}
