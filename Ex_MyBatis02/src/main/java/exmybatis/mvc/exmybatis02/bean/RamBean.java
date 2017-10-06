package exmybatis.mvc.exmybatis02.bean;

import org.apache.ibatis.type.Alias;

@Alias("rbean")
public class RamBean {
	
	private Integer num;
	private String name;
	private Integer price;
	private String expl;
	private String orgname;
	private String sysname;
	
	
	public RamBean() {
		
	}
	
	
	public RamBean(String name, Integer price, String expl) {
		super();
		this.name = name;
		this.price = price;
		this.expl = expl;
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


	public String getExpl() {
		return expl;
	}


	public void setExpl(String expl) {
		this.expl = expl;
	}


	public String getOrgname() {
		return orgname;
	}


	public void setOrgname(String orgname) {
		this.orgname = orgname;
	}


	public String getSysname() {
		return sysname;
	}


	public void setSysname(String sysname) {
		this.sysname = sysname;
	}


	
}
