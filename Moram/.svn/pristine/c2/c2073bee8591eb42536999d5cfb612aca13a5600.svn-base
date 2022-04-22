package moram.management.service;
import java.sql.SQLException;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

import moram.management.dao.IManagementDao;
import moram.management.dao.ManagementDaoImpl;
import moram.vo.ClassVO;
import moram.vo.FacilitiesVO;
import moram.vo.MemberVO;
import moram.vo.MoramMemberVO;
import moram.vo.MoramVO;
import moram.vo.PlaceTimeVO;
import moram.vo.PlaceVO;
import moram.vo.TeacherVO;


public class ManagementServiceImpl implements IManagementService {

	private IManagementDao dao;
	
	private static ManagementServiceImpl managementService;
	

	private ManagementServiceImpl() {
		
		dao = ManagementDaoImpl.getInstance();
	}
	
	public static ManagementServiceImpl getInstance() {
	if(managementService == null) managementService = new ManagementServiceImpl();
		
		return managementService;
		
	}
	
//	@Override
//	public List<MemberVO> memberInfo() {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	@Override
//	public int updateMemInfo() {
//		// TODO Auto-generated method stub
//		return 0;
//	}
//
//	@Override
//	public List<MoramVO> moramInfo() {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	@Override
//	public MemberVO moramMemInfo() {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
	@Override
	public int moramUpdate(MoramVO vo) {
		int val = 0;
		try {
			val=dao.moramUpdate(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return val;
	}
//
//	@Override
//	public int updateMoramMem() {
//		// TODO Auto-generated method stub
//		return 0;
//	}
//
//
//
//	@Override
//	public int updateClassInfo() {
//		// TODO Auto-generated method stub
//		return 0;
//	}
//
//	@Override
//	public List<FacilitiesVO> facilityInfo() {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	@Override
//	public String insertFacility() {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	@Override
//	public int updateFacility() {
//		// TODO Auto-generated method stub
//		return 0;
//	}
//
//	@Override
//	public int updatePlace() {
//		// TODO Auto-generated method stub
//		return 0;
//	}
//
//	@Override
//	public int deletePlace() {
//		// TODO Auto-generated method stub
//		return 0;
//	}
//
//	@Override
//	public String inserPlaceTimet() {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	@Override
//	public int updatePlaceTime() {
//		// TODO Auto-generated method stub
//		return 0;
//	}
//
//	@Override
//	public int deletePlaceTime() {
//		// TODO Auto-generated method stub
//		return 0;
//	}
//
//
//	@Override
//	public List<ClassVO> classInfo() {
//		// TODO Auto-generated method stub
//		return null;
//	}

	@Override
	public List<MoramVO> moramInfo() {
		List<MoramVO> list = null;
		
		try {
			list=dao.moramInfo();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<MemberVO> memberInfo() {
		List<MemberVO> list = null; 
		
		try {
			list = dao.memberInfo();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<ClassVO> classInfo2() {
		List<ClassVO> list = null;
		
		try {
			list = dao.classInfo2();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int classUpdate2(ClassVO vo) {
		int val =0;
		
		try {
			val=dao.classUpdate2(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public List<FacilitiesVO> facilityListM() {
		List<FacilitiesVO> list = null;
		
		try {
			list = dao.facilityListM();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<PlaceVO> placeListM() {
		List<PlaceVO> list =null;
		
		try {
			list = dao.placeListM();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int updatePlace(PlaceVO vo) {
		int val = 0;
		
		try {
			val = dao.updatePlace(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return val;
	}

	@Override
	public int updateFacility(FacilitiesVO vo) {
		
		int val = 0;
		try {
			val = dao.updateFacility(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return val;
	}

	@Override
	public List<PlaceTimeVO> placeTimeListM() {

		List<PlaceTimeVO> list = null;
		
		try {
			list = dao.placeTimeListM();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int insertFacility(FacilitiesVO vo) {
		int val = 0;
		
		try {
			val =dao.insertFacility(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return val;
	}


	@Override
	public int insertPlace(PlaceVO vo) {
		int val = 0;
		
		try {
			val = dao.insertPlace(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return val;
	}


	@Override
	public List<MemberVO> getWeimMemberList() {
		List<MemberVO> list = null;
		
		try {
			list = dao.getWeimMemberList();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<TeacherVO> getTchAplyList() {
		List<TeacherVO> list = null;
		
		try {
			list = dao.getTchAplyList();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<MoramMemberVO> getMoramjigiList() {
		List<MoramMemberVO> list =null;
		
		try {
			list = dao.getMoramjigiList();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int updateMoramjigi(MoramMemberVO vo) {

		int val = 0;
		try {
			val = dao.updateMoramjigi(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return val;
	}

	@Override
	public int updateTeacher(MemberVO vo) {
		
		int val =0;
		try {
			val = dao.updateTeacher(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return val;
	}

	
}
