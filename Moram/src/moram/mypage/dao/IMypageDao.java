package moram.mypage.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import moram.vo.ClassVO;
import moram.vo.MemberVO;
import moram.vo.MoramMemberVO;
import moram.vo.MoramVO;
import moram.vo.PlaceVO;
import moram.vo.SubscribeVO;
import moram.vo.TeacherVO;

public interface IMypageDao {

	public MemberVO memberInfo(String memId) throws SQLException;
	
	public int memberInfoUpdate(MemberVO vo) throws SQLException;
	
	public int youJigi(String memId) throws SQLException;   // 밑에꺼랑 같이 사용하려고 만든 메서드
	
	public String moramSubscribePay(SubscribeVO vo) throws SQLException;
	
	public int passwordChk(Map<String, String> vo) throws SQLException;
	
	public List<PlaceVO> placeTimeRezList(String memId) throws SQLException;
	
	public String placeTimeRezrePay(String PLNO) throws SQLException;
	
	public List<ClassVO> preferClassList(String memId) throws SQLException;
	
	public List<MoramVO> preferMoramList(String memId) throws SQLException;
	
	public Object teacherApply(TeacherVO vo) throws SQLException;
	
	public int memberDelete(String memId) throws SQLException;
	
	public int moramWeim(Map<String, String> morami) throws SQLException;
	
	public int placepayrefund(String payNo) throws SQLException;
	
	public List<MoramVO> mainMoram(String search) throws SQLException;
	
	public List<ClassVO> mainClass(String search) throws SQLException;

	public int passUpdate(Map<String, String> memPass) throws SQLException;
	
	public int moramFive(String memId) throws SQLException;
	
	public int moramHun(String memId) throws SQLException;
	
	public MoramVO moramItzy(String moramName) throws SQLException;
	
	public List<MoramMemberVO> moramiItzy(String memId) throws SQLException;
	
	public List<SubscribeVO> moramPayList(String memId) throws SQLException;
	
	public int moramRefund(String subNo) throws SQLException;
	
	public int moramReset(String memId) throws SQLException;
	
	public int moramPayChk(Map<String, String> idSubNo) throws SQLException;
	
	public int placePayRefund(String payNo) throws SQLException;
}
