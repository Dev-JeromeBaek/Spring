package exmybatis.mvc.exmybatis01.bean;

import org.apache.ibatis.type.Alias;

@Alias("ram")
public class RamBean {
	
	private String filesPath = "/exmybatis01/resources/files";
	
	private Integer num;
	private String name;
	private Integer price;
	private String expl;
	private String sysName;
	private String orgName;
	
	public RamBean() {
		
	}

	public RamBean(String name, Integer price, String expl) {
		this.name = name;
		this.price = price;
		this.expl = expl;
	}

	
	
	public String getFilesPath() {
		return filesPath;
	}

	public void setFilesPath(String filesPath) {
		this.filesPath = filesPath;
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

	public String getSysName() {
		return sysName;
	}

	public void setSysName(String sysName) {
		this.sysName = sysName;
	}

	public String getOrgName() {
		return orgName;
	}

	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}
	
}
