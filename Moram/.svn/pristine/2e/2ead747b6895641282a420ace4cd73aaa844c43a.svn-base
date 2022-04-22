package moram.management.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import moram.management.service.IManagementService;
import moram.management.service.ManagementServiceImpl;
import moram.vo.PlaceVO;

/**
 *시설의 장소를 수정하는 클래스
 */
@WebServlet("/PlaceUpdate.do")
public class PlaceUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public PlaceUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		PlaceVO vo = new PlaceVO();
		
		vo.setFacilities_no(request.getParameter("facilities_no"));
		vo.setPlace_no(request.getParameter("place_no"));
		vo.setPlace_name(request.getParameter("place_name"));
		vo.setPlace_info(request.getParameter("place_info"));
		vo.setPlacepay_price(Integer.parseInt(request.getParameter("placepay_price")));
	
		IManagementService service = ManagementServiceImpl.getInstance();
		
		int placeUpdate = service.updatePlace(vo);
		
		request.setAttribute("placeUpdate", placeUpdate);
		
		request.getRequestDispatcher("management/plcList.jsp").forward(request, response);
		
	}

}
