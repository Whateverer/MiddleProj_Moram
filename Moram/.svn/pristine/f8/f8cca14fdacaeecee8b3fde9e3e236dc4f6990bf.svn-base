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
import moram.member.service.IMemberService;
import moram.member.service.MemberServiceImpl;
import moram.vo.MemberVO;

/**
 *회원정보를 조회하고 출력하는 클래스
 */
@WebServlet("/MemberInfo2.do")
public class MemberInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public MemberInfo() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		  IManagementService service = ManagementServiceImpl.getInstance();
		
		List<MemberVO> memberlist = service.memberInfo();
		
		request.setAttribute("memberlist", memberlist);
		request.getRequestDispatcher("management/memberList.jsp").forward(request, response);
	
	}

}
