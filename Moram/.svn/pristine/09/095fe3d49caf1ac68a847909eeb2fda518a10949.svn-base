package moram.place.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapException;

import moram.vo.CalendarVO;
import moram.vo.FacilitiesReviewVO;
import moram.vo.FacilitiesVO;
import moram.vo.PlacePayVO;

public interface IPlaceDao {
	public List<FacilitiesVO> getAllFacilitiesList() throws SQLException;
	
//	public List<FacilitiesVO> catFacilitiesList(int subject_no) throws SQLException;
	public List<FacilitiesVO> catFacilitiesList(String subject_name) throws SQLException;
	public List<FacilitiesVO> facilityInfo(String facilities_no) throws SQLException;
	public List<FacilitiesReviewVO>facilityReview(String facilities_no) throws SQLException;
	public List<CalendarVO>rezPlace(String placetime_state) throws SQLException;
	public String placePay(PlacePayVO vo) throws SQLException;

}
