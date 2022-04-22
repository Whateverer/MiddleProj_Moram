package moram.place.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import moram.ibatis.config.SqlMapClientFactory;
import moram.vo.CalendarVO;
import moram.vo.FacilitiesReviewVO;
import moram.vo.FacilitiesVO;
import moram.vo.PlacePayVO;

public class PlaceDaoImpl implements IPlaceDao{
	private SqlMapClient smc = null;
	
	private static PlaceDaoImpl dao;
	
	private PlaceDaoImpl() {
		smc = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static PlaceDaoImpl getInstance() {
		if(dao == null) dao = new PlaceDaoImpl();
		
		return dao;
	}

	@Override
	public List<CalendarVO> rezPlace(String placetime_state) throws SQLException {
		List<CalendarVO>rezPlace = new ArrayList<>();
		
		rezPlace = smc.queryForList("facilities.rezPlace",placetime_state);
		return rezPlace;
	}

	@Override
	public List<FacilitiesVO> getAllFacilitiesList(){
		List<FacilitiesVO> allFacilitiesList = new ArrayList<>();
		
		
			try {
				allFacilitiesList = smc.queryForList("facilities.allFacilitiesList");
			} catch (SQLException e) {
				allFacilitiesList = null;
				e.printStackTrace();
			}
			System.out.println(allFacilitiesList);
			
		return allFacilitiesList;
	}

//	@Override
//	public List<FacilitiesVO> catFacilitiesList(int subject_no){
//		List<FacilitiesVO>catFacilitiesList = new ArrayList<>();
//		
//		try {
//			catFacilitiesList = smc.queryForList("facilities.catFacilitiesList",subject_no);
//		} catch (SQLException e) {
//			catFacilitiesList = null;
//			e.printStackTrace();
//		}
//		
//		return catFacilitiesList;
//	}

	@Override
	public String placePay(PlacePayVO vo) throws SQLException {
		
		return (String) smc.insert("facilities.PlacePay",vo);
	}


	@Override
	public List<FacilitiesVO> catFacilitiesList(String subject_name) throws SQLException {
		List<FacilitiesVO>catFacilitiesList = new ArrayList<>();
		
		try {
			catFacilitiesList = smc.queryForList("facilities.catFacilitiesList",subject_name);
		} catch (SQLException e) {
			catFacilitiesList = null;
			e.printStackTrace();
		}
		
		return catFacilitiesList;
	}

	@Override
	public List<FacilitiesVO> facilityInfo(String facilities_no){
		List<FacilitiesVO>facilityInfo =  new ArrayList<>();
		
		try {
			facilityInfo = smc.queryForList("facilities.facilityInfo",facilities_no);
		} catch (SQLException e) {
			facilityInfo = null;
			e.printStackTrace();
		}
		
		return facilityInfo;
	}

	@Override
	public List<FacilitiesReviewVO> facilityReview(String facilities_no) throws SQLException {
		List<FacilitiesReviewVO>facilityReview = new ArrayList<>();
		try {
			facilityReview = smc.queryForList("facilities.facilityReview",facilities_no);
		} catch (Exception e) {
			facilityReview = null;
			e.printStackTrace();
		}
		
		return facilityReview;
	}
	
}
