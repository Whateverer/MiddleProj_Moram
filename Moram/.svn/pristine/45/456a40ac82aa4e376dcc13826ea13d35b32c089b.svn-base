package moram.clas.service;

import java.sql.SQLException;
import java.util.List;

import moram.vo.ClassReplyVO;
import moram.vo.ClassVO;
import moram.vo.LectureVO;
import moram.vo.MemberVO;
import moram.vo.ZipVO;

public interface IClasService {
	
	public int youMoramSem(String memId);
	
	public int classAcs(ClassVO vo);
	
	// 클래스 개설
	public String classRegist(ClassVO vo);
		
	// 우편번호검색
	public List<ZipVO> selectByDong(String dong);
	
	// 클래스 수정
	public int classInfoUpdate(ClassVO vo);
	
	// 클래스 삭제
	public int classDelete(ClassVO vo);

	// 클래스 관심설정 한 상태인지 체크
	public int chkClassPrefer(ClassVO vo); 
	
	// 클래스 관심설정
	public Object classPrefer(ClassVO vo);

	// 클래스 관심해제
	public int classNotPrefer(ClassVO vo);
	
	// 모든 클래스
	public List<ClassVO> allClassList();
	
	// 추천 클래스
	public List<ClassVO> recClassList(String memId);
	
	// 모람쌤일때 내가 운영중인 클래스
	public List<ClassVO> semClassList(String memId);
	
	// 선택한 카테고리에 해당하는 클래스
	public List<ClassVO> categoryClassList(String subName);
	
	// 한 클래스 선택시 클래스 정보
	public ClassVO classRead(String clasNo);
	
	// 클래스 이미지 수정
	public int classImgUpdate(ClassVO vo);
	
	// 강의 개설
	public String lectureRegist(LectureVO vo);
	
	// 강의 수정
	public int lectureUpdate(LectureVO vo);
	
	// 강의 삭제
	public int lectureDelete(String lectNo);
	
	// 강의 예약 현황
	public List<MemberVO> lectureRezList(String lectNo);
	
	// 회원이 강의예약
	public String lectureRez(LectureVO vo);
	
	// 예약한 강의인지 확인
	public int lectureRezChk(LectureVO vo);
	
	// 재예약한 강의인지 확인
	public int lectureAgainRezChk(LectureVO vo);
	
	// 재예약하기
	public int updateLectureRez(LectureVO vo);
	
	// 강의예약 취소
	public int lectureNotRez(LectureVO vo);
	
	
	public List<LectureVO> lectureOfClass(String clasNo);
	
	public List<LectureVO> completeLecture();
	
	public List<ClassVO> myClassList(String memId);
	
	// 댓글리스트
	public List<ClassVO> classReplyList(ClassReplyVO vo);
	
	// 댓글등록
	public int classReplyRegist(ClassReplyVO vo);
	
	// 댓글수정
	public int classReplyUpdate(ClassReplyVO vo);
	
	// 댓글삭제
	public int classReplyDelete(String replNo);
	// 일정 가져오기
		public List<LectureVO> getClCalendar(String clNo);
}
