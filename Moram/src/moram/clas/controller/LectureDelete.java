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

@WebServlet("/LectureDelete.do")
public class LectureDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String ltNo = request.getParameter("lecture_no");
		
		IClasService service = ClasServiceImpl.getInstance();
		
		int res = service.lectureDelete(ltNo);

		Gson gson = new Gson();
		
		String jsonData = null;
		
		jsonData = gson.toJson(res);		
		
		out.println(jsonData);
		
		response.flushBuffer();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
