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
 * 시설의 장소를 추가하는 클래스
 */
@WebServlet("/PlaceInsert.do")
public class PlaceInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public PlaceInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PlaceVO vo = new PlaceVO();
		
		vo.setFacilities_no(request.getParameter("facilities_no"));
		vo.setPlace_name(request.getParameter("place_name"));
		vo.setPlace_info(request.getParameter("place_info"));
		vo.setPlace_price(Integer.parseInt(request.getParameter("place_price")));
		IManagementService service = ManagementServiceImpl.getInstance();
		int num = service.insertPlace(vo);
		System.out.println("쿼리 수행 여부 확인 num=" +num);
		request.setAttribute("res", num);
		
		if(num!=0) {
			request.getRequestDispatcher("join/intresult.jsp").forward(request, response);
		}
		
	}

}
