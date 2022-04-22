package moram.moramboard.controller;

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

import moram.moramboard.service.IMoramBoardService;
import moram.moramboard.service.MoramBoradServiceImpl;
import moram.vo.AttachVO;
import moram.vo.BoardVO;
import moram.vo.FileVO;


@WebServlet("/MrBoardInsert.do")
@MultipartConfig(
		fileSizeThreshold = 1024 * 1024 * 10,
		maxFileSize = 1024 * 1024 * 30, maxRequestSize = 1024 * 1024 * 50
		
)
public class MrBoardInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	 // 파일 전송을 post형식만 가능 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 파일이 아닌 일반 데이터(파일이아닌 데이터)는 getParameter() 메서드나
		// getParameterValues()메서드를 이용해서 구한다.
		request.setCharacterEncoding("utf-8");
		// 데이터가져오기
		BoardVO vo = new BoardVO();
		try {
			BeanUtils.populate(vo, request.getParameterMap());

		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
				}
		IMoramBoardService service = MoramBoradServiceImpl.getInstance();
		int boardNo = service.insertMrBoard(vo);
		
		// upload한 파일이 저장될 폴더 설정
		String uploadPath = "D:\\A_TeachingMaterial\\4.MiddleProject\\workspace\\Moram\\WebContent\\images\\board\\"+vo.getMr_no()+"\\"+boardNo;
		//String folderPath = request.getParameter("folderNm");
		
	//	uploadPath = uploadPath + folderPath;
		
		// 저장될 폴더가 없으면 새로 생성한다.
		File fileUploadDir = new File(uploadPath);
		
		if(!fileUploadDir.exists()) {
			fileUploadDir.mkdirs();
		}
		
		
		//-------------------------------------------------------
		
		String fileName = ""; // 파일명이 저장될 변수 선언
		
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
//			System.out.println(fileName.indexOf("."));
//			System.out.println(fileName.length());
//			System.out.println(fileName);
			// 파일명이 공백("")이면 이것은 파일이 아닌 일반 파라미터라는 의미이다.
			if(!"".equals(fileName)) {
				// 1개의 업로드 파일에 대한 정보를 저장할 객체 생성
				FileVO fileVo = new FileVO();
				
				fileVo.setFileName(fileName);
				fileVo.setFileSize((int)Math.ceil(part.getSize()/ 1024.0));
				
				AttachVO attvo = new AttachVO();
				attvo.setBoard_no(boardNo);
				attvo.setAttach_name(fileName);
				service.insertAttach(attvo);
				
				try {
					// 파일 저장 ==> Part객체의 write()메서드 이용
					part.write(uploadPath + File.separator + fileName);
					fileVo.setUploadStatus("Success");
				} catch (IOException e) {
					fileVo.setUploadStatus("Fail : " + e.getMessage());
				}
				// 처리된 파일 정보를 저장한 객체를 List에 추가
				fileList.add(fileVo); 
			}
		}// for문 끝
		
		response.sendRedirect("moram/moramMain.jsp?menu=board");
		
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

