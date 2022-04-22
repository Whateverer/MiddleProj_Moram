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
 * Servlet implementation class MoramJoin
 */
@WebServlet("/MoramJoin.do")
public class MoramJoin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		MoramMemberVO vo = new MoramMemberVO();
		
		try {
			BeanUtils.populate(vo, request.getParameterMap());
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println("아이디" + vo.getMem_id());
		System.out.println("모람번호" + vo.getMr_no());
		
		IMoramService service = MoramServiceImpl.getInstance();
		
		String res = service.insertMoramMember(vo);
		
		Gson gson = new Gson();
		
		String jsonData = null;
		
		jsonData = gson.toJson(res);		
		
		out.println(jsonData);
		
		response.flushBuffer();
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
