package moram.moramboard.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.google.gson.Gson;

import moram.moramboard.service.IMoramBoardService;
import moram.moramboard.service.MoramBoradServiceImpl;
import moram.vo.BoardVO;


@WebServlet("/MrBoardDelete.do")
public class MrBoardDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		int boardNo = Integer.parseInt(request.getParameter("board_no"));
		
		IMoramBoardService service = MoramBoradServiceImpl.getInstance();
		
		service.deleteBoardReply(boardNo);
		service.deleteBoardAttach(boardNo);
		int res = service.deleteMrBoard(boardNo);
		
		request.setAttribute("res", res);
		
		request.getRequestDispatcher("moram/result.jsp").forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
