package moram.place.service;

import java.util.List;

import moram.vo.CalendarVO;
import moram.vo.FacilitiesReviewVO;
import moram.vo.FacilitiesVO;
import moram.vo.PlacePayVO;

public interface IPlaceService {

	public List<FacilitiesVO> getAllFacilitiesList();
	
//	public List<FacilitiesVO> catFacilitiesList(int subject_no);
	public List<FacilitiesVO> catFacilitiesList(String subject_name);
	public List<FacilitiesVO> facilityInfo(String facilities_no);
	
	public List<FacilitiesReviewVO>facilityReview(String facilities_no);
	public List<CalendarVO>rezPlace(String placetime_state);
	public String placePay(PlacePayVO vo);
}
