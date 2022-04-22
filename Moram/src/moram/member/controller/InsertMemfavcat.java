package moram.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import moram.member.service.IMemberService;
import moram.member.service.MemberServiceImpl;
import moram.vo.MemfavcatVO;

/**
 * 회원가입시, 아이디, 선호 카테고리를  <회원선호 카테고리 테이블>에 입력하는 서블릿 
 */
@WebServlet("/InsertMemfavcat.do")
public class InsertMemfavcat extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public InsertMemfavcat() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("utf-8");
		MemfavcatVO vo = new MemfavcatVO();
		
		//0. 클라이언트 요청시 전송값
		
		vo.setMem_id(request.getParameter("id"));
		vo.setMem_id(request.getParameter("hobby"));
	
		IMemberService service = MemberServiceImpl.getIntance();
		
		int num = service.insertMemfavcat(vo);
		
		request.setAttribute("res", num);
		
		request.getRequestDispatcher("join/result.jsp").forward(request, response);
		
		
		
		
		
	}

}
