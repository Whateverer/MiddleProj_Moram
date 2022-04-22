package moram.join.controller;

import java.io.IOException;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class emValChk
 */
@WebServlet("/emValChk.do")
public class emValChk extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public emValChk() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		HttpSession sessionchk = request.getSession();
		
				int random = (int) sessionchk.getAttribute("random");
	    System.out.println("Session random :" + random);
				
	    		int useremvalchk =  Integer.parseInt(request.getParameter("emvalchk"));
	    		System.out.println("유저가 입력한 난수 : "+useremvalchk);
	    		String res = null;
	    		if(random == useremvalchk) {
	    			res= "인증성공";
	    		}else {
	    			res= null;
	    		}
	    		request.setAttribute("res", res);
	    		request.getRequestDispatcher("join/valresult.jsp").forward(request, response);
	    	
	       
	}

}
