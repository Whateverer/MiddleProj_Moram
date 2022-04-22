package moram.management.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import moram.ibatis.config.SqlMapClientFactory;
import moram.vo.ClassVO;
import moram.vo.FacilitiesVO;
import moram.vo.MemberVO;
import moram.vo.MoramMemberVO;
import moram.vo.MoramVO;
import moram.vo.PlaceTimeVO;
import moram.vo.PlaceVO;
import moram.vo.TeacherVO;

public class ManagementDaoImpl implements IManagementDao{

	private static ManagementDaoImpl dao;
	private static SqlMapClient smc;
	
	private ManagementDaoImpl() {
		smc = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static ManagementDaoImpl getInstance() {
		if(dao==null) dao = new ManagementDaoImpl();
		return dao;
	}
	
//	public List<MemberVO> memberInfo() throws SQLException {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	@Override
//	public int updateMemInfo() throws SQLException {
//		// TODO Auto-generated method stub
//		return 0;
//	}
//
//	@Override
//	public List<MoramVO> moramInfo() throws SQLException {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	@Override
//	public MemberVO moramMemInfo() throws SQLException {
//		// TODO Auto-generated method stub
//		return null;
//	}

	@Override
	public int moramUpdate(MoramVO vo) throws SQLException {
		
		return smc.update("management.moramUpdate",vo);
	}

	@Override
	public List<MoramVO> moramInfo() throws SQLException {
		// TODO Auto-generated method stub
		return smc.queryForList("management.getMoramList");
	}

	@Override
	public List<MemberVO> memberInfo() throws SQLException {
		  
		return smc.queryForList("management.getMemberList");
	}

	@Override
	public List<ClassVO> classInfo2() throws SQLException {
		// TODO Auto-generated method stub
		return smc.queryForList("management.getClassList");
	}

	@Override
	public int classUpdate2(ClassVO vo) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<FacilitiesVO> facilityListM() throws SQLException {
		// 
		return smc.queryForList("management.getfacilitiesList");
	}

	@Override
	public List<PlaceVO> placeListM() throws SQLException {
	
		return smc.queryForList("management.getplaceList");
	}

	@Override
	public int updatePlace(PlaceVO vo) throws SQLException {
		// TODO Auto-generated method stub
		return smc.update("management.placeUpdate",vo);
	}

	@Override
	public int updateFacility(FacilitiesVO vo) throws SQLException {
		// TODO Auto-generated method stub
		return smc.update("management.facilitiesUpdate",vo);
	}

	@Override
	public List<PlaceTimeVO> placeTimeListM() throws SQLException {
		// TODO Auto-generated method stub
		return smc.queryForList("management.getplaceTimeList");
	}

	@Override
	public int insertFacility(FacilitiesVO vo) throws SQLException {
		
		return smc.update("management.facilitiesInsert",vo);
	}

	@Override
	public int insertPlace(PlaceVO vo) throws SQLException {
		// TODO Auto-generated method stub
		return (int) smc.insert("management.insertplace",vo);
	}

	@Override
	public List<MemberVO> getWeimMemberList() throws SQLException {
		// TODO Auto-generated method stub
		return smc.queryForList("management.getWeimMemberList");
	}

	@Override
	public List<TeacherVO> getTchAplyList() throws SQLException {
		// TODO Auto-generated method stub
		return smc.queryForList("management.getTchAplyList");
	}

	@Override
	public List<MoramMemberVO> getMoramjigiList() throws SQLException {
		// TODO Auto-generated method stub
		return smc.queryForList("management.getMoramjigiList");
	}

	@Override
	public int updateMoramjigi(MoramMemberVO vo) throws SQLException {
		// TODO Auto-generated method stub
		return smc.update("management.updateMoramjigi",vo);
	}

	@Override
	public int updateTeacher(MemberVO vo) throws SQLException {
		// TODO Auto-generated method stub
		return smc.update("management.updateTeacher",vo);
	}


//	@Override
//	public int updateMoramMem() throws SQLException {
//		// TODO Auto-generated method stub
//		return 0;
//	}
//
//	@Override
//	public List<ClassVO> classInfo() throws SQLException {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	@Override
//	public int updateClassInfo() throws SQLException {
//		// TODO Auto-generated method stub
//		return 0;
//	}
//
//	@Override
//	public List<FacilitiesVO> facilityInfo() throws SQLException {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	@Override
//	public String insertFacility() throws SQLException {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	@Override
//	public int updateFacility() throws SQLException {
//		// TODO Auto-generated method stub
//		return 0;
//	}
//
//	@Override
//	public int updatePlace() throws SQLException {
//		// TODO Auto-generated method stub
//		return 0;
//	}
//
//	@Override
//	public int deletePlace() throws SQLException {
//		// TODO Auto-generated method stub
//		return 0;
//	}
//
//	@Override
//	public String inserPlaceTimet() throws SQLException {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	@Override
//	public int updatePlaceTime() throws SQLException {
//		// TODO Auto-generated method stub
//		return 0;
//	}
//
//	@Override
//	public int deletePlaceTime() throws SQLException {
//		// TODO Auto-generated method stub
//		return 0;
//	}

}
