package spring.mvc.spring13.bean;

public class PeopleBean {
							// /spring13/ : webapp/
	private String filesPath = "/spring13/resources/files";
	
	private Integer num;
	private String name;
	private Integer age;
	private String sysName;
	private String orgName;
	
	
	public PeopleBean() {
		
	}

	
	public PeopleBean(String name, Integer age) {
		this.name = name;
		this.age = age;
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
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
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
	
}// (Bean) class END
