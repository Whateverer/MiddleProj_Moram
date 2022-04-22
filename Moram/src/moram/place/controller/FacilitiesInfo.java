package moram.place.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import moram.place.dao.PlaceDaoImpl;
import moram.place.service.IPlaceService;
import moram.place.service.PlaceServiceImpl;
import moram.vo.FacilitiesVO;
import moram.vo.PlaceVO;


@WebServlet("/FacilitiesInfo.do")
public class FacilitiesInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset = utf-8");
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		PlaceDaoImpl dao = PlaceDaoImpl.getInstance();
		PlaceServiceImpl service = PlaceServiceImpl.getInstance();
		
		String facilities_no = request.getParameter("facilities_no");
		System.out.println(facilities_no);
		
		
		List<FacilitiesVO> facVo = service.facilityInfo(facilities_no);
		
		String jsonData = gson.toJson(facVo);
		out.write(jsonData);
		response.flushBuffer();
		

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
