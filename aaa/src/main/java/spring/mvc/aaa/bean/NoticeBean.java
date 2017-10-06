package spring.mvc.aaa.bean;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("notice")
public class NoticeBean {
	
	private Integer notice_num;
	private String notice_writer;
	private String notice_title;
	private String notice_content;
	private Date notice_date;
	private String notice_fordate;
	
	public String getNotice_fordate() {
		return notice_fordate;
	}

	public void setNotice_fordate(String notice_fordate) {
		this.notice_fordate = notice_fordate;
	}

	public NoticeBean() {
		// TODO Auto-generated constructor stub
	}
	
	public NoticeBean(String notice_writer, String notice_title, String notice_content) {
		super();
		this.notice_writer = notice_writer;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
	}
	public Integer getNotice_num() {
		return notice_num;
	}
	public void setNotice_num(Integer notice_num) {
		this.notice_num = notice_num;
	}
	public String getNotice_writer() {
		return notice_writer;
	}
	public void setNotice_writer(String notice_writer) {
		this.notice_writer = notice_writer;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public Date getNotice_date() {
		return notice_date;
	}
	public void setNotice_date(Date notice_date) {
		this.notice_date = notice_date;
	}
	
	
}
