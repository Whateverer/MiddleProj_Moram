package moram.moram.controller;

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

import moram.moram.service.IMoramService;
import moram.moram.service.MoramServiceImpl;
import moram.vo.BoardVO;

@WebServlet("/GetCalendar.do")
public class GetCalendar extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8"); 
		
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		//0, 클라이언트 요청 파일 가져오기
		String mrno = request.getParameter("mrno");
		
		System.out.println("파라미터값 : " + mrno);
		
		//1. service 객체 만들기
		IMoramService service = MoramServiceImpl.getInstance();
		
		//2. service 메서드 만들기 
		List<BoardVO> list = new ArrayList<>();
		list = service.getCalendar(mrno);
		
		/*
		 * //3. request 저장 request.setAttribute("list", list);
		 * 
		 * //4. jsp로 보내기 request.getRequestDispatcher(request.getContextPath() +
		 * "/moramCalendar.jsp");
		 */
		
		
		
		// 처리한 데이터를 JSON 문자열 데이터로 변환한 후 저장할 변수
		 
		String jsonData = gson.toJson(list);
		System.out.println("리스트입니다." + list);
		
		out.write(jsonData); // print와 같음, 보통 write를 씀 (응답 데이터를 사용자쪽으로 보내는 것)
		response.flushBuffer(); // 버퍼에 남은 데이터 강제로 출력하기
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
