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
import moram.place.service.PlaceServiceImpl;
import moram.vo.CalendarVO;


/**
 * Servlet implementation class RezPlace
 */
@WebServlet("/RezPlace.do")
public class RezPlace extends HttpServlet {
	private static final long serialVersionUID = 1L;
   

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("RezPlace -> doGet에 왔다");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset = utf-8");
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		
		PlaceDaoImpl dao = PlaceDaoImpl.getInstance();
		PlaceServiceImpl service = PlaceServiceImpl.getInstance();
		String place_no = request.getParameter("place_no");
		System.out.println("place_no : " + place_no);
		List<CalendarVO> rezPlace = service.rezPlace(place_no);
		
		String jsonData = gson.toJson(rezPlace);
		System.out.println(jsonData + "입니다.");
		out.write(jsonData);
		response.flushBuffer();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("RezPlace -> doPost에 왔다");
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
