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
import moram.vo.ClassVO;

@WebServlet("/MyClassList.do")
public class MyClassList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();

		String memId = request.getParameter("mem_id");
		String memDiv = request.getParameter("mem_div");
		System.out.println(memDiv);
		IClasService service = ClasServiceImpl.getInstance();
		
		List<ClassVO> list = null;

		
		if(memDiv.equals("모람쌤")) {
			list = service.semClassList(memId);
		}else {
			list = service.myClassList(memId);
		}
		
		Gson gson = new Gson();
		
		String jsonData = null;
		
		jsonData = gson.toJson(list);		
		
		out.println(jsonData);
		
		response.flushBuffer();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
