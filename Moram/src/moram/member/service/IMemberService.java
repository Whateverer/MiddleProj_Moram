package moram.member.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import moram.vo.MemberVO;
import moram.vo.MemfavcatVO;




/**
 * Service객체는 DAO에 만들어진 메서드를 원하는 작업에 맞게 호출하여
 * 그 결과를 받아서 Controller에게 보내주는 역할을 한다.
 * 
 * @author SEM-PC
 *
 */
public interface IMemberService {

	
	/**
	 * MemberVO에 담겨진 자료를 DB에 insert하는 메서드
	 * 
	 * @param memvo DB에 insert할 자료가 저장된 MemberVO객체
	 * @return insert작업성공 : 1이상의 정수, insert작업 실패 : 0
	 */
	public int insertMember(MemberVO vo);
	
	/**
	 * 회원ID를 인수값으로 받아서 해당 회원 정보를 삭제하는 메서드
	 * @param memId 삭제할 회원ID
	 * @return 삭제성공 : 1, 삭제실패 : 0
	 */
	public int deleteMember(String mem_id);
	
	/**
	 * MemberVO자료를 이용하여 회원 정보를 Update하는 메서드 
	 * @param memvo update할 회원 정보가 저장된 MemberVO객체
	 * @return 수정성공 : 1, 수정실패 : 0
	 */
	public int updateMember(MemberVO vo);
	
	/**
	 * DB의 회원 테이블의 전체 레코드를 가져와서 
	 * List에 담아서 반환하는 메서드
	 * 
	 * @return MemberVO객체를 담고 있는 List
	 */
	public List<MemberVO> getAllMember();
	
	
	/**
	 * 회원ID를 인수값으로 받아서 해당 회원데이터의 개수를 반환하는 메서드
	 * 
	 * @param memId 검색할 회원ID
	 * @return 검색된 회원ID 개수
	 */
	public String getMemberCount(String mem_id) ;
	
	//이메일을 입력받고, 쿼리실행해서 null 이면 이메일 사용가능, !null이면 이용불가
	public String getMemberEmail(String mem_email);	
	
	//회원정보 부분수정용
	public int updateMember2(Map<String, String> paraMap);
	
	// 로그인 세션 저장
	public MemberVO getLoginMember(MemberVO vo);
	// 회원가입시, 카테고리 저장. 
	public int insertMemfavcat(MemfavcatVO vo) ;
	// 비번 까먹었을때, 비번 다시 설정
	public int updateNewPwd(MemberVO vo);
	// 아이디 까먹었을때, 아이디 이메일로 전송 
	public String getFgId(MemberVO vo);
	
}
