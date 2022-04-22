package moram.management.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import moram.management.service.IManagementService;
import moram.management.service.ManagementServiceImpl;
import moram.vo.FacilitiesVO;

/**
 *시설 정보를 수정하는 클래스
 */
@WebServlet("/FacilityUpdate.do")
public class FacilityUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public FacilityUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		FacilitiesVO vo = new FacilitiesVO();
		
		vo.setFacilities_no(request.getParameter("facilities_no"));
		vo.setFacilities_name(request.getParameter("facilities_name"));
		vo.setFacilites_info(request.getParameter("facilities_info"));
		vo.setFacilites_jdate(request.getParameter("facilities_jdate"));
		vo.setFacilites_jstate(request.getParameter("facilities_jstate"));
		vo.setFacilites_addr(request.getParameter("facilities_addr"));
		vo.setFacilites_rgn(request.getParameter("facilities_rgn"));
		vo.setSubject_no(Integer.parseInt(request.getParameter("subjectno")));
		
		IManagementService service = ManagementServiceImpl.getInstance();
		
		int updateFacility = service.updateFacility(vo);
		
		request.setAttribute("res", updateFacility);
		
		request.getRequestDispatcher("result/resultInt.jsp").forward(request, response);
		
		
	}

}
