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

@WebServlet("/PlaceTimeRezRepay.do")
public class PlaceTimeRezRepay extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			response.setContentType("application/json; charset=utf-8");
			PrintWriter out = response.getWriter();
			
			String payNo = request.getParameter("payNo");
			
			IMypageService service = MypageServiceImpl.getInstance();
			String str = "";
			System.out.println("파라미터값 : " + payNo);
			
			String result = service.placeTimeRezrePay(payNo);
			System.out.println("인서트 결과 : " + result);
			int result2 = service.placepayrefund(payNo);
			
			if(result2 <= 0) {
				str = "환불 실패";
				return;
			}else {
				str = result + "내용 환불 성공";
			}
			
			Gson gson = new Gson();
			String jsonData = gson.toJson(str);
			out.write(jsonData);
			response.flushBuffer();
			
			
		
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
