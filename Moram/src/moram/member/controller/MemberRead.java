package moram.member.controller;

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
 * Servlet implementation class MemberRead
 */
@WebServlet("/MemberRead.do")
public class MemberRead extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberRead() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		MemberVO vo = new MemberVO();
		IMemberService service = MemberServiceImpl.getIntance();
		//2. service 메소드 호출 - 결과값
		vo = service.getLoginMember(vo);
	//3. request. 에 저장.
		request.setAttribute("res", vo);
	//4. jsp 로 
		request.getRequestDispatcher("member/mypage.jsp").forward(request, response);
			
	}

}
