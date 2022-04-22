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

@WebServlet("/MoramPayChk.do")
public class MoramPayChk extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		IMypageService service = MypageServiceImpl.getInstance();
		Map<String, String> idSubNo = new HashMap<>();
		HttpSession session = request.getSession();
		
		String memId = (String) request.getAttribute("sessionId");
		String subsNo = request.getParameter("subsNo");
		
		
		idSubNo.put("mem_id", memId);
		idSubNo.put("subscribe_name", subsNo);
		
		int res = service.moramPayChk(idSubNo);
		System.out.println(res);
		String result = "";
		
		if(res <= 0) {
			result = "0";
		}else if(res > 0){
			result = "1";
		}
		
		String json = gson.toJson(result);
		
		out.write(json);
		response.flushBuffer();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
