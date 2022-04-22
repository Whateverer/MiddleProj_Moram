package moram.member.Dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import moram.vo.MemberVO;
import moram.vo.MemfavcatVO;

public interface IMemberDao {

	/**
	 * MemberVO에 담겨진 자료를 DB에 insert하는 메서드
	 * 
	 * @param memvo DB에 insert할 자료가 저장된 MemberVO객체
	 * @return insert작업성공 : 1이상의 정수, insert작업 실패 : 0
	 */
	public int insertMember(MemberVO vo) throws SQLException;
	
	/**
	 * 회원ID를 인수값으로 받아서 해당 회원 정보를 삭제하는 메서드
	 * @param memId 삭제할 회원ID
	 * @return 삭제성공 : 1, 삭제실패 : 0
	 */
	public int deleteMember(String mem_id)throws SQLException ;
	
	/**
	 * MemberVO자료를 이용하여 회원 정보를 Update하는 메서드 
	 * @param memvo update할 회원 정보가 저장된 MemberVO객체
	 * @return 수정성공 : 1, 수정실패 : 0
	 */
	public int updateMember(MemberVO vo) throws SQLException;
	
	/**
	 * DB의 회원 테이블의 전체 레코드를 가져와서 
	 * List에 담아서 반환하는 메서드
	 * 
	 * @return MemberVO객체를 담고 있는 List
	 */
	
	
	/**
	 * 회원ID를 인수값으로 받아서 해당 회원데이터의 개수를 반환하는 메서드
	 * 
	 * @param memId 검색할 회원ID
	 * @return 검색된 회원ID 개수
	 */
	public String getMemberCount(String mem_id) throws SQLException;	
	
	public String getMemberEmail(String mem_email) throws SQLException;	
	
	public int insertMemfavcat(MemfavcatVO vo) throws SQLException;
	
	public int updateMember2(Map<String, String> paraMap) throws SQLException;
	
	public MemberVO getLoginMember(MemberVO vo) throws SQLException;
	
	public int updateNewPwd(MemberVO vo) throws SQLException;
	
	public String getFgId(MemberVO vo) throws SQLException;
	
	public  List<MemberVO> getAllMember() throws SQLException;
}
