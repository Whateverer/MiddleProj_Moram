package moram.clas.controller;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.beanutils.BeanUtils;

import moram.clas.service.ClasServiceImpl;
import moram.clas.service.IClasService;
import moram.vo.ClassVO;
import moram.vo.FileVO;


@WebServlet("/ClassRegist.do")
@MultipartConfig(
		fileSizeThreshold = 1024 * 1024 * 10,
		maxFileSize = 1024 * 1024 * 30, maxRequestSize = 1024 * 1024 * 50
		
)
public class ClassRegist extends HttpServlet {
	private static final long serialVersionUID = 1L;

	 // 파일 전송을 post형식만 가능 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 파일이 아닌 일반 데이터(파일이아닌 데이터)는 getParameter() 메서드나
		// getParameterValues()메서드를 이용해서 구한다.
		request.setCharacterEncoding("utf-8");
		// 데이터가져오기
		ClassVO vo = new ClassVO();
		try {
			BeanUtils.populate(vo, request.getParameterMap());

		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		vo.setClass_addr(vo.getClass_addr1()+vo.getClass_addr2());
		
		IClasService service = ClasServiceImpl.getInstance();
		String clNo = service.classRegist(vo);
		vo.setClass_no(clNo);
		System.out.println(clNo);
		// upload한 파일이 저장될 폴더 설정
		String uploadPath = "D:\\A_TeachingMaterial\\4.MiddleProject\\workspace\\Moram\\WebContent\\images\\class\\";
		//String folderPath = request.getParameter("folderNm");
		
	//	uploadPath = uploadPath + folderPath;
		
		// 저장될 폴더가 없으면 새로 생성한다.
		File fileUploadDir = new File(uploadPath);
		
		if(!fileUploadDir.exists()) {
			fileUploadDir.mkdirs();
		}
		
		
		//-------------------------------------------------------
		
		String fileName = ""; // 파일명이 저장될 변수 선언
		
		
		/*
		 - Servlet 3.0이상에 새롭게 추가된 Upload용 메서드
		 	1) request.getParts(); ==> 전체 Part객체가 저장된 컬렉션을 반환한다.
		 	2) request.getPart("part이름") ==> 지정된 이름을 가진 part객체를 반환한다.
		 	
		 */
		
		for(Part part : request.getParts()) {
			// 파일명 구하기 
			fileName = extractFileName(part);
			// 파일명이 공백("")이면 이것은 파일이 아닌 일반 파라미터라는 의미이다.
			if(!"".equals(fileName)) {
				// 1개의 업로드 파일에 대한 정보를 저장할 객체 생성
				System.out.println(fileName.indexOf("."));
				System.out.println(fileName.length());
				System.out.println(fileName.substring(fileName.indexOf("."), fileName.length()));
				fileName = clNo+fileName.substring(fileName.indexOf("."), fileName.length());
				
				vo.setClass_image(fileName);
				service.classImgUpdate(vo);
				try {
					// 파일 저장 ==> Part객체의 write()메서드 이용
					part.write(uploadPath + File.separator + fileName);
				} catch (IOException e) {
					e.getMessage();
				}
				
			}
		}// for문 끝
		
		
	} // doPost()메서드 끝...
	
	/*
	  - Part 구조
	  1) 파일이 아닐 때 (즉, 일반 파라미터 데이터일 경우)
	  	-------very1876sdas82392 ==> Part를 구분하는 구분선
	  	content-disposition : form-data; name="username(파라미터명)"
	  											==> 빈줄
	  	tester									==> 파라미터값
	 */
	
	/*
	  2) 파일일 경우
	  -------very1876sdas82392 ==> Part를 구분하는 구분선
	  content-disposition : form-data; name="uploadFile1(파라미터명)"; filename="test1.txt" ==> 파일정보
	  Content-Type : text/plain ==> 파일 종류
	  							==> 빈줄
	  abcdfsdf!@#!@1			==> 파일데이터
	 */
	
	//Part영역에서 읽어올 '파일명'을 찾아 반환하는 메서드
	private String extractFileName(Part part) {
		String fileName = "";
		String contentDisposion = part.getHeader("content-disposition");
		// form-data; name="username(파라미터명)" ==> 파일이 아닐 떼
		// form-data; name="uploadFile1(파라미터명)"; filename="test1.txt" ==> 파일이 아닐때
		
		String[] items = contentDisposion.split(";");
		for(String item : items) {
			if(item.trim().startsWith("filename")) {
				// filename="test1.txt"  ==> item변수값
				fileName = item.substring(item.indexOf("=") + 2, item.length()-1);
			}
		}
		
		
		return fileName;
	}

	
	
}


