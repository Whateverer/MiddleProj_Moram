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
import moram.vo.PlaceVO;

/**
 * Servlet implementation class PlaceListM
 */
@WebServlet("/PlaceListM.do")
public class PlaceListM extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public PlaceListM() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
	    IManagementService service = ManagementServiceImpl.getInstance();

	    List<PlaceVO>Placelist2 = service.placeListM();
	    
	    request.setAttribute("Placelist2", Placelist2);
	    request.getRequestDispatcher("/management/plcList.jsp").forward(request, response);
	    
	    
	}

}
