package cn.ifxcode.bbs.utils;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Arrays;
import java.util.List;
import java.util.Objects;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class UploadUtils {

	private static final String TEMP_PATH = "//temp//files";
	
	private static final String[] TYPES = {"xls", "xlsx"};
	
	private static String PATH = null;
	
	public static String upload(HttpServletRequest request) throws Exception {
		if (PATH == null) {
			File uploadDir = new File(request.getSession().getServletContext().getRealPath("/"), TEMP_PATH);
			PATH = uploadDir.getAbsolutePath(); 
			if (!uploadDir.exists()) {
				uploadDir.mkdirs();
			}
		}
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setRepository(new File(PATH));
		factory.setSizeThreshold(1024 * 1024);
		
		ServletFileUpload upload = new ServletFileUpload(factory);
		
		try {
			List<FileItem> items = upload.parseRequest(request);
			for (FileItem item : items) {
				if (!validFileType(item)) {
					throw new RuntimeException("上传文件格式错误，格式只能是：" + Arrays.toString(TYPES));
				}
				String filePath = PATH + File.separator + UUID.randomUUID().toString() + "." + getFileType(item);
				File file = new File(filePath);
				if(!file.exists()) {
					InputStream ins = null;
					OutputStream ous = null;
		            try{
		            	ins = item.getInputStream();
		                ous = new FileOutputStream(file);
		                byte[] buffer = new byte[1024];
		                int len = 0;
		                while((len = ins.read(buffer)) > -1) {
		                	ous.write(buffer,0,len);
		                }
		                return filePath;
		            } catch (FileNotFoundException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					} finally{
		                try {
							ous.close();
						} catch (IOException e) {
							e.printStackTrace();
						}
		                try {
							ins.close();
						} catch (IOException e) {
							e.printStackTrace();
						}
		            }
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		}
		return null;
	}

	public static void delete(String path) {
		File file = new File(path);
		if (file.exists()) {
			file.delete();
		}
	}
	
	private static boolean validFileType(FileItem item) {
		if(!item.isFormField()) {
			for (String type : TYPES) {
				String fileType = getFileType(item);
				if(Objects.equals(type, fileType)) {
					return true;
				}
			}
		}
		return false;
	}
	
	private static String getFileType(FileItem item) {
		String fileType = item.getName().substring(item.getName().lastIndexOf(".") + 1, item.getName().length());
		return fileType;
	} 
	
}
