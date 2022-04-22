package moram.management.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import moram.management.service.IManagementService;
import moram.management.service.ManagementServiceImpl;
import moram.vo.ClassVO;

/**
 * Servlet 클래스전체 리스트를 출력하는 서블릿
 */
@WebServlet("/ClassList2.do")
public class ClassList2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public ClassList2() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
	    IManagementService service = ManagementServiceImpl.getInstance();
	    
	    List<ClassVO>classlist2 = service.classInfo2();  
	    
	    request.setAttribute("classlist2", classlist2);
	    request.getRequestDispatcher("/management/classList2.jsp").forward(request, response);
	    

	}


}
