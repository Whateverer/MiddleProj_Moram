package moram.adminboard.controller;

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

import moram.adminboard.service.AdminBoardServiceImpl;
import moram.adminboard.service.IAdminBoardService;
import moram.vo.BoardVO;


@WebServlet("/adminBoardInsert.do")
public class AdminBoardInsert extends HttpServlet {
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
		
		IAdminBoardService service = AdminBoardServiceImpl.getInstance();
		
		int res = service.insertAdminBoard(vo);
		
		Gson gson = new Gson();
		
		String jsonData = null;
		
		jsonData = gson.toJson(vo);		
		
		out.println(jsonData);
		
		response.flushBuffer();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
