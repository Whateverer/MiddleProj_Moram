package moram.moram.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import moram.moram.service.IMoramService;
import moram.moram.service.MoramServiceImpl;
import moram.vo.MoramVO;

@WebServlet("/SelCatMoramList.do")
public class SelCatMoramList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		
		int catNo = Integer.parseInt(request.getParameter("subject_no")) ;
		
	
		IMoramService service = MoramServiceImpl.getInstance();
	
		List<MoramVO> list = service.selCatMoramList(catNo);		
	
		Gson gson = new Gson();
		
		String jsonData = null;
		
		jsonData = gson.toJson(list);		
		
		out.println(jsonData);
		
		response.flushBuffer();
	
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
