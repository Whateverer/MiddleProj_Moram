package moram.moram.service;

import java.sql.SQLException;
import java.util.List;

import moram.vo.AttachVO;
import moram.vo.BoardVO;
import moram.vo.DeleteMoramMemberVO;
import moram.vo.MoramMemberVO;
import moram.vo.MoramPreferVO;
import moram.vo.MoramVO;

public interface IMoramService {
	
	//모람 개설
	public String insertMoram(MoramVO vo);
	
	//모람 개설시 모람지기를 모람멤버에 추가
	public String insertMoramjigi(MoramMemberVO vo);
	
	//모람권 구매여부 체크
	public int moramSubscribeChk(String memId);
	
	//모람명 중복체크
	public int moramNameChk(String mrname);
	
	//내 모람 리스트 가져오기
	public List<MoramVO> myMoramList(String memId);
	
	//내 관심모람 리스트 가져오기
	public List<MoramVO> preferMoramList(String memId);
	
	//선택한 카테고리의 모람리스트 가져오기
	public List<MoramVO> selCatMoramList(int catNo) ;
			
	//가입시 설정한 카테고리랑 같은 모람리스트 가져오기
	public List<MoramVO> sameCatMoramList(String memId);
	
	// 해당 모람의 이미지들 가져오기 (사진첩)
	public List<AttachVO> imagesList(String mrNo);
		
	//모람 정보가져오기
	public MoramVO moraminfo(String mrNo) ;
			
	//모람에 가입된 회원인지 체크
	public int moramMemChk(DeleteMoramMemberVO vo) ;
			
	//모람 가입 
	public String insertMoramMember(MoramMemberVO vo) ;
		
	//관심 모람 등록 
	public void insertMoramPrefer(MoramPreferVO vo);
			
	//모람정보 수정
	public int updateMoraminfo(MoramVO vo) ;
		
	//모람 링크공유(초대)
	public void moramInvite();
		
	//모람 강퇴(탈퇴)
	public int deleteMoramMember(DeleteMoramMemberVO vo);
		
	//모람 일정 가져오기
	public List<BoardVO> getCalendar(String moramId) ;
	
	//모람 인원 수 반환
	public int moramMemCnt(String mrNo);
	
	//모람의 모든 모라미 목록 가져오기
	public List<MoramMemberVO> getAllMorami(String moramId);
	
	//모람지기인지 체크하기
	public int MoramjigiChk(MoramMemberVO vo);
	
	// 모람 관심설정 한 상태인지 체크
	public int chkMoramPrefer(MoramMemberVO vo); 
			
	// 모람 관심설정
	public Object moramPrefer(MoramMemberVO vo);

	// 모람 관심해제
	public int moramNotPrefer(MoramMemberVO vo);
	
	//선택한 일정 출력
	public List<BoardVO> scheduleDetail(BoardVO vo);
	
	//이미지 경로 수정해서 업데이트
	public int moramImgUpdate(MoramVO vo);
	
 
	
}
