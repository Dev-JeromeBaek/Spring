package p09_properties02;

public class jdbcDataSource {
	
	private String driver, url, username, password;

//	toString 오버라이드 : Alt + s + s + s + Enter;
	@Override
	public String toString() {
		return "jdbcDataSource [ driver=" + driver 
							+ ", url=" + url 
							+ ", username=" + username 
							+ ", password=" + password
							+ "]";
	}

	public String getDriver() {
		return driver;
	}

	public void setDriver(String driver) {
		this.driver = driver;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	
}// jdbcDataSource END
