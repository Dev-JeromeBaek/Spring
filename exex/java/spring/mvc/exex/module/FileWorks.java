package spring.mvc.exex.module;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
@Component
public class FileWorks {
	// filesPath : 이클립스가 서버를 통제하고 있기때문에; 경로를 지정하는것이다. 시스템적으로
		private String filesPath = 
				"C:\\Users\\Yeob's\\Desktop\\eclipse\\Spring_Works\\z_ram\\src\\main\\webapp\\resources\\files";
		
//		[사진 업로드]
		public String upLoadAndGetSysName(MultipartFile upfile) {
			
			//사진이 없으면 끝내버리고 null값 줘라
			if(upfile.isEmpty()) {
				return null;
			}
			
			String orgName = upfile.getOriginalFilename();
			String sysName = orgName;
										// 경로 + 시스템적 파일이름
			File uploadFile = new File(filesPath + "\\" + sysName);
			
			int addNum = 1;
			while(uploadFile.exists()) {
				String extName = sysName.substring(sysName.lastIndexOf("."));
				String fName = sysName.substring(0, sysName.lastIndexOf("."));
				
				if(fName.contains("_")) {
					fName = fName.substring(0, fName.lastIndexOf("_"));
				}
				
				sysName = fName + "_" + addNum + extName;
				uploadFile = new File(filesPath + "\\" + sysName);
				addNum++;
			}
			System.out.println("sysName Comp : " + sysName);
			
			try {
				byte[] fileBytes = upfile.getBytes();
				
				OutputStream os = new FileOutputStream(uploadFile);
				os.write(fileBytes);
				os.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return sysName;
		}// upLoadAndGetSysName() END
		
//		[파일 지우기]
		public void deleteFile(String sysName) {
			
			File delFile = new File(filesPath + "\\" + sysName);
			
			if(delFile.exists()) delFile.delete();
		} // deleteFile() END

//		[파일 수정하기]
		public String updateAndGetSysName(MultipartFile upfile, String sysName) {
			
			if(upfile.isEmpty()) {
				return sysName;
			}
			deleteFile(sysName);
			
			return upLoadAndGetSysName(upfile);
		}// updateAndGetSysName() END
		
//		[파일 다운로드]
		public void downLoad(String orgName, String sysName, HttpServletResponse response) {
			
			try {
				String encOrgName = URLEncoder.encode(orgName, "UTF-8");
				
				response.setHeader("Content-Disposition", 
									"attachment; filename=" + encOrgName);
				
				InputStream is = null;
				is = new FileInputStream(filesPath + "\\" + sysName);
				
				ServletOutputStream sos = response.getOutputStream();
				
				int data = 0;
				while( (data = is.read()) != -1) {
					sos.write(data);
					sos.flush();
				}
				sos.close();
				is.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}// downLoad() END
}
