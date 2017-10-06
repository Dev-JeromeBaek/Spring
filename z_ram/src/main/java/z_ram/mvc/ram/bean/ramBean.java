package z_ram.mvc.ram.bean;

import org.apache.ibatis.type.Alias;

@Alias("ram")
public class ramBean {
	
	private String filesPath = "/ram/resources/files";
	
	private Integer num;
	private String name;
	private Integer price;
	private String expl;
	private String orgName;
	private String sysName;
	
	public ramBean() {
		super();
	}

	public ramBean(String name, Integer price, String expl) {
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

	public String getOrgName() {
		return orgName;
	}

	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}

	public String getSysName() {
		return sysName;
	}

	public void setSysName(String sysName) {
		this.sysName = sysName;
	}

}// (Bean) class END
