package moram.mypage.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import moram.mypage.service.IMypageService;
import moram.mypage.service.MypageServiceImpl;

@WebServlet("/PlaceRefund.do")
public class PlaceRefund extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		
		Gson gson = new Gson();
		PrintWriter out = response.getWriter();
		IMypageService service = MypageServiceImpl.getInstance();
		
		String payNo = request.getParameter("payNo");
		
		int res = service.placePayRefund(payNo);
		String rpayNo = service.placeTimeRezrePay(payNo);
		
		
		String answer = rpayNo + "번으로 환불 되었습니다.";
		
		String json = gson.toJson(answer);
		out.write(json);
		response.flushBuffer();
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
