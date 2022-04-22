package moram.clas.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.google.gson.Gson;

import moram.clas.service.ClasServiceImpl;
import moram.clas.service.IClasService;
import moram.vo.ClassReplyVO;
import moram.vo.ClassVO;

@WebServlet("/ClassReplyList.do")
public class ClassReplyList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		
		ClassReplyVO vo = new ClassReplyVO();
		
		try {
			BeanUtils.populate(vo, request.getParameterMap());
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		IClasService service = ClasServiceImpl.getInstance();
		
		List<ClassVO> list = service.classReplyList(vo);

		Gson gson = new Gson();
		
		String jsonData = null;
		
		jsonData = gson.toJson(list);		
		
		out.println(jsonData);
		
		response.flushBuffer();
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
