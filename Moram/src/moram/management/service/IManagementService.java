package moram.management.service;
import java.sql.SQLException;
import java.util.List;
import moram.vo.ClassVO;
import moram.vo.FacilitiesVO;
import moram.vo.MemberVO;
import moram.vo.MoramMemberVO;
import moram.vo.MoramVO;
import moram.vo.PlaceTimeVO;
import moram.vo.PlaceVO;
import moram.vo.TeacherVO;

public interface IManagementService {

	public List<MemberVO> memberInfo()  ; //관리자 페이지에 맴버 리스트 전체출력
//	
//	public int updateMemInfo()  ;   //관리자 가 웹상에서 회원정보 수정
//	
	public List<MoramVO> moramInfo()  ;  //관리자 가 웹상에서 모람 리스트 출력
//	
//	public MemberVO moramMemInfo()  ; //관리자 가 웹상에서 선택한 모람의 가입회원 리스트 전체 출력
//	
	public int moramUpdate(MoramVO vo)  ; // 관리자가 웹상에서 모람의 정보를 수정
	
//	public int updateMoramMem()  ; // 관리자가 웹상에서 모람의 가입회원 정보를 수정
//	
	public List<ClassVO> classInfo2()  ; // 관리자가 웹상에서 클래스를 전체 출력
//	
	public int classUpdate2(ClassVO vo) ; //관리자가 웹상에서 클래스 정보 수정
//	
	public List<FacilitiesVO> facilityListM()   ; // 관리자가 웹상에서 제휴된 시설업체 리스트 전체 출력
//	
	public List<PlaceVO> placeListM() ;  // 관리자가 웹상에서 제휴된 시설업체 장소 리스트 전체 출력
	
	public int updatePlace(PlaceVO vo) ;  // 관리자가 웹상에서 제휴업체의 장소 정보 수정
	
	public int updateFacility(FacilitiesVO vo);
	
	public List<PlaceTimeVO> placeTimeListM(); // 관리자가 웹상에서 제휴된 시설업체 장소의 시간정보 리스트 전체 출력

	public int insertFacility(FacilitiesVO vo) ; // 관리자가 웹상에서 제휴 업체 정보 입력
	
	
	public int insertPlace(PlaceVO vo) ;	// 관리자가 웹상에서 장소 정보를 입력
	
	public List<MemberVO> getWeimMemberList() ; // 모람 위임을 신청한 회원의 리스트를 출력
	
	public List<TeacherVO> getTchAplyList() ; // 모람쌤 승급을 신청한 회원의 리스트를 출력
	
	public List<MoramMemberVO> getMoramjigiList(); // 현재 모람지기 리스트를 출력
	
	public int updateMoramjigi(MoramMemberVO vo) ; // 모람지기 위임
	
	public int updateTeacher(MemberVO vo)  ; // 모람샘 승인
//	
//	public int updateFacility()  ;  // 관리자가 웹상에서 제휴업체 정보 수정
//	
//	public int updatePlace()  ;  // 관리자가 웹상에서 제휴업체의 장소 정보 수정
//	
//	public int deletePlace()  ; // 관리자가 웹상에서 제휴업체의 장소 정보 삭제 
//	
//	public String inserPlaceTimet()  ; // 관리자가 웹상에서 장소의 예약시간 정보 입력
//	
//	public int updatePlaceTime()  ; //관리자가 웹상에서 장소의 예약시간 수정 
//	
//	public int deletePlaceTime()  ; // 관리자가 웹상에서 장소의 예약정보 삭제 
}
