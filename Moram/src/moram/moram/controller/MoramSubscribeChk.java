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

@WebServlet("/MoramSubscribeChk.do")
public class MoramSubscribeChk extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		//아이디 가져오기
		String memId = request.getParameter("");
		
		Gson gson = new Gson();
		
		IMoramService service = MoramServiceImpl.getInstance();
		
		//결과
		int res = service.moramSubscribeChk(memId);
		
		String jsonData = null;  
		
		
		jsonData = gson.toJson(res);
		
		out.write(jsonData); 
		response.flushBuffer();
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
