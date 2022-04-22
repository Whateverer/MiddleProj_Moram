package moram.calendar.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import com.ibatis.sqlmap.client.SqlMapClient;

import moram.ibatis.config.SqlMapClientFactory;
import moram.vo.Calendar2VO;





public class CalendarDaoImpl implements ICalendarDao{

	private SqlMapClient smc;
	private static CalendarDaoImpl dao;
	
	private CalendarDaoImpl() {
		smc = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static CalendarDaoImpl getInstance() {
		if(dao==null) dao = new CalendarDaoImpl();
		return dao;
	}
	
	
	@Override
	public ArrayList<Calendar2VO> calenList(String place_no) throws SQLException {
		return (ArrayList<Calendar2VO>)smc.queryForList("calendar.calenList", place_no);
	}
}
