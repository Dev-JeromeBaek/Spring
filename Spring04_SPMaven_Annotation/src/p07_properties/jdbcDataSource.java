package p07_properties;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component("jdbcBean")
public class jdbcDataSource {
	
	@Value("${aaa.driver}")
	private String driver;
	@Value("${aaa.url}")
	private String url;
	@Value("${aaa.username}")
	private String username;
	@Value("${aaa.password}")
	private String password;

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
