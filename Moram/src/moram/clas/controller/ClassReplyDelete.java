package moram.clas.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import moram.clas.service.ClasServiceImpl;
import moram.clas.service.IClasService;

@WebServlet("/ClassReplyDelete.do")
public class ClassReplyDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String clRpNo = request.getParameter("classcmt_no");
		
		IClasService service = ClasServiceImpl.getInstance();
		
		int res = service.classReplyDelete(clRpNo);
		
		request.setAttribute("res", res);
		
		request.getRequestDispatcher("class/result.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
