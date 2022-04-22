package moram.join.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import moram.member.service.IMemberService;
import moram.member.service.MemberServiceImpl;


/**
 * 이미 가입된 이메일 정보인지 확인하는 서블릿
 */
@WebServlet("/emDuChk.do")
public class emDuChk extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public emDuChk() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		IMemberService service = MemberServiceImpl.getIntance();
		
		String email = request.getParameter("email");
		System.out.println("이메일:"+email);
		String returnmem_email=service.getMemberEmail(email);
		System.out.println("리턴맴이메일:"+returnmem_email);
		request.setAttribute("res", returnmem_email);
		
		request.getRequestDispatcher("join/strresult2.jsp").forward(request, response);
		
		
	
	}

}
