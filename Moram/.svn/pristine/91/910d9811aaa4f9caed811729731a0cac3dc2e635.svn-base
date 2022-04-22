package moram.management.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import moram.management.service.IManagementService;
import moram.management.service.ManagementServiceImpl;
import moram.vo.MoramVO;

/**
 * 모람정보를 수정하는 클래스
 */
@WebServlet("/moramUpdate.do")
public class moramUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public moramUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		MoramVO vo = new MoramVO();
		//0 클라이언트 요청 전송시 값 가져오기.
		
		vo.setMr_no(request.getParameter("mrno"));
		vo.setMoramjigi(request.getParameter("moramjigi"));
		vo.setMr_info(request.getParameter("mrinfo"));
		vo.setMr_image(request.getParameter("mrimage"));
		vo.setMr_cdate(request.getParameter("mrcdate"));
		vo.setMr_limit(Integer.parseInt(request.getParameter("mrlimit")));
		vo.setSubscribe_no(Integer.parseInt(request.getParameter("subscribeno")));
		vo.setMr_rgn(request.getParameter("mrrgn"));
		vo.setSubject_no(Integer.parseInt(request.getParameter("subjectno")));
		vo.setMr_state(request.getParameter("mrstate"));
		//0-1 ip 설정 
		
		//1. service 객체 얻기
		IManagementService service = ManagementServiceImpl.getInstance();
		//2. service 메소드 호출 - 결과값
			int num = service.moramUpdate(vo);
		//3. request. 에 저장.
			request.setAttribute("res", num);
		//4. jsp 로 
			
			if(num!=0) {
				request.getRequestDispatcher("management/intresult2.jsp").forward(request, response);
			}
			
				
		
	}
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
}
