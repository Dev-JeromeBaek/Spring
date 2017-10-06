package spring.mvc.aaa.bean;

import org.apache.ibatis.type.Alias;

@Alias("cart")
public class CartBean {
	
	private Integer cart_num;
	private Integer cart_di_num;
	private Integer cart_dd_num;
	private Integer cart_amount;
	private Integer cart_price;
	private Integer cart_m_num;
	
	public CartBean(Integer cart_di_num, Integer cart_dd_num, Integer cart_amount, Integer cart_price,
			Integer cart_m_num) {
		super();
		this.cart_di_num = cart_di_num;
		this.cart_dd_num = cart_dd_num;
		this.cart_amount = cart_amount;
		this.cart_price = cart_price;
		this.cart_m_num = cart_m_num;
	}

	public CartBean() {
		// TODO Auto-generated constructor stub
	}

	public CartBean(Integer cart_di_num, Integer cart_dd_num, Integer cart_amount, Integer cart_price) {
		this.cart_di_num = cart_di_num;
		this.cart_dd_num = cart_dd_num;
		this.cart_amount = cart_amount;
		this.cart_price = cart_price;
	}

	public Integer getCart_num() {
		return cart_num;
	}

	public void setCart_num(Integer cart_num) {
		this.cart_num = cart_num;
	}

	public Integer getCart_di_num() {
		return cart_di_num;
	}

	public void setCart_di_num(Integer cart_di_num) {
		this.cart_di_num = cart_di_num;
	}

	public Integer getCart_dd_num() {
		return cart_dd_num;
	}

	public void setCart_dd_num(Integer cart_dd_num) {
		this.cart_dd_num = cart_dd_num;
	}

	public Integer getCart_amount() {
		return cart_amount;
	}

	public void setCart_amount(Integer cart_amount) {
		this.cart_amount = cart_amount;
	}

	public Integer getCart_price() {
		return cart_price;
	}

	public void setCart_price(Integer cart_price) {
		this.cart_price = cart_price;
	}

	public Integer getCart_m_num() {
		return cart_m_num;
	}

	public void setCart_m_num(Integer cart_m_num) {
		this.cart_m_num = cart_m_num;
	}
	
	

}
