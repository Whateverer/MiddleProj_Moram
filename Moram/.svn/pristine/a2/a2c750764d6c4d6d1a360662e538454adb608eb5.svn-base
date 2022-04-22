package moram.moram.controller;

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

import moram.moram.service.IMoramService;
import moram.moram.service.MoramServiceImpl;
import moram.vo.MoramMemberVO;

/**
 * Servlet implementation class MoramjigiChk
 */
@WebServlet("/MoramjigiChk.do")
public class MoramjigiChk extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=utf-8"); 
		
		PrintWriter out = response.getWriter();
		
		//모람지기 체크하기 
		MoramMemberVO vo = new MoramMemberVO();
		
		//모람번호, 아이디 가져와서 담기
		try {
			BeanUtils.populate(vo, request.getParameterMap());
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		IMoramService service = MoramServiceImpl.getInstance();
		
		//해당 모람의 모람지기면 1, 아니면 2 반환
		int res = service.MoramjigiChk(vo);
		
		Gson gson = new Gson();
		
		String jsonData = null;
		
		jsonData = gson.toJson(res);
		
		out.println(jsonData);
		
		response.flushBuffer();
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
