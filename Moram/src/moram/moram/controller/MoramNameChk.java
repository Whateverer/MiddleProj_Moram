package moram.moram.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import moram.moram.service.IMoramService;
import moram.moram.service.MoramServiceImpl;

@WebServlet("/MoramNameChk.do")
public class MoramNameChk extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/html charset=utf-8");
		Gson gson = new Gson();
		
		//데이터 가져오기
		String mrname = request.getParameter("mrname");
		
		//service 객체 생성
		IMoramService service = MoramServiceImpl.getInstance();
		
		String jsonData = null; 
		
		//service 메서드
		int res = service.moramNameChk(mrname);
		String result = "";
		
		//jsp전송
		
		if(res > 0) {
			result = "중복되는 모람명";
		}else {
			result = "사용가능한 모람명";
		}
		
		jsonData = gson.toJson(result);
		
		out.write(jsonData); // print와 같음, 보통 write를 씀 (응답 데이터를 사용자쪽으로 보내는 것)
		response.flushBuffer();
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
