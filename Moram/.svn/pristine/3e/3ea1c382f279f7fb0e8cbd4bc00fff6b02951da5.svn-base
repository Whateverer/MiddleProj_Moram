package moram.place.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import moram.place.dao.IPlaceDao;
import moram.place.dao.PlaceDaoImpl;
import moram.vo.CalendarVO;
import moram.vo.FacilitiesReviewVO;
import moram.vo.FacilitiesVO;
import moram.vo.PlacePayVO;

public class PlaceServiceImpl implements IPlaceService {
	
	private IPlaceDao dao;
	
	private static PlaceServiceImpl service;
	
	private PlaceServiceImpl() {
		dao = PlaceDaoImpl.getInstance();
		
	}
	
	public static PlaceServiceImpl getInstance() {
		if(service ==null) service = new PlaceServiceImpl();
		
		return service;
	}

	@Override
	public List<FacilitiesVO> getAllFacilitiesList() {
		List<FacilitiesVO>allFacilitiesList = null;
		try {
			allFacilitiesList = dao.getAllFacilitiesList();
		} catch (SQLException e) {
			allFacilitiesList = null;
			e.printStackTrace();
		}
		return allFacilitiesList;
		
	}

//	@Override
//	public List<FacilitiesVO> catFacilitiesList(int subject_no) {
//		List<FacilitiesVO>catFacilitiesList = null;
//		try {
//			catFacilitiesList = dao.catFacilitiesList(subject_no);
//		} catch (SQLException e) {
//			catFacilitiesList = null;
//			e.printStackTrace();
//		}
//		
//		return catFacilitiesList;
//	}
	
	@Override
	public List<CalendarVO> rezPlace(String placetime_state) {
		List<CalendarVO>rezPlace = null;
		
		try {
			rezPlace =dao.rezPlace(placetime_state);
		} catch (SQLException e) {
			rezPlace = null;
			e.printStackTrace();
		}
		return rezPlace;
	}

	@Override
	public List<FacilitiesVO> catFacilitiesList(String subject_name) {
		List<FacilitiesVO>catFacilitiesList = null;
		try {
			catFacilitiesList = dao.catFacilitiesList(subject_name);
		} catch (SQLException e) {
			catFacilitiesList = null;
			e.printStackTrace();
		}
		
		return catFacilitiesList;
	}

	@Override
	public List<FacilitiesVO> facilityInfo(String facilities_no) {
		List<FacilitiesVO>facilityInfo = null;
		try {
			facilityInfo = dao.facilityInfo(facilities_no);
		} catch (SQLException e) {
			facilityInfo = null;
			e.printStackTrace();
		}
		return facilityInfo;
	}

	@Override
	public List<FacilitiesReviewVO> facilityReview(String facilities_no) {
		List<FacilitiesReviewVO>facilityReview = null;
		try {
			facilityReview = dao.facilityReview(facilities_no);
		} catch (SQLException e) {
			facilityReview = null;
			e.printStackTrace();
		}
		return facilityReview;
	}

	@Override
	public String placePay(PlacePayVO vo) {
		String result = "";
		try {
			result = dao.placePay(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}




	
}
