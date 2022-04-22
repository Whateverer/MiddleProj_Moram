package moram.place.controller;

import java.io.IOException;
import java.io.PrintWriter;
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


@WebServlet("/CatFacilitiesList.do")
public class CatFacilitiesList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset = utf-8");
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		
		PlaceDaoImpl dao = PlaceDaoImpl.getInstance();
		PlaceServiceImpl service = PlaceServiceImpl.getInstance();
		String subject_name = request.getParameter("subject_name");
//		int subject_no = Integer.parseInt(request.getParameter("subject_no"));
//		System.out.println(subject_no + "asas");
		List<FacilitiesVO>catFacilitiesList = service.catFacilitiesList(subject_name);

		String jsonData = gson.toJson(catFacilitiesList);
		out.write(jsonData);
		response.flushBuffer();
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
