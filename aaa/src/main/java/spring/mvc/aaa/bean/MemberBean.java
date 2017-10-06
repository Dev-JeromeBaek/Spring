package spring.mvc.aaa.bean;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("mem")
public class MemberBean {
	
//	파일패스 적어줘....
	
	private Integer m_num;
	private String m_id;
	private String m_pw;
	private String m_name;
	private String m_addr;
	private String m_phone;
	private String m_gender;
	private String m_ox;
	private String m_memo;
	private Integer m_grade;
	private Integer m_point;
	private Integer m_logcount;
	private Date m_date;
	
	private String m_phone1;
	private String m_phone2;
	private String m_phone3;
	private String m_fordate;
	private String m_pwCheck;
	
	
	
	
	public MemberBean(String m_id, String m_pw, String m_name, String m_addr, String m_phone, String m_gender) {
		super();
		this.m_id = m_id;
		this.m_pw = m_pw;
		this.m_name = m_name;
		this.m_addr = m_addr;
		this.m_phone = m_phone;
		this.m_gender = m_gender;
	}
	public MemberBean() {
	}
	
	public MemberBean(Integer m_num, Integer m_point) {
		this.m_num = m_num;
		this.m_point = m_point;
	}
	
	
	
	
	public MemberBean(Integer m_num) {
		this.m_num = m_num;
	}
	public Integer getM_num() {
		return m_num;
	}
	public void setM_num(Integer m_num) {
		this.m_num = m_num;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_pw() {
		return m_pw;
	}
	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_addr() {
		return m_addr;
	}
	public void setM_addr(String m_addr) {
		this.m_addr = m_addr;
	}
	public String getM_phone() {
		return m_phone;
	}
	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}
	public String getM_gender() {
		return m_gender;
	}
	public void setM_gender(String m_gender) {
		this.m_gender = m_gender;
	}
	public String getM_ox() {
		return m_ox;
	}
	public void setM_ox(String m_ox) {
		this.m_ox = m_ox;
	}
	public String getM_memo() {
		return m_memo;
	}
	public void setM_memo(String m_memo) {
		this.m_memo = m_memo;
	}
	public Integer getM_grade() {
		return m_grade;
	}
	public void setM_grade(Integer m_grade) {
		this.m_grade = m_grade;
	}
	public Integer getM_point() {
		return m_point;
	}
	public void setM_point(Integer m_point) {
		this.m_point = m_point;
	}
	public Integer getM_logcount() {
		return m_logcount;
	}
	public void setM_logcount(Integer m_logcount) {
		this.m_logcount = m_logcount;
	}
	public Date getM_date() {
		return m_date;
	}
	public void setM_date(Date m_date) {
		this.m_date = m_date;
	}
	public String getM_phone1() {
		return m_phone1;
	}
	public void setM_phone1(String m_phone1) {
		this.m_phone1 = m_phone1;
	}
	public String getM_phone2() {
		return m_phone2;
	}
	public void setM_phone2(String m_phone2) {
		this.m_phone2 = m_phone2;
	}
	public String getM_phone3() {
		return m_phone3;
	}
	public void setM_phone3(String m_phone3) {
		this.m_phone3 = m_phone3;
	}
	public String getM_fordate() {
		return m_fordate;
	}
	public void setM_fordate(String m_fordate) {
		this.m_fordate = m_fordate;
	}
	public String getM_pwCheck() {
		return m_pwCheck;
	}
	public void setM_pwCheck(String m_pwCheck) {
		this.m_pwCheck = m_pwCheck;
	}
	
	
	

}
