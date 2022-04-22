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
import moram.vo.PlaceTimeVO;

/**
 * Servlet 장소 시간정보를 리스트로 출력하는 서블릿
 */
@WebServlet("/PlaceTimeList.do")
public class PlaceTimeList extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public PlaceTimeList() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
	    IManagementService service = ManagementServiceImpl.getInstance();
	    List<PlaceTimeVO>placetimelist = service.placeTimeListM();
	    
	    request.setAttribute("placetimelist", placetimelist);
	    request.getRequestDispatcher("/management/plcTimeList.jsp").forward(request, response);

	    
	}


}
