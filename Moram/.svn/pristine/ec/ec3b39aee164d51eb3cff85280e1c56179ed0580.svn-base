package moram.moramboard.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import moram.moramboard.service.IMoramBoardService;
import moram.moramboard.service.MoramBoradServiceImpl;
import moram.vo.ReplyVO;


@WebServlet("/ReplyInsert.do")
public class ReplyInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		ReplyVO vo = new ReplyVO();
		vo.setReply_cont(request.getParameter("reply_cont"));
		vo.setBoard_no(Integer.parseInt(request.getParameter("board_no")));
		vo.setMem_id(request.getParameter("mem_id"));
		
		IMoramBoardService service= MoramBoradServiceImpl.getInstance();
		
		int res = service.insertReply(vo);
		
		request.setAttribute("res", res);
		
		request.getRequestDispatcher("moram/result.jsp").forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
