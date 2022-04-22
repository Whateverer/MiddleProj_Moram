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

@WebServlet("/MoramRefund.do")
public class MoramRefund extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		
		Gson gson = new Gson();
		PrintWriter out = response.getWriter();
		
		IMypageService service = MypageServiceImpl.getInstance();
		
		HttpSession session = request.getSession();
		
		String memId= (String) session.getAttribute("sessionId");
		
		
		String subNo = request.getParameter("subNo");
		
		int result = service.moramRefund(subNo);
		
		String res = "";
		
		if(result == 0) {
			res = "환불에 실패하였습니다.";
			String json = gson.toJson(res);
			out.write(json);
		}else if(result == 1) {
			int rest = service.moramReset(memId);
			res = rest + " 환불 되셨습니다.";
			String json = gson.toJson(res);
			out.write(json);
		}
		response.flushBuffer();
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
