package moram.moramboard.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import moram.moramboard.service.IMoramBoardService;
import moram.moramboard.service.MoramBoradServiceImpl;


@WebServlet("/BoardHitUpdate.do")
public class BoardHitUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		int boardNo = Integer.parseInt(request.getParameter("board_no"));
		
		IMoramBoardService service= MoramBoradServiceImpl.getInstance();
		
		int res = service.updateBoardHit(boardNo);
		
		request.setAttribute("res", res);
		
		request.getRequestDispatcher("moram/result.jsp").forward(request, response);
		  
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
