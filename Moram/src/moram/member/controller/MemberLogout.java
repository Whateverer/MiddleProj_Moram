package moram.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class MemberLogout
 */
@WebServlet("/MemberLogout.do")
public class MemberLogout extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MemberLogout() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그아웃은 세션정보를 모두 삭제하면 된다. 
	response.setCharacterEncoding("utf-8");
	response.setContentType("text/html; charset=utf-8");
	PrintWriter out = response.getWriter();
	
	//Session 삭제하기
	HttpSession session = request.getSession();
	
	//2.removeAttrribute() 메소드로 개별적인 Session 값 삭제하기.
	// ==> 형식) Session 객체.removeAtrribute("key값");
	//			==>  Session 객체는 삭제되지 않고 해당 'key'값에 설정된 'session값' 만 삭제된다. 
	
	//session.removeAttribute("userName");
	//3. invalidate()메소드로 삭제하기
	// 		==> Session 객체 자체가 삭제된다. 
	//형식)  session객체.invalidate();
	session.invalidate();  // 세션 자체를 삭제해서, 세션 안의 모든 정보가 사라짐. 
	
	// 네이버 등에 로그인을 하면, 메일을 쓰던 뭘하던 로그인 정보가 계속 살아있는데, 이게 세션에 로그인정보를 저장하기 때문 
	
	response.sendRedirect(
			request.getContextPath()
			+"login.jsp"
			);
		
	}

}
