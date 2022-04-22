package moram.join.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import moram.member.service.IMemberService;
import moram.member.service.MemberServiceImpl;
import moram.vo.MemberVO;

/**
 * 입력한 아이디가 이미 가입된 아이디인지 확인하는 서블릿
 */
@WebServlet("/idDuChk.do")
public class idDuChk extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public idDuChk() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		IMemberService service = MemberServiceImpl.getIntance();
		String mem_id =request.getParameter("id");
		
		String returnmem_id =service.getMemberCount(mem_id);
	
	//3. request. 에 저장.
		request.setAttribute("res", returnmem_id);
	//4. jsp 로 
		request.getRequestDispatcher("join/strresult.jsp").forward(request, response);
	}
}
