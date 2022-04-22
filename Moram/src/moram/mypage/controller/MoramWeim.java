package moram.mypage.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import moram.mypage.service.IMypageService;
import moram.mypage.service.MypageServiceImpl;


@WebServlet("/MoramWeim.do")
public class MoramWeim extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		String moramName = request.getParameter("moramName");
		String moramiName = request.getParameter("moramiName");
		
		HttpSession session = request.getSession();
		
		String mem_id = (String) session.getAttribute("sessionId");  // 나중에 세션 아이디로 바꿀 것.
		
		Map<String, String> morami = new HashMap<>();
		
		morami.put("mem_id", mem_id);
		morami.put("moramName", moramName);
		morami.put("moramiName", moramiName);
		
		System.out.println("멤버 파라미터 : " + mem_id);
		
		IMypageService service = MypageServiceImpl.getInstance();
		
		int result = service.moramWeim(morami);
		
		Gson gson = new Gson();
		
		String jsonData = gson.toJson(result);
		
		out.write(jsonData);
		response.flushBuffer();
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
