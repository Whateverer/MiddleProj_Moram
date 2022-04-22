package moram.clas.dao;

import java.sql.SQLException;
import java.util.List;

import moram.vo.BoardVO;
import moram.vo.ClassReplyVO;
import moram.vo.ClassVO;
import moram.vo.LectureVO;
import moram.vo.MemberVO;
import moram.vo.ZipVO;

public interface IClasDao {

	public int youMoramSem(String memId) throws SQLException;
	
	public int classAcs(ClassVO vo) throws SQLException;
	
	// 클래스 개설
	public String classRegist(ClassVO vo) throws SQLException;
	
	// 우편번호검색
	public List<ZipVO> selectByDong(String dong) throws SQLException;
	
	// 클래스 정보 수정
	public int classInfoUpdate(ClassVO vo) throws SQLException;
	
	// 클래스 삭제
	public int classDelete(ClassVO vo) throws SQLException;
	
	// 클래스 관심설정 한 상태인지 체크
	public int chkClassPrefer(ClassVO vo) throws SQLException;
	
	// 클래스 관심설정
	public Object classPrefer(ClassVO vo) throws SQLException;

	// 클래스 관심해제
	public int classNotPrefer(ClassVO vo) throws SQLException;
	
	// 모든 클래스
	public List<ClassVO> allClassList() throws SQLException;
	
	// 추천 클래스
	public List<ClassVO> recClassList(String memId) throws SQLException;
	
	// 모람쌤일때 내가 운영중인 클래스
	public List<ClassVO> semClassList(String memId) throws SQLException;
	
	// 선택한 카테고리에 해당하는 클래스
	public List<ClassVO> categoryClassList(String subName) throws SQLException;
	
	// 한 클래스 선택시 클래스 정보
	public ClassVO classRead(String clasNo) throws SQLException;
	
	// 클래스 이미지 수정
	public int classImgUpdate(ClassVO vo) throws SQLException;
	
	// 강의 개설
	public String lectureRegist(LectureVO vo) throws SQLException;
	
	// 강의 수정
	public int lectureUpdate(LectureVO vo) throws SQLException;
	
	// 강의 삭제
	public int lectureDelete(String lectNo) throws SQLException;
	
	// 강의 예약 현황
	public List<MemberVO> lectureRezList(String lectNo) throws SQLException;
	
	// 회원이 강의예약
	public String lectureRez(LectureVO vo) throws SQLException;
	
	// 강의예약 취소
	public int lectureNotRez(LectureVO vo) throws SQLException;
	
	// 예약한 강의인지 확인
	public int lectureRezChk(LectureVO vo) throws SQLException;
	
	// 재예약한 강의인지 확인
	public int lectureAgainRezChk(LectureVO vo) throws SQLException;
	
	// 재예약하기
	public int updateLectureRez(LectureVO vo) throws SQLException;
	
	// 강의 목록
	public List<LectureVO> lectureOfClass(String clasNo) throws SQLException;
	
	public List<LectureVO> completeLecture() throws SQLException;
	
	public List<ClassVO> myClassList(String memId) throws SQLException;
	
	// 댓글리스트
	public List<ClassVO> classReplyList(ClassReplyVO vo) throws SQLException;
	
	public int classReplyRegist(ClassReplyVO vo) throws SQLException;
	
	public int classReplyUpdate(ClassReplyVO vo) throws SQLException;
	
	public int classReplyDelete(String replNo) throws SQLException;
	
	// 일정 가져오기
	public List<LectureVO> getClCalendar(String clNo) throws SQLException;
	
}
