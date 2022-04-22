package moram.place.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import moram.place.dao.PlaceDaoImpl;
import moram.place.service.PlaceServiceImpl;
import moram.vo.FacilitiesVO;


@WebServlet("/AllFacilitiesList.do")
public class AllFacilitiesList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset = utf-8");
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		
		PlaceDaoImpl dao = PlaceDaoImpl.getInstance();
		PlaceServiceImpl service = PlaceServiceImpl.getInstance();
		List<FacilitiesVO>allFacilitiesList = service.getAllFacilitiesList();
		
		String jsonData = gson.toJson(allFacilitiesList);
		System.out.println(allFacilitiesList);
		
		out.write(jsonData);
		response.flushBuffer();
//		request.setAttribute("AllFacilitiesList", allFacilitiesList);
//		
//		
//		RequestDispatcher rd = request.getRequestDispatcher("/place/allFacilitiesList.jsp");
//		
//		rd.forward(request, response);
		
//		String jsonData = gson.toJson(allFacilitiesList);
//		out.write(jsonData);
//		response.flushBuffer();
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
