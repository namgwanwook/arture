 package com.spring.proOne.common.file;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import net.coobird.thumbnailator.Thumbnails;


@Controller
public class FileDownloadController {
	private static String CURR_IMAGE_REPO_PATH = "C:\\o_image\\galleryimage";
	private static String PROFILE_IMGAE_REPO_PATH = "C:\\o_image\\profileimage";
	
	
	@RequestMapping("/download.do")
	protected void download(@RequestParam("fileName") String fileName,
		                 	@RequestParam("id") String id,
			                 HttpServletResponse response) throws Exception {
		OutputStream out = response.getOutputStream();
		String filePath=CURR_IMAGE_REPO_PATH+"\\"+id+"\\"+fileName;
		File image=new File(filePath);

		response.setHeader("Cache-Control","no-cache");
		response.addHeader("Content-disposition", "attachment; fileName="+fileName);
		FileInputStream in=new FileInputStream(image); 
		byte[] buffer=new byte[1024*8];
		while(true){
			int count=in.read(buffer); 
			if(count==-1) 
				break;
			out.write(buffer,0,count);
		}
		in.close();
		out.close();
	}
	
	@RequestMapping("/imageList.do")
	   protected void imageList(@RequestParam("imageFileName") String imageFileName,
	                     @RequestParam("galleryNO") int galleryNO,
	                          HttpServletResponse response)throws Exception {
	      OutputStream out = response.getOutputStream();
	      String downFile = CURR_IMAGE_REPO_PATH + "\\" +galleryNO+"\\"+ imageFileName;
	      File file = new File(downFile);

	      response.setHeader("Cache-Control", "no-cache");
	      response.addHeader("Content-disposition", "attachment; fileName=" + imageFileName);
	      FileInputStream in = new FileInputStream(file);
	      byte[] buffer = new byte[1024 * 8];
	      while (true) {
	         int count = in.read(buffer); 
	         if (count == -1) 
	            break;
	         out.write(buffer, 0, count);
	      }
	      in.close();
	      out.close();
	   }
	
	@RequestMapping("/thumbnails.do")
	protected void thumbnails(@RequestParam("fileName") String fileName, @RequestParam("id") String id, HttpServletResponse response) throws Exception {
		
		if(fileName.equals("duke.png")) {
			OutputStream out = response.getOutputStream();
			String filePath=PROFILE_IMGAE_REPO_PATH+"\\"+fileName;
			File image=new File(filePath);

			if (image.exists()) { 
				Thumbnails.of(image).size(121,154).outputFormat("png").toOutputStream(out);
			}
			byte[] buffer = new byte[1024 * 8];
			out.write(buffer);
			out.close();				
		}else {
		OutputStream out = response.getOutputStream();
		String filePath=PROFILE_IMGAE_REPO_PATH+"\\"+id+"\\"+fileName;
		File image=new File(filePath);
		
		if (image.exists()) { 
			Thumbnails.of(image).size(121,154).outputFormat("png").toOutputStream(out);
		}
		byte[] buffer = new byte[1024 * 8];
		out.write(buffer);
		out.close();	
		}

	}
	
	@RequestMapping("/mainImage.do")
	protected void mainImage(@RequestParam("imageFileName") String imageFileName,
							@RequestParam("galleryNO") int galleryNO,
							HttpServletResponse response) throws Exception {
		OutputStream out = response.getOutputStream();
		String filePath=CURR_IMAGE_REPO_PATH+"\\"+galleryNO+"\\"+imageFileName;
		File image = new File(filePath);
		
		System.out.println("경로 받아오기!!! : "+filePath);
		
		response.setHeader("Cache-Control","no-cache");
		response.addHeader("Content-disposition", "attachment; fileName="+imageFileName);
		FileInputStream in=new FileInputStream(image); 
		byte[] buffer=new byte[1024*8];
		while(true){
			int count=in.read(buffer); 
			if(count==-1) 
				break;
			out.write(buffer,0,count);
		}
		in.close();
		out.close();
		
	}
	
	@RequestMapping("/downProfile.do")
	protected void downProfile(@RequestParam("profileImage") String profileImage,
		                 	@RequestParam("id") String prifileId,
			                 HttpServletResponse response) throws Exception {
		OutputStream out = response.getOutputStream();
		String filePath=CURR_IMAGE_REPO_PATH+"\\member_image\\"+prifileId+"\\"+profileImage;
		File image=new File(filePath);

		response.setHeader("Cache-Control","no-cache");
		response.addHeader("Content-disposition", "attachment; fileName="+profileImage);
		FileInputStream in=new FileInputStream(image); 
		byte[] buffer=new byte[1024*8];
		while(true){
			int count=in.read(buffer);
			if(count==-1) 
				break;
			out.write(buffer,0,count);
		}
		in.close();
		out.close();
	}
}
