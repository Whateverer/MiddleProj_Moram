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
import moram.vo.SubscribeVO;

@WebServlet("/MoramSubscribePay.do")
public class MoramSubscribePay extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		Gson gson = new Gson();
		PrintWriter out = response.getWriter();
		
		
		IMypageService service = MypageServiceImpl.getInstance();
		
		SubscribeVO vo = new SubscribeVO();
		
		String subsName = request.getParameter("subsName");
		
		System.out.println(subsName);
		
		HttpSession session = request.getSession();
		
		String memId = (String) session.getAttribute("sessionId");
		String type = request.getParameter("type");
		
		Map<String, String> idSubNo = new HashMap<>();
		
		int re = service.moramPayChk(idSubNo);
		
		
		int resut = 0;
		
		if(subsName.equals("모람권49")) {
			
			resut =	service.moramFive(memId);
			System.out.println(memId);
			
		}else if(subsName.equals("모람권59")) {
			
			resut = service.moramHun(memId);
			System.out.println(memId);
		}
		System.out.println(resut);
		
		vo.setSubscribe_name(subsName);
		vo.setMem_id(memId);
		vo.setSubscribe_paytype(type);
		
		if(re <= 0) {
		
		String result = service.moramSubscribePay(vo);
		String jsonData = gson.toJson(result);
		out.write(jsonData);
		response.flushBuffer();
		}else {
			return;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
