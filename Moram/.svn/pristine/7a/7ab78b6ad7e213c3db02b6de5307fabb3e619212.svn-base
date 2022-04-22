package moram.moramboard.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import com.google.gson.Gson;

import moram.moramboard.service.IMoramBoardService;
import moram.moramboard.service.MoramBoradServiceImpl;
import moram.vo.BoardVO;


/**
 * Servlet implementation class MrBoardInfo
 */
@WebServlet("/MrBoardInfo.do")
public class MrBoardInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		// 데이터가져오기
		BoardVO vo = new BoardVO();
		try {
			BeanUtils.populate(vo, request.getParameterMap());
		
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		int boardNo = vo.getBoard_no();
		
		IMoramBoardService service = MoramBoradServiceImpl.getInstance();
		
		BoardVO board = service.moramBoardInfo(vo);
		
		
		
		String board_cont = board.getBoard_cont().replaceAll("\r", "").replaceAll("\n", "<br>");
		board.setBoard_cont(board_cont);
		
		Gson gson = new Gson();
		
		String jsonData = null;
		
		jsonData = gson.toJson(board);		
		
		out.println(jsonData);
		
		response.flushBuffer();
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
