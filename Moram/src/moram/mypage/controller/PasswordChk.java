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


@WebServlet("/PasswordChk.do")
public class PasswordChk extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset-utf-8");
		
		String mem_pass = request.getParameter("pass");
		
		HttpSession session = request.getSession();
		
		String mem_id = (String) session.getAttribute("sessionId");
		
		Map<String, String> vo = new HashMap<>();
		
		vo.put("mem_pass", mem_pass);
		vo.put("mem_id", mem_id);
		
		if(mem_pass.equals(null)) {
			return;
		}
		
		IMypageService service = MypageServiceImpl.getInstance();
		
		int result = service.passwordChk(vo);
		String res = "";
		
		if(result <= 0) {
			res = "실패";
		}else {
			res = "성공";
		}
		
		Gson gson = new Gson();	
		String jsonData = gson.toJson(res);
		PrintWriter out = response.getWriter();
		
		
		
		out.write(jsonData);
		response.flushBuffer();
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
