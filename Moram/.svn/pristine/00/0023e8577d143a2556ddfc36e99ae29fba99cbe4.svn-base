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
import moram.vo.MemberVO;

@WebServlet("/MemberInfo.do")
public class MemberInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		IMypageService service = MypageServiceImpl.getInstance();
				
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		
		
		Gson gson = new Gson();
		String jsonData = "";
		
//		String memId = request.getParameter("memId");  //   sessionId로 바꿔야함 기존은 ajax에서 data로 넘겨준 값.
		
		String memId = (String) session.getAttribute("sessionId");
		
		MemberVO vo = new MemberVO();
		
		vo = service.memberInfo(memId);
		
		jsonData = gson.toJson(vo);
		
		out.write(jsonData);
		response.flushBuffer();
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
