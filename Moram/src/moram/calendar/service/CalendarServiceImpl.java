package moram.calendar.service;

import java.sql.SQLException;
import java.util.ArrayList;

import moram.calendar.dao.CalendarDaoImpl;
import moram.calendar.dao.ICalendarDao;
import moram.vo.Calendar2VO;



public class CalendarServiceImpl implements ICalendarService{

	private ICalendarDao dao;
	private static CalendarServiceImpl service;
	
	private CalendarServiceImpl() {
		dao = CalendarDaoImpl.getInstance();
	}
	
	public static CalendarServiceImpl getInstance() {
		if(service==null) service = new CalendarServiceImpl();
		return service;
	}
	
	@Override
	public ArrayList<Calendar2VO> calenList(String place_no) {
		ArrayList<Calendar2VO> list = new ArrayList<>();
		try {
			list = dao.calenList(place_no);
		} catch (SQLException e) {
			list = null;
			e.printStackTrace();
		}
		return list;
	}

}
