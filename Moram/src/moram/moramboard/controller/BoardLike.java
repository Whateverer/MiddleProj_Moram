package moram.moramboard.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import moram.moramboard.service.IMoramBoardService;
import moram.moramboard.service.MoramBoradServiceImpl;
import moram.vo.BoardLikeVO;


@WebServlet("/BoardLike.do" )
public class BoardLike extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		IMoramBoardService service = MoramBoradServiceImpl.getInstance();
		
		String color = request.getParameter("color");
		int board_no = Integer.parseInt(request.getParameter("board_no"));
		String mem_id = request.getParameter("mem_id");
		
		BoardLikeVO vo = new BoardLikeVO();
		vo.setBoard_no(board_no);
		vo.setMem_id(mem_id);
		System.out.println(color);
		int res =0;
		if(color.equals("gray")) {
			res = service.insertBoardLike(vo);
		}else {
			res = service.deleteBoardLike(vo);
		}
		request.setAttribute("res", res);
		
		request.getRequestDispatcher("moram/result.jsp").forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
