package moram.management.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import moram.management.dao.IManagementDao;
import moram.management.service.IManagementService;
import moram.management.service.ManagementServiceImpl;
import moram.vo.FacilitiesVO;

/**
 * Servlet 시설을 추가하는 클래스
 */
@WebServlet("/FacilityInsert.do")
public class FacilityInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public FacilityInsert() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void dopost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		FacilitiesVO vo = new FacilitiesVO();

		vo.setFacilities_no(request.getParameter("facilities_no"));
		vo.setFacilities_name(request.getParameter("facilities_name"));
		vo.setFacilites_rgn(request.getParameter("facilites_rgn"));
		vo.setFacilites_info(request.getParameter("facilites_info"));
		vo.setFacilites_addr(request.getParameter("facilites_addr"));
		vo.setFacilites_jdate(request.getParameter("facilites_jdate"));
		vo.setFacilites_jstate(request.getParameter("facilites_jstate"));
		vo.setSubject_no(Integer.parseInt(request.getParameter("subject_no")));
		IManagementService service = ManagementServiceImpl.getInstance();
		
		int num = service.insertFacility(vo);
		System.out.println("쿼리 수행 여부 확인 num=" +num);
		request.setAttribute("res", num);
		//4. jsp 로 
		
		if(num!=0) {
			request.getRequestDispatcher("join/intresult.jsp").forward(request, response);
		}
		
		
	}
	

}
