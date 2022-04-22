package moram.management.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import moram.management.service.IManagementService;
import moram.management.service.ManagementServiceImpl;
import moram.vo.ClassVO;

/**
 * Servlet 클래스정보를 수정하는 클래스
 */
@WebServlet("/classUpdate2.do")
public class ClassUpdate2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public ClassUpdate2() {
        super();
        // TODO Auto-generated constructor stub
    }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		ClassVO vo = new ClassVO();
		
		vo.setClass_no(request.getParameter("classno"));
		vo.setClass_name(request.getParameter("classname"));
		vo.setMem_id(request.getParameter("memid"));
		vo.setClass_info(request.getParameter("classinfo"));
		vo.setClass_addr(request.getParameter("classaddr"));
		vo.setClass_rgn(request.getParameter("classrgn"));
		vo.setSubject_no(Integer.parseInt(request.getParameter("subjectno")));
		System.out.println("클래스 정보 확인1"+ vo.getClass_rgn());
		IManagementService service = ManagementServiceImpl.getInstance();
		
		int num=service.classUpdate2(vo);
		System.out.println("쿼리 수행 여부 확인 num=" +num);
		request.setAttribute("res", num);
		//4. jsp 로 
		
		if(num!=0) {
			request.getRequestDispatcher("join/intresult.jsp").forward(request, response);
		}
		
	}

}
