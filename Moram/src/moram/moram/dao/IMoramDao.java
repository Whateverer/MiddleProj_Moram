package moram.moram.dao;

import java.sql.SQLException;
import java.util.List;

import moram.vo.AttachVO;
import moram.vo.BoardVO;
import moram.vo.ClassVO;
import moram.vo.DeleteMoramMemberVO;
import moram.vo.MoramMemberVO;
import moram.vo.MoramPreferVO;
import moram.vo.MoramVO;

public interface IMoramDao {
	//모람 개설
	public String insertMoram(MoramVO vo) throws SQLException;
	
	//모람 개설시 모람지기를 모람멤버에 추가
	public String insertMoramjigi(MoramMemberVO vo) throws SQLException;
		
	//모람권 구매여부 체크
	public int moramSubscribeChk(String memId) throws SQLException;
		
	//모람명 중복체크
	public int moramNameChk(String mrname) throws SQLException;
		
	//내 모람 리스트 가져오기
	public List<MoramVO> myMoramList(String memId) throws SQLException;
		
	//내 관심모람 리스트 가져오기
	public List<MoramVO> preferMoramList(String memId) throws SQLException;
		
	//선택한 카테고리의 모람리스트 가져오기
	public List<MoramVO> selCatMoramList(int catNo) throws SQLException;
	
	//가입시 설정한 카테고리랑 같은 모람리스트 가져오기
	public List<MoramVO> sameCatMoramList(String memId) throws SQLException;
	
	// 해당 모람의 이미지들 가져오기 (사진첩)
	public List<AttachVO> imagesList(String mrNo) throws SQLException;
		
	//모람 정보가져오기
	public MoramVO moraminfo(String mrNo) throws SQLException;;
		
	//모람에 가입된 회원인지 체크
	public int moramMemChk(DeleteMoramMemberVO vo) throws SQLException;;
		
	//모람 가입 
	public String insertMoramMember(MoramMemberVO vo) throws SQLException;;
	
	//관심 모람 등록 
	public void insertMoramPrefer(MoramPreferVO vo) throws SQLException;;
		
	//모람정보 수정
	public int updateMoraminfo(MoramVO vo) throws SQLException;;
	
	//모람 링크공유(초대)
	public void moramInvite() throws SQLException;;
	
	//모람 강퇴(탈퇴)
	public int deleteMoramMember(DeleteMoramMemberVO vo) throws SQLException;
	
	//모람 일정 가져오기
	public List<BoardVO> getCalendar(String moramId) throws SQLException;
	
	//모람 인원 수 반환
	public int moramMemCnt(String mrNo) throws SQLException;
	
	//모람의 모든 모라미 목록 가져오기
	public List<MoramMemberVO> getAllMorami(String moramId) throws SQLException;
	
	//모람지기인지 체크하기
	public int MoramjigiChk(MoramMemberVO vo) throws SQLException;
	
	// 모람 관심설정 한 상태인지 체크
	public int chkMoramPrefer(MoramMemberVO vo)throws SQLException; 
		
	// 모람 관심설정
	public Object moramPrefer(MoramMemberVO vo)throws SQLException;

	// 모람 관심해제
	public int moramNotPrefer(MoramMemberVO vo)throws SQLException;
	
	//선택한 일정 출력
	public List<BoardVO> scheduleDetail(BoardVO vo)throws SQLException;
	
	//이미지 경로 수정해서 업데이트
	public int moramImgUpdate(MoramVO vo) throws SQLException;

}