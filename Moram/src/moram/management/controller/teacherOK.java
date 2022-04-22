package moram.management.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import moram.management.service.IManagementService;
import moram.management.service.ManagementServiceImpl;
import moram.vo.MemberVO;
import moram.vo.MoramVO;

/**
 * Servlet implementation class teacherOK
 */
@WebServlet("/teacherOK.do")
public class teacherOK extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public teacherOK() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		MemberVO vo = new MemberVO();
		
		vo.setMem_div(request.getParameter("mem_div"));
		vo.setMem_id(request.getParameter("mem_id"));
		vo.setMem_jstate(request.getParameter("mem_jstate"));
		
		IManagementService service = ManagementServiceImpl.getInstance();
		
		int num = service.updateTeacher(vo);
		
		if(num!=0) {
			request.getRequestDispatcher("result/resultInt.jsp").forward(request, response);;
		}
		
	}

}
