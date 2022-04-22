package moram.calendar.service;

import java.util.ArrayList;

import moram.vo.Calendar2VO;


public interface ICalendarService {
	public ArrayList<Calendar2VO> calenList(String place_no);
}
