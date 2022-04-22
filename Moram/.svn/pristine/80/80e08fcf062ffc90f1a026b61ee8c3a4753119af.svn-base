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

@WebServlet("/PassUpdate.do")
public class PassUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		
		IMypageService service = MypageServiceImpl.getInstance();
		
		HttpSession session = request.getSession();
		
		String old_pass = request.getParameter("old_pass");
		String new_pass = request.getParameter("new_pass");
		String mem_id = (String) session.getAttribute("sessionId");
		
		Map<String, String> memPass = new HashMap<>();
		memPass.put("old_pass", old_pass);
		memPass.put("new_pass", new_pass);
		memPass.put("mem_id", mem_id);
		
		int res = service.passUpdate(memPass);
		String result = "";
		if(res <= 0) {
			result = "변경 실패";
		}else {
			result = "변경 성공";
		}
		
		String jsonData = gson.toJson(result);
		
		out.write(jsonData);
		response.flushBuffer();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
