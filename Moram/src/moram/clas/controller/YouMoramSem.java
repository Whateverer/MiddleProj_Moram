package moram.clas.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import moram.clas.service.ClasServiceImpl;
import moram.clas.service.IClasService;

/**
 * Servlet implementation class YouMoramSem
 */
@WebServlet("/YouMoramSem.do")
public class YouMoramSem extends HttpServlet {
	private static final long serialVersionUID = 1L;   

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		

		String memId = request.getParameter("mem_id");
	
		
		
		IClasService service = ClasServiceImpl.getInstance();
		
		int res = service.youMoramSem(memId);
		
		request.setAttribute("res", res);
		
		request.getRequestDispatcher("class/result.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
