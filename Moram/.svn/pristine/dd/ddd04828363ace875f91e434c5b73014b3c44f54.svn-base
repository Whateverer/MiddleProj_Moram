package moram.mypage.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import moram.mypage.service.IMypageService;
import moram.mypage.service.MypageServiceImpl;
import moram.vo.TeacherVO;

@WebServlet("/TeacherApply.do")
public class TeacherApply extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		
		IMypageService service = MypageServiceImpl.getInstance();
		
		TeacherVO vo = new TeacherVO();
		
		String content = request.getParameter("content");
		
		vo.setTeacher_plan(content);
		
		HttpSession session = request.getSession();
		String memId = (String) session.getAttribute("sessionId");
		
		vo.setMem_id(memId);  // 나중에 세션 으로 바꿔줘야함 .request.getSession();
		
		Object success = service.teacherApply(vo);
		
		String str = "";
		
		if(success == null) {  // 나중에는 세션아이디로 교체
			str = memId + " 님 정상적으로 신청되었습니다.";  
		}else {
			str = memId + " 님 신청 실패";
		}
		
		String jsonData = gson.toJson(str);
		
		out.write(jsonData);
		response.flushBuffer();
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
