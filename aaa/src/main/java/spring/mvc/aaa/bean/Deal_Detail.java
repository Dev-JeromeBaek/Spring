package spring.mvc.aaa.bean;

import org.apache.ibatis.type.Alias;

@Alias("detail")
public class Deal_Detail {
	
	@Override
	public String toString() {
		return "Deal_Detail [dd_num=" + dd_num + ", dd_name=" + dd_name + ", dd_kind=" + dd_kind + ", dd_price="
				+ dd_price + ", dd_amount=" + dd_amount + ", dd_di_num=" + dd_di_num + "]";
	}

	private  Integer dd_num;
	private String dd_name;
	private String dd_kind;
	private Integer dd_price;
	private Integer dd_amount;
	private Integer dd_di_num;
	
	public Deal_Detail(String dd_name, String dd_kind, Integer dd_price, Integer dd_amount, Integer dd_di_num) {
		super();
		this.dd_name = dd_name;
		this.dd_kind = dd_kind;
		this.dd_price = dd_price;
		this.dd_amount = dd_amount;
		this.dd_di_num = dd_di_num;
	}

	public Integer getDd_num() {
		return dd_num;
	}

	public void setDd_num(Integer dd_num) {
		this.dd_num = dd_num;
	}

	public String getDd_name() {
		return dd_name;
	}

	public void setDd_name(String dd_name) {
		this.dd_name = dd_name;
	}

	public String getDd_kind() {
		return dd_kind;
	}

	public void setDd_kind(String dd_kind) {
		this.dd_kind = dd_kind;
	}

	public Integer getDd_price() {
		return dd_price;
	}

	public void setDd_price(Integer dd_price) {
		this.dd_price = dd_price;
	}

	public Integer getDd_amount() {
		return dd_amount;
	}

	public void setDd_amount(Integer dd_amount) {
		this.dd_amount = dd_amount;
	}

	public Integer getDd_di_num() {
		return dd_di_num;
	}

	public void setDd_di_num(Integer dd_di_num) {
		this.dd_di_num = dd_di_num;
	}
	
	public Deal_Detail() {
		// TODO Auto-generated constructor stub
	}
}
