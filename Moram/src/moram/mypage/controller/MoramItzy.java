package moram.mypage.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import moram.mypage.service.IMypageService;
import moram.mypage.service.MypageServiceImpl;
import moram.vo.MoramVO;

@WebServlet("/MoramItzy.do")
public class MoramItzy extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		Gson gson = new Gson();
		
		MoramVO vo = new MoramVO();
		IMypageService service = MypageServiceImpl.getInstance();
		
		HttpSession session = request.getSession();
		
		String memId = (String) session.getAttribute("sessionId");
		
		vo = service.moramItzy(memId);
		

	
		String json = gson.toJson(vo);
		out.write(json);			
		
		response.flushBuffer();
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
