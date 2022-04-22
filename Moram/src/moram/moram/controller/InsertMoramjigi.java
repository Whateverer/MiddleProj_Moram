package moram.moram.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import com.google.gson.Gson;

import moram.moram.service.IMoramService;
import moram.moram.service.MoramServiceImpl;
import moram.vo.MoramMemberVO;

/**
 * Servlet implementation class InsertMoramjigi
 */
@WebServlet("/InsertMoramjigi.do")
public class InsertMoramjigi extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=utf-8"); 
		PrintWriter out = response.getWriter();
		
		MoramMemberVO vo = new MoramMemberVO();
		HttpSession session = request.getSession();
		
		String mem_id = (String)session.getAttribute("sessionId");
		
		String mrNo = request.getParameter("mr_no");
		
		vo.setMem_id(mem_id);
		vo.setMr_no(mrNo);
		
		IMoramService service = MoramServiceImpl.getInstance();
		
		//모람지기 넣기
		service.insertMoramjigi(vo);
		Gson gson = new Gson();
		String jsonData = null;
		
		jsonData = gson.toJson(vo);
		out.println(jsonData);
		
		response.flushBuffer();
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
