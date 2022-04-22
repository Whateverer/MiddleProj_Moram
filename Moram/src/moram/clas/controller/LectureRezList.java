package moram.clas.controller;

import java.io.IOException;
import java.io.PrintWriter;
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
import moram.vo.MemberVO;


@WebServlet("/LectureRezList.do")
public class LectureRezList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		
		String ltNo = request.getParameter("lecture_no");
		
		IClasService service = ClasServiceImpl.getInstance();
		
		List<MemberVO> list = service.lectureRezList(ltNo);

		Gson gson = new Gson();
		
		String jsonData = null;
		
		jsonData = gson.toJson(list);		
		
		out.println(jsonData);
		
		response.flushBuffer();
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
