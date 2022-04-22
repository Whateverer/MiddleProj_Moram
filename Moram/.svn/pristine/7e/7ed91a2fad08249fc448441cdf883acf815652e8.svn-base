package moram.mypage.controller;

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

import moram.mypage.service.IMypageService;
import moram.mypage.service.MypageServiceImpl;
import moram.vo.MemberVO;

@WebServlet("/MemberInfoUpdate.do")
public class MemberInfoUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		MemberVO vo = new MemberVO();
		String result = "";
		try {
			BeanUtils.populate(vo, request.getParameterMap());
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		
		IMypageService service = MypageServiceImpl.getInstance();
		
		int res = service.memberInfoUpdate(vo);
		
		if(res <= 0) {
			result = "수정 실패";
		}else {
			result = "수정 성공";
		}
		
		String jsonData = gson.toJson(result);
		
		out.write(jsonData);
		response.flushBuffer();
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
