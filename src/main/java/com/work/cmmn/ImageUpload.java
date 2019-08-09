package com.work.cmmn;

import java.io.File;
import java.io.FileOutputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.core.io.ClassPathResource;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

public class ImageUpload {

	// 파일 저장 경로
	//private static final String savePath = "C:\\sts-bundle\\workspace\\datePlan\\src\\main\\webapp\\static\\images\\upload";
	//private static final String savePath = "workspace/datePlan/src/main/webapp/static/images/upload";
	
	public static String[] uploadFile(List<MultipartFile> file, String path) throws Exception {
		String[] fileUrl = new String[file.size()];
		
		for (int i = 0; i < file.size(); i++) {
			UUID uuid 		= UUID.randomUUID();
			String saveName = uuid.toString() + "_" + 
							  file.get(i).getOriginalFilename();
			
			//File 	target 	= new File(savePath, saveName);
			FileOutputStream fos = new FileOutputStream(path + "/" + saveName);
			fos.write(file.get(i).getBytes());			
			fos.close();
			
			fileUrl[i] = saveName;
		}
		
		System.out.println("잘넘어옴");
		
		return fileUrl;
	}
}
