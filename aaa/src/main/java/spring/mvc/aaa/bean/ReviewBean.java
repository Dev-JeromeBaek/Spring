package spring.mvc.aaa.bean;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("review")
public class ReviewBean {
	private Integer dr_num;
	private String dr_title;
	private String dr_title_sub;
	private String dr_content;
	private String dr_content_sub;
	private Integer dr_score;
	private Integer dr_di_num;
	private Integer dr_m_num;
	private Date dr_date;
	private String dr_date_string;
	
	public ReviewBean() {
	}
	public String getDr_title_sub() {
		return dr_title_sub;
	}
	public void setDr_title_sub(String dr_title_sub) {
		this.dr_title_sub = dr_title_sub;
	}
	public String getDr_content_sub() {
		return dr_content_sub;
	}
	public void setDr_content_sub(String dr_content_sub) {
		this.dr_content_sub = dr_content_sub;
	}
	public String getDr_content() {
		return dr_content;
	}
	public void setDr_content(String dr_content) {
		this.dr_content = dr_content;
	}
	public Integer getDr_num() {
		return dr_num;
	}
	public void setDr_num(Integer dr_num) {
		this.dr_num = dr_num;
	}
	public String getDr_title() {
		return dr_title;
	}
	public void setDr_title(String dr_title) {
		this.dr_title = dr_title;
	}
	
	public Integer getDr_score() {
		return dr_score;
	}
	public void setDr_score(Integer dr_score) {
		this.dr_score = dr_score;
	}
	public Integer getDr_di_num() {
		return dr_di_num;
	}
	public void setDr_di_num(Integer dr_di_num) {
		this.dr_di_num = dr_di_num;
	}
	public Integer getDr_m_num() {
		return dr_m_num;
	}
	public void setDr_m_num(Integer dr_m_num) {
		this.dr_m_num = dr_m_num;
	}
	public Date getDr_date() {
		return dr_date;
	}
	public void setDr_date(Date dr_date) {
		this.dr_date = dr_date;
		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
		setDr_date_string(sdf.format(dr_date));
	}

	public String getDr_date_string() {
		return dr_date_string;
	}
	public void setDr_date_string(String dr_date_string) {
		this.dr_date_string = dr_date_string;
	}
	
	public ReviewBean(Integer dr_num, String dr_title, String dr_title_sub, String dr_content, String dr_content_sub,
			Integer dr_score, Integer dr_di_num, Integer dr_m_num, Date dr_date, String dr_date_string) {
		super();
		this.dr_num = dr_num;
		this.dr_title = dr_title;
		this.dr_title_sub = dr_title_sub;
		this.dr_content = dr_content;
		this.dr_content_sub = dr_content_sub;
		this.dr_score = dr_score;
		this.dr_di_num = dr_di_num;
		this.dr_m_num = dr_m_num;
		this.dr_date = dr_date;
		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
		this.dr_date_string = sdf.format(dr_date);
	}
	
	public ReviewBean(String dr_title, String dr_content, Integer dr_score, Integer dr_di_num, Integer dr_m_num) {
		super();
		this.dr_title = dr_title;
		this.dr_content = dr_content;
		this.dr_score = dr_score;
		this.dr_di_num = dr_di_num;
		this.dr_m_num = dr_m_num;
	}
	
	
	
	
}
