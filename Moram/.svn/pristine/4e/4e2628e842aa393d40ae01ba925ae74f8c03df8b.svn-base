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


@WebServlet("/MemberDelete.do")
public class MemberDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset-utf-8");
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		IMypageService service = MypageServiceImpl.getInstance();
		
		HttpSession session = request.getSession();
		
		String memId = (String) session.getAttribute("sessionId");
		
		int result = service.memberDelete(memId);
		String res = "";
		if(result <= 0) {
			res = "탈퇴 실패";
			String jsonData = gson.toJson(res);
			out.write(jsonData);
			response.flushBuffer();
		}else {
			res = "탈퇴 성공";
			String jsonData = gson.toJson(res);
			out.write(jsonData);
			session.invalidate();
			response.flushBuffer();
		}
		
		
		// 그리고 세션을 뺐어야 한다. 그 후 첫 페이지로 상대방 이동 시키기.
		
		

		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
