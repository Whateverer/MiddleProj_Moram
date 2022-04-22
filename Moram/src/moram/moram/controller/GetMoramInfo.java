package moram.moram.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import moram.moram.service.IMoramService;
import moram.moram.service.MoramServiceImpl;
import moram.vo.MoramVO;

@WebServlet("/GetMoramInfo.do")
public class GetMoramInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//정보가져오기 
		 request.setCharacterEncoding("UTF-8");
		 response.setCharacterEncoding("UTF-8");
		 response.setContentType("application/json; charset=utf-8;");
		 
		 PrintWriter out = response.getWriter();
		 
		String mrNo = request.getParameter("mrNo");
		
		IMoramService service = MoramServiceImpl.getInstance();
		
		MoramVO vo = new MoramVO();
		
		vo = service.moraminfo(mrNo);
		
		Gson gson = new Gson();
		
		String jsonData = null;
		
		jsonData = gson.toJson(vo);		
		
		out.println(jsonData);
		
		response.flushBuffer();	
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	
	}

}
