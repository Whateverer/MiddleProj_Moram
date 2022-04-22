package moram.place.controller;

import java.io.Console;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import moram.place.service.IPlaceService;
import moram.place.service.PlaceServiceImpl;
import moram.vo.PlacePayVO;
import moram.vo.PlaceVO;

/**
 * Servlet implementation class PlacePay
 */
@WebServlet("/PlacePay.do")
public class PlacePay extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
	Gson gson = new Gson();
	
	PrintWriter out = response.getWriter();
	
	IPlaceService service = PlaceServiceImpl.getInstance();
	
	PlacePayVO vo = new PlacePayVO();
	
	String placetime_no = request.getParameter("placetime_no");
	int place_pay = Integer.parseInt(request.getParameter("place_pay"));
	
	HttpSession session = request.getSession();
	String mem_id = (String) session.getAttribute("sessionId");
	System.out.println(placetime_no);
	System.out.println(mem_id);
	
	vo.setPlacetime_no(placetime_no);
	vo.setMem_id(mem_id);
	vo.setPlacepay_price(place_pay);
	System.out.println(placetime_no + mem_id  + place_pay);
	
	 String result = service.placePay(vo);
	 System.out.println(result);
	 String jsonData = gson.toJson(result);
	 out.write(jsonData);
	 response.flushBuffer();
	
	}
		
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
