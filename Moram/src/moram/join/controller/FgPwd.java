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
import moram.vo.MemberVO;

/**
 * 아이디, 이름, 생년월일, 이메일을 인증받고 비밀번호를 새롭게 지정하는 서블릿 
 */
@WebServlet("/FgPwd.do")
public class FgPwd extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public FgPwd() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		MemberVO vo = new MemberVO();
		 PrintWriter out = response.getWriter();

		 System.out.println("id=======================" + request.getParameter("id"));
		 
		 System.out.println("name=======================" + request.getParameter("name"));
		 
		 
		vo.setMem_id(request.getParameter("id"));
		vo.setMem_name(request.getParameter("name"));
		vo.setMem_email(request.getParameter("email"));
		vo.setMem_pass(request.getParameter("newpwd"));
		
		
		
		
		
		IMemberService service = MemberServiceImpl.getIntance();
		int updateNP = service.updateNewPwd(vo);
		
		System.out.println("--------------------- updateNP : " + updateNP);
		
		
		request.setAttribute("res", updateNP);
		System.out.println("updateNP=" + request.getAttribute("res"));
	//4. jsp 로 
		
		if(updateNP!=0) {
			
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}else {
			  out.print("<script>"
					  + "alert('아이디나 비밀번호가 틀렸습니다.d');"
					  + "</script>");
		}
		
		
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(request, response);
	}

}
