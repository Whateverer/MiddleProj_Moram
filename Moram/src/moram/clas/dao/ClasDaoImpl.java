package moram.clas.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import moram.ibatis.config.SqlMapClientFactory;
import moram.vo.ClassReplyVO;
import moram.vo.ClassVO;
import moram.vo.LectureVO;
import moram.vo.MemberVO;
import moram.vo.ZipVO;

public class ClasDaoImpl implements IClasDao{

	private static IClasDao dao;
	private SqlMapClient smc;
	
	private ClasDaoImpl() {
		smc = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IClasDao getInstance() {
		if(dao == null) {
			dao = new ClasDaoImpl();
		}
		return dao;
	}

	// 모람쌤인지 확인
	@Override
	public int classAcs(ClassVO vo) throws SQLException {
		return (int) smc.queryForObject("class.classAcs", vo);
	}
	
	@Override
	public int youMoramSem(String memId) throws SQLException {
		return (int) smc.queryForObject("class.youMoramSem", memId);
	}
	
	// 클래스 등록
	@Override
	public String classRegist(ClassVO vo) throws SQLException {
		return (String) smc.insert("class.classRegist", vo);
	}
	
	// 클래스 업데이트
	@Override
	public int classInfoUpdate(ClassVO vo) throws SQLException {
		return smc.update("class.classInfoUpdate", vo);
	}
	
	// 클래스 삭제
	@Override
	public int classDelete(ClassVO vo) throws SQLException {
		return smc.update("class.classDelete", vo);
	}
	
	// 클래스 좋아요
	@Override
	public Object classPrefer(ClassVO vo) throws SQLException {
		return smc.insert("class.classPrefer", vo);
	}

	// 클래스 좋아요 취소
	@Override
	public int classNotPrefer(ClassVO vo) throws SQLException {
		return smc.delete("class.classNotPrefer", vo);
	}
	
	// 모든 클래스 출력
	@Override
	public List<ClassVO> allClassList() throws SQLException {
		return smc.queryForList("class.allClassList");
	}

	// 모람쌤 일때만 내가 운영중인 클래스가 출력
	@Override
	public List<ClassVO> semClassList(String memId) throws SQLException {
		return smc.queryForList("class.semClassList", memId);
	}

	// 카테고리별 클래스 출력
	@Override
	public List<ClassVO> categoryClassList(String subName) throws SQLException {
		return smc.queryForList("class.categoryClassList", subName);
	}

	// 강의 등록
	@Override
	public String lectureRegist(LectureVO vo) throws SQLException {
		return (String) smc.insert("class.lectureRegist", vo);
	}

	// 강의 수정
	@Override
	public int lectureUpdate(LectureVO vo) throws SQLException {
		return smc.update("class.lectureUpdate", vo);
	}

	// 강의 삭제
	@Override
	public int lectureDelete(String lectNo) throws SQLException {
		return smc.delete("class.lectureDelete", lectNo);
	}

	// 강의 예약
	@Override
	public String lectureRez(LectureVO vo) throws SQLException {
		return (String) smc.insert("class.lectureRez", vo);
	}

	// 강의 취소
	@Override
	public int lectureNotRez(LectureVO vo) throws SQLException {
		return smc.update("class.lectureNotRez", vo);
	}

	// 각 클래스의 강의 들
	@Override
	public List<LectureVO> lectureOfClass(String clasNo) throws SQLException {
		return smc.queryForList("class.lectureOfClass", clasNo);
	}

	// 각 클래스의 수강 완료한 강의들
	@Override
	public List<LectureVO> completeLecture() throws SQLException {
		return smc.queryForList("class.completeLecture");
	}

	// 모라미가 예약한 강의에 클래스들 출력 (내 클래스
	@Override
	public List<ClassVO> myClassList(String memId) throws SQLException {
		return smc.queryForList("class.myClassList", memId);
	}

	// 댓글 등록
	@Override
	public int classReplyRegist(ClassReplyVO vo) throws SQLException {
		return (int) smc.insert("class.classReplyRegist", vo);
	}

	// 댓글 수정
	@Override
	public int classReplyUpdate(ClassReplyVO vo) throws SQLException {
		return smc.update("class.classReplyUpdate", vo);
	}

	// 댓글 삭제
	@Override
	public int classReplyDelete(String replNo) throws SQLException {
		return smc.delete("class.classReplyDelete", replNo);
	}

	@Override
	public ClassVO classRead(String clasNo) throws SQLException {
		return (ClassVO) smc.queryForObject("class.classRead", clasNo);
	}
	
	// 우편번호 조회
	@Override
	public List<ZipVO> selectByDong(String dong) throws SQLException {
		return smc.queryForList("class.selectByDong", dong);
	}

	@Override
	public List<ClassVO> recClassList(String memId) throws SQLException {
		return smc.queryForList("class.recClassList", memId);
	}

	@Override
	public List<ClassVO> classReplyList(ClassReplyVO vo) throws SQLException {
		// TODO Auto-generated method stub
		return smc.queryForList("class.classReplyList", vo);
	}
	
	// 클래스 이미지 수정
	@Override
	public int classImgUpdate(ClassVO vo) throws SQLException {
		return smc.update("class.classImgUpdate", vo);
	}

	@Override
	public int lectureRezChk(LectureVO vo) throws SQLException {
		return (int) smc.queryForObject("class.lectureRezChk", vo);
	}

	@Override
	public int lectureAgainRezChk(LectureVO vo) throws SQLException {
		return (int) smc.queryForObject("class.lectureAgainRezChk", vo);
	}

	@Override
	public int updateLectureRez(LectureVO vo) throws SQLException {
		return smc.update("class.updateLectureRez", vo);
	}

	@Override
	public int chkClassPrefer(ClassVO vo) throws SQLException {
		return (int) smc.queryForObject("class.chkClassPrefer", vo);
	}

	@Override
	public List<MemberVO> lectureRezList(String lectNo) throws SQLException {
		return smc.queryForList("class.lectureRezList", lectNo);
	}

	@Override
	public List<LectureVO> getClCalendar(String clNo) throws SQLException {
		// TODO Auto-generated method stub
		return smc.queryForList("class.getClCalendar", clNo);
	}



	
	
	
	
}
