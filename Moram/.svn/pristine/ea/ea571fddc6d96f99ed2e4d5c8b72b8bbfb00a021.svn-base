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
import moram.vo.MoramVO;

@WebServlet("/MoramInfoUpdate.do")
public class MoramInfoUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		MoramVO vo = new MoramVO();
		
		try {
			BeanUtils.populate(vo, request.getParameterMap());
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		IMoramService service = MoramServiceImpl.getInstance();
		
		int res = service.updateMoraminfo(vo);
		
		Gson gson = new Gson();
		
		String jsonData = null;
		
		jsonData = gson.toJson(vo);
		
		out.println(jsonData);
		
		response.flushBuffer();
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
