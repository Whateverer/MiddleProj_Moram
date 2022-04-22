package moram.member.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import moram.member.service.IMemberService;
import moram.member.service.MemberServiceImpl;
import moram.vo.MemberVO;

/**
 * Servlet implementation class MemberUpdate
 */
@WebServlet("/MemberUpdate.do")
public class MemberUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public MemberUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
	
		MemberVO vo = new MemberVO();
		//0 클라이언트 요청 전송시 값 가져오기.
		
		try {
			BeanUtils.populate(vo, request.getParameterMap());
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//0-1 ip 설정 
		
		//1. service 객체 얻기
		IMemberService service = MemberServiceImpl.getIntance();
		//2. service 메소드 호출 - 결과값
			int num = service.updateMember(vo);
		//3. request. 에 저장.
			request.setAttribute("res", num);
		//4. jsp 로 
			request.getRequestDispatcher("session/updateresult.jsp").forward(request, response);
				
		
	}

}
