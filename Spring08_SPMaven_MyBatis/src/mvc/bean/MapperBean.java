package mvc.bean;

import javax.swing.JOptionPane;

import org.apache.ibatis.type.Alias;

@Alias("mm")
public class MapperBean {
	// 필요하면 MapperBean을 새로 생성해서 여기서 작업해주면 된다!
	
	private int beginAge;
	private int endAge;
	private String tableName;
	private String colName;
	private String searchKey;
	
	public MapperBean() {
		
	}

	public MapperBean(String tableName, String colName, String searchKey) {
		this.tableName = tableName;
		this.colName = colName;
		this.searchKey = searchKey;
	}

	public void setData5() {
		this.beginAge = Integer.parseInt(JOptionPane.showInputDialog("시작 나이 입력"));
		this.endAge = Integer.parseInt(JOptionPane.showInputDialog("끝 나이 입력"));
	}
	
	public int getBeginAge() {
		return beginAge;
	}

	public void setBeginAge(int beginAge) {
		this.beginAge = beginAge;
	}

	public int getEndAge() {
		return endAge;
	}

	public void setEndAge(int endAge) {
		this.endAge = endAge;
	}

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	public String getColName() {
		return colName;
	}

	public void setColName(String colName) {
		this.colName = colName;
	}

	public String getSearchKey() {
		return searchKey;
	}

	public void setSearchKey(String searchKey) {
		this.searchKey = searchKey;
	}
	
}// (Mapper) class END
