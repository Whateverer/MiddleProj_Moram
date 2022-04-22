package moram.management.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import moram.management.service.IManagementService;
import moram.management.service.ManagementServiceImpl;
import moram.vo.FacilitiesVO;

/**
 * Servlet 시설을 조회하고 출력하는 클래스
 */
@WebServlet("/FacilityListM.do")
public class FacilityListM extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public FacilityListM() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
	    IManagementService service = ManagementServiceImpl.getInstance();
	    
	    List<FacilitiesVO>faclist2 = service.facilityListM();
	    
	    request.setAttribute("faclist2", faclist2);
	    request.getRequestDispatcher("/management/FacilityList.jsp").forward(request, response);
	    
	}

}
