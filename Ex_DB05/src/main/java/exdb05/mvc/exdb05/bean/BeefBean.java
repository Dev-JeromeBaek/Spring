package exdb05.mvc.exdb05.bean;

public class BeefBean {

	private Integer num;
	private String name;
	private Integer price;
	private String used;
	
	
	public BeefBean() {
		
	}
	
	
	
	public BeefBean(Integer num, String name, Integer price, String used) {
		super();
		this.num = num;
		this.name = name;
		this.price = price;
		this.used = used;
	}



	public BeefBean(String name, Integer price, String used) {
		super();
		this.name = name;
		this.price = price;
		this.used = used;
	}
	
	public BeefBean(Integer price, String used) {
		super();
		this.price = price;
		this.used = used;
	}

	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public String getUsed() {
		return used;
	}
	public void setUsed(String used) {
		this.used = used;
	}
	
}// (Bean) class END
