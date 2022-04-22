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
import moram.vo.MemberVO;
import moram.vo.MoramMemberVO;
import moram.vo.TeacherVO;

/**
 * Servlet 모람위임, 모람샘승급 신청한거 보여주는 목록
 */
@WebServlet("/MemberApplyList.do")
public class MemberApplyList extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public MemberApplyList() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	 request.setCharacterEncoding("utf-8");
	 response.setContentType("text/html; charset=utf-8");
	 IManagementService service = ManagementServiceImpl.getInstance();
	 
	 List<MemberVO> weimList = service.getWeimMemberList();
	 List<TeacherVO> TchAplyList = service.getTchAplyList();
	 List<MoramMemberVO> moramjigiList = service.getMoramjigiList();
	 
	 request.setAttribute("weimList", weimList);
	 request.setAttribute("TchAplyList", TchAplyList);
	 request.setAttribute("moramjigiList", moramjigiList);
	 
	 request.getRequestDispatcher("/management/MemberApplyList.jsp").forward(request, response);
	 
	 
	 
	}
	
	

}
