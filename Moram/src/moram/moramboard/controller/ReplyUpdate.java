package moram.moramboard.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import moram.moramboard.service.IMoramBoardService;
import moram.moramboard.service.MoramBoradServiceImpl;
import moram.vo.ReplyVO;


@WebServlet("/ReplyUpdate.do")
public class ReplyUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		ReplyVO vo = new ReplyVO();
		vo.setReply_no(Integer.parseInt(request.getParameter("reply_no")));
		vo.setReply_cont(request.getParameter("reply_cont"));
		
		IMoramBoardService service= MoramBoradServiceImpl.getInstance();
		
		int res = service.updateReply(vo);
		
		request.setAttribute("res", res);
		
		request.getRequestDispatcher("moram/result.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
