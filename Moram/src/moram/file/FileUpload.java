package moram.file;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/*
 	- servlet 3.0 이상에서 파일 업로드를 처리하려면 서블릿에
 	  @MultipartConfig라는 애노테이션을 설정해야 한다.
 	  
 	- @MultipartConfig 애노테이션 설정 방법(사용되는 변수 및 역할)
 	  1) location : 업로드한 파일이 임시적으로 저장될 경로를 지정한다.
 	  			    (기본값 : "")
 	  2) fileSizeThreshold : 이 속성에서 지정한 크기보다 큰 파일은
 	  		위의 location에서 지정한 디스크의 임시 디렉토리에 저장
 	  				(단위 : byte, 기본값 : 0 (무조건 임시 디렉토리를 사용한다.)
 	  3) maxFileSize : 1개의 파일의 최대 크기 
 	  				(단위:byte, 기본값:-1L(무제한))
 	  4) maxRequestSize : 서버로 전송되는 Request데이터의 최대 크기
 	  				(단위:byte, 기본값:-1L(무제한))
 	  				
 */
import javax.servlet.http.Part;

import moram.clas.service.ClasServiceImpl;
import moram.clas.service.IClasService;
import moram.vo.ClassVO;
import moram.vo.FileVO;


@WebServlet("/fileUpload.do")
@MultipartConfig(
		fileSizeThreshold = 1024 * 1024 * 10,
		maxFileSize = 1024 * 1024 * 30, maxRequestSize = 1024 * 1024 * 50
		
)
public class FileUpload extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	 // 파일 전송을 post형식만 가능 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// upload한 파일이 저장될 폴더 설정
		request.setCharacterEncoding("utf-8");
		
		String folderNm = request.getParameter("folderNm"); // ec) class => 저장될 폴더이름
		String fileNm = request.getParameter("fileNm"); // ex) CL1 => 저장될 이름
		
		String fileName = ""; // ex) CL1.jpg => 파일형식이 포함된 이름 db에 저장될 이름  변수선언


		
		
		String uploadPath = "D:\\A_TeachingMaterial\\4.MiddleProject\\workspace\\Moram\\WebContent\\images";

		uploadPath = uploadPath + File.separator + folderNm;
		
		// 저장될 폴더가 없으면 새로 생성한다.
		File fileUploadDir = new File(uploadPath);
		
		if(!fileUploadDir.exists()) {
			fileUploadDir.mkdirs();
		}
		
		// 파일이 아닌 일반 데이터(파일이아닌 데이터)는 getParameter() 메서드나
		// getParameterValues()메서드를 이용해서 구한다.
		

		
		//-------------------------------------------------------
		
		
		
		// 업로드한 파일 정보가 저장될 List 객체 생성
		List<FileVO> fileList = new ArrayList<FileVO>();
		
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
				
				fileName= fileNm+fileName.substring(fileName.indexOf('.'), fileName.length());
				System.out.println(fileName);
				try {
					// 파일 저장 ==> Part객체의 write()메서드 이용
					part.write(uploadPath + File.separator + fileName);
					
					if(folderNm.equals("class")) {
						IClasService service = ClasServiceImpl.getInstance();
						ClassVO vo = new ClassVO();
						
						vo.setClass_image(fileName);
						vo.setClass_no(fileNm);
						service.classImgUpdate(vo);
						break;
					}
				} catch (IOException e) {
					System.out.println("실패" + e.getMessage());
				}
			}
			
		}// for문 끝
		
		
		
		request.setAttribute("res", 1);
		request.getRequestDispatcher("moram/result.jsp").forward(request, response);
		
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
