package moram.calendar.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import moram.calendar.service.CalendarServiceImpl;
import moram.calendar.service.ICalendarService;
import moram.vo.Calendar2VO;



@WebServlet("/calendar.do")
public class Calendar extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
   		response.setContentType("text/html; charset=utf-8");
   		
   		//0.
   		String place_no = request.getParameter("place_no");
   		System.out.println(place_no + "파라미터");
   		//System.out.println(test);
   		//1.
   		ICalendarService service = CalendarServiceImpl.getInstance();
   		//2.
   		ArrayList<Calendar2VO> calList = service.calenList(place_no);
   		System.out.println(calList);
   		//3.
   		request.setAttribute("res", calList);
   		//4.
   		request.getRequestDispatcher("calendar/calendar.jsp").forward(request, response);
   		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, resp);
	}

}
