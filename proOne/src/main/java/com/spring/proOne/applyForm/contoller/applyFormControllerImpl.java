package com.spring.proOne.applyForm.contoller;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.multi.MultiLabelUI;

import org.apache.commons.io.FileUtils;
import org.omg.CORBA.portable.ResponseHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.http.client.support.HttpAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.ResponseExtractor;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.proOne.applyForm.service.applyFormService;
import com.spring.proOne.applyForm.vo.ArticleVO;
import com.spring.proOne.gallery.vo.ImageVO;
import com.spring.proOne.member.vo.MemberVO;

@Controller("applyFormController")
public class applyFormControllerImpl implements applyFormController{
	private static final String GALLERY_IMAGE_REPO = "C:\\o_image\\galleryimage";
	@Autowired
	applyFormService applyFormService;
	@Autowired
	ArticleVO articleVO;
	
	@Override
	@RequestMapping(value="/applyForm/addNewArticle.do", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity addNewArticle(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		multipartRequest.setCharacterEncoding("utf-8");
		String imageFileName = null;
		
		Map<String, Object> articleMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		while(enu.hasMoreElements()) {
			String name= (String)enu.nextElement();
			String value= multipartRequest.getParameter(name);
			System.out.println("어플라이폼 값 확인 ------>name:"+name+", value:"+value);
			articleMap.put(name, value);
		}
		
		HttpSession session = multipartRequest.getSession();
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		String id =memberVO.getId();
		articleMap.put("id", id);
		
		List<String> fileList = upload(multipartRequest);
		List<ImageVO> imageFileList = new ArrayList<ImageVO>();
		if(fileList != null && fileList.size() != 0) {
			for (String fileName:fileList) {
				ImageVO imageVO = new ImageVO();
				imageVO.setImageFileName(fileName);
				imageFileList.add(imageVO);
			}
			articleMap.put("imageFileName", imageFileList.get(0).getImageFileName());
			articleMap.put("imageFileList", imageFileList);
		}
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html;charset=utf-8");

		try {
			int i=0;
			int articleNO = applyFormService.addNewArticle(articleMap);
			
			if(imageFileList != null && imageFileList.size() != 0) {
				for(ImageVO imageVO : imageFileList) {
					imageFileName = imageVO.getImageFileName();

					File srcFile = new File(GALLERY_IMAGE_REPO+"\\"+"temp"+"\\"+imageFileName);
					File destDir = new File(GALLERY_IMAGE_REPO+"\\"+articleNO);
					FileUtils.moveFileToDirectory(srcFile, destDir, true);
					i++;
				}
			}
			message = "<script>";
			message += " alert('신청이 완료되었습니다..');";
			message += " location.href='"+multipartRequest.getContextPath()+"/main/main.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			
		} catch (Exception e) {
			if (imageFileList != null && imageFileList.size() != 0) {
				for(ImageVO imageVO : imageFileList) {
					imageFileName = imageVO.getImageFileName();
					File srcFile = new File(GALLERY_IMAGE_REPO+"\\"+"temp"+"\\" + imageFileName);
					srcFile.delete();
				}
			}
			message = "<script>";
			message = " alert('오류가 발생했습니다. 다시 시도하세요');";
			message = " location.href='" + multipartRequest.getContextPath()+"/applyForm/articleForm.do';";
			message = " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
				
		}
		return resEnt;
	}
	
	@RequestMapping(value="/applyForm/*Form.do", method=RequestMethod.GET)
	public ModelAndView form(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	private List<String> upload(MultipartHttpServletRequest multipartRequest) throws Exception{
		List<String> fileList = new ArrayList<String>();
		Iterator<String> fileNames = multipartRequest.getFileNames();
		while(fileNames.hasNext()) {
			String fileName = fileNames.next();
			MultipartFile mFile = multipartRequest.getFile(fileName);
			String originalFileName = mFile.getOriginalFilename();
			
			System.out.println("originalname : " + originalFileName);
			
			fileList.add(originalFileName);
			File file = new File(GALLERY_IMAGE_REPO+"\\"+fileName);
			System.out.println(mFile.getSize());
			System.out.println(file);
			if(mFile.getSize() != 0) {
				System.out.println("test1");
				if(!file.exists()) {
					System.out.println("test2");
					if(file.getParentFile().mkdirs()){
						file.createNewFile();
					}
				}
				mFile.transferTo(new File(GALLERY_IMAGE_REPO+"\\"+"temp"+"\\"+originalFileName));
			}
		}
		return fileList;
	}
	
	@Override
	@RequestMapping(value="/applyForm/viewArticle.do", method=RequestMethod.GET)
	public ModelAndView viewArticle(int articleNO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		articleVO = applyFormService.viewArticle(articleNO);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("article", articleVO);
		return mav;
	}

	@Override
	@RequestMapping(value="/applyForm/modArticle.do", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity modArticle(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		Map<String, Object> articleMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		
		while(enu.hasMoreElements()) {
			String name = (String)enu.nextElement();
			String value = multipartRequest.getParameter(name);
			articleMap.put(name, value);
		}
		
		List<String> imageFileName = upload(multipartRequest);
		HttpSession session = multipartRequest.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String id = memberVO.getId();
		articleMap.put("id",id);
		articleMap.put("imageFileName", imageFileName);
		String articleNO =(String)articleMap.get("articleNO");
		String message;
		
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type","text/html; charset=utf-8");
		
		try {
			applyFormService.modArticle(articleMap);
			if (imageFileName != null && imageFileName.size() != 0) {
				File srcFile = new File(GALLERY_IMAGE_REPO+"\\"+"temp"+"\\"+imageFileName);
				File destDir = new File(GALLERY_IMAGE_REPO+"\\"+articleNO);
				FileUtils.moveFileToDirectory(srcFile, destDir, true);
				
				String originalFileName = (String) articleMap.get("originalFileName");
				File oldFile = new File(GALLERY_IMAGE_REPO+"\\"+articleNO+"\\"+originalFileName);
				oldFile.delete();
			}
			message = "<script>";
			message += " alert('수정 되었습니다.');";
			message += " location.href='" + multipartRequest.getContextPath()+"/board/viewArticle.do?articleNO="+articleNO+"';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch(Exception e) {
			File srcFile = new File(GALLERY_IMAGE_REPO+"\\"+"temp"+"\\"+imageFileName);
			srcFile.delete();
			message = "<script>";
			message += " alert('수정이 취소 되었습니다.');";
			message += " location.href='"+multipartRequest.getContextPath()+"/board/viewArticle.do?articleNO="+articleNO+"';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}
		return resEnt;
	}

	@Override
	@RequestMapping(value="/applyForm/removeArticle.do", method= RequestMethod.POST)
	@ResponseBody
	public ResponseEntity removeArticle(@RequestParam("articleNO") int articleNO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		response.setContentType("text/html;charset=utf-8");
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type",	"text/html;charset=utf-8");
		try {
			applyFormService.removeArticle(articleNO);
			File destDir = new File(GALLERY_IMAGE_REPO+"\\"+articleNO);
			FileUtils.deleteDirectory(destDir);
			
			message = "<script>";
			message += " alert('삭제 되었습니다.');";
			message += " location.href='" + request.getContextPath()+"/board/listArticles.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch(Exception e) {
			message = "<script>";
			message += " alert('삭제가 취소되었습니다.');";
			message += " location.href='"+request.getContextPath()+"/board/listArticles.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}
	
}
