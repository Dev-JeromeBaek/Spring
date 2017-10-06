package spring.mvc.aaa.bean;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("qna")
public class QnaBean {

	private Integer q_num;
	private String q_title;
	private String q_content;
	private String q_select;
	private Integer q_m_num;
	private String q_m_id;
	private Date q_date;
	private String q_ans;
	private Date q_ans_date;
	public QnaBean() {
		// TODO Auto-generated constructor stub
	}
	public QnaBean(String q_title, String q_content, String q_select, Integer q_m_num, String q_m_id) {
		super();
		this.q_title = q_title;
		this.q_content = q_content;
		this.q_select = q_select;
		this.q_m_num = q_m_num;
		this.q_m_id = q_m_id;
	}
	public Integer getQ_num() {
		return q_num;
	}
	public void setQ_num(Integer q_num) {
		this.q_num = q_num;
	}
	public String getQ_title() {
		return q_title;
	}
	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}
	public String getQ_content() {
		return q_content;
	}
	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}
	public String getQ_select() {
		return q_select;
	}
	public void setQ_select(String q_select) {
		this.q_select = q_select;
	}
	public Integer getQ_m_num() {
		return q_m_num;
	}
	public void setQ_m_num(Integer q_m_num) {
		this.q_m_num = q_m_num;
	}
	public String getQ_m_id() {
		return q_m_id;
	}
	public void setQ_m_id(String q_m_id) {
		this.q_m_id = q_m_id;
	}
	public Date getQ_date() {
		return q_date;
	}
	public void setQ_date(Date q_date) {
		this.q_date = q_date;
	}
	public String getQ_ans() {
		return q_ans;
	}
	public void setQ_ans(String q_ans) {
		this.q_ans = q_ans;
	}
	public Date getQ_ans_date() {
		return q_ans_date;
	}
	public void setQ_ans_date(Date q_ans_date) {
		this.q_ans_date = q_ans_date;
	}
	
	
	
}
