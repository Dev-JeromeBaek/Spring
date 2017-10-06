package p01_makeBean;

public class J03_Student {

	private String name;
	private int kor, eng, math, total;
	private double avg;
	
	public J03_Student() {
		// TODO Auto-generated constructor stub
	}
	
//	public J03_Student(String name, int kor, int eng, int math) {
//		super();
//		this.name = name;
//		this.kor = kor;
//		this.eng = eng;
//		this.math = math;
//		cal_Total(kor, eng, math);
//		cal_Avg(this.total);
//	}
	
	public void cal_Total(int kor, int eng, int math) {
		this.total = kor + eng + math;
	}
	
	public void cal_Avg(int total) {
		this.avg = total / 3.0;
	}
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getKor() {
		return kor;
	}
	public void setKor(int kor) {
		this.kor = kor;
	}
	public int getEng() {
		return eng;
	}
	public void setEng(int eng) {
		this.eng = eng;
	}
	public int getMath() {
		return math;
	}
	public void setMath(int math) {
		this.math = math;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public double getAvg() {
		return avg;
	}
	public void setAvg(double avg) {
		this.avg = avg;
	}
	
	
	
}// class END
