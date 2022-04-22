package moram.clas.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import moram.clas.service.ClasServiceImpl;
import moram.clas.service.IClasService;
import moram.vo.LectureVO;

/**
 * Servlet implementation class ClCalendar
 */
@WebServlet("/ClCalendar.do")
public class ClCalendar extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8"); 
		
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		//0, 클라이언트 요청 파일 가져오기
		String clNo = request.getParameter("clNo");
		
		System.out.println("파라미터값 : " + clNo);
		
		//1. service 객체 만들기
		IClasService service = ClasServiceImpl.getInstance();
		
		//2. service 메서드 만들기 
		List<LectureVO> list = new ArrayList<>();
		list = service.getClCalendar(clNo);
		

		 
		String jsonData = gson.toJson(list);
		System.out.println("리스트입니다." + list);
		
		out.write(jsonData); 
		response.flushBuffer(); 
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
