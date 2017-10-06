package spring.mvc.aaa.bean;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.type.Alias;

@Alias("manage")
public class ManageBean {
	private Integer ma_b_num;				// 구매 번호
	private String ma_m_name;				// 구매자 이름
	private String ma_di_category;			// 상폼 종류
	private String ma_di_name;				// 상품 이름
	private List<BuyDetailBean> buyDetail;	// 상세 이름, 상세 수량
	private Integer ma_b_price;
	private Date ma_b_date;
	private String ma_b_date_string;
	private Integer ma_di_num;
	
	public ManageBean() {
		
	}
	
	public ManageBean(Integer ma_b_num, String ma_m_name, String ma_di_category, String ma_di_name,
			List<BuyDetailBean> buyDetail, Integer ma_b_price, Date ma_b_date, String ma_b_date_string, Integer ma_di_num) {
		super();
		this.ma_b_num = ma_b_num;
		this.ma_m_name = ma_m_name;
		this.ma_di_category = ma_di_category;
		this.ma_di_name = ma_di_name;
		this.buyDetail = buyDetail;
		this.ma_b_price = ma_b_price;
		this.ma_b_date = ma_b_date;
		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
		this.ma_b_date_string = sdf.format(ma_b_date);
		this.ma_di_num = ma_di_num;
	}
	
	public Integer getMa_b_num() {
		return ma_b_num;
	}
	public void setMa_b_num(Integer ma_b_num) {
		this.ma_b_num = ma_b_num;
	}
	public String getMa_m_name() {
		return ma_m_name;
	}
	public void setMa_m_name(String ma_m_name) {
		this.ma_m_name = ma_m_name;
	}
	public String getMa_di_category() {
		return ma_di_category;
	}
	public void setMa_di_category(String ma_di_category) {
		this.ma_di_category = ma_di_category;
	}
	public String getMa_di_name() {
		return ma_di_name;
	}
	public void setMa_di_name(String ma_di_name) {
		this.ma_di_name = ma_di_name;
	}
	public List<BuyDetailBean> getBuyDetail() {
		return buyDetail;
	}
	public void setBuyDetail(List<BuyDetailBean> buyDetail) {
		this.buyDetail = buyDetail;
	}
	public Integer getMa_b_price() {
		return ma_b_price;
	}
	public void setMa_b_price(Integer ma_b_price) {
		this.ma_b_price = ma_b_price;
	}
	public Date getMa_b_date() {
		return ma_b_date;
	}
	public void setMa_b_date(Date ma_b_date) {
		this.ma_b_date = ma_b_date;
		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
		this.ma_b_date_string = sdf.format(ma_b_date);
	}
	public String getMa_b_date_string() {
		return ma_b_date_string;
	}
	public void setMa_b_date_string(String ma_b_date_string) {
		this.ma_b_date_string = ma_b_date_string;
	}

	public Integer getMa_di_num() {
		return ma_di_num;
	}

	public void setMa_di_num(Integer ma_di_num) {
		this.ma_di_num = ma_di_num;
	}
	
	
	
}
