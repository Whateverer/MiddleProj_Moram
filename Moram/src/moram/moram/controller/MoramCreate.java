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
import moram.vo.MoramVO;

@WebServlet("/MoramCreate.do")
public class MoramCreate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 request.setCharacterEncoding("UTF-8");
	 response.setCharacterEncoding("UTF-8");
	 response.setContentType("text/html charset=utf-8");
	 PrintWriter out = response.getWriter();
	 
	 HttpSession session = request.getSession();
	 
	 MoramVO vo = new MoramVO();
	 try {
		BeanUtils.populate(vo, request.getParameterMap());
	 	} catch (IllegalAccessException | InvocationTargetException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	 	}
	 
	 vo.setMoramjigi((String)session.getAttribute("sessionId"));
	 
	 //service객체 만들기
	 IMoramService service = MoramServiceImpl.getInstance();
	 
	 //메서드 - insert시 모람 번호 반환
	 String result = service.insertMoram(vo);
	 
	 Gson gson = new Gson();
	 
	 String jsonData = null;
	 
	 jsonData = gson.toJson(result);
	 
	 out.println(jsonData);
		
	response.flushBuffer();
	
			
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
